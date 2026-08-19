# B2-2 R01 — MAC-V 5계정 학습 시뮬레이션

## 빠른 시작(Quick Start)

학교 **공용 Mac**에서는 macOS 사용자 계정을 여러 개 만들지 않습니다. macOS 호스트 사용자 1개에서 OrbStack의 Ubuntu 24.04 machine `codyssey`를 사용하고, 그 Ubuntu 안에 Linux 사용자 5개를 만들어 동일한 GitHub 학습 계정 5개를 각각 1:1로 연결합니다.

```text
학교 공용 Mac
→ macOS 사용자 1개
→ OrbStack
→ Ubuntu 24.04 machine: codyssey
   ├── codyssey01 → GitHub Account A
   ├── codyssey02 → GitHub Account B
   ├── codyssey03 → GitHub Account C
   ├── codyssey04 → GitHub Account D
   └── codyssey05 → GitHub Account E
```

상태 규칙:

```text
MAC-V Documentation Ready
≠ MAC-V Runtime PASS
≠ Simulation CLEAR
≠ B2-2 Mission CLEAR
```

현재 이 문서는 **실행 계획과 자동화 도구를 준비한 상태**입니다. 실제 Mac에서 실행하기 전에는 Runtime PASS로 기록하지 않습니다.

## 📑 목차

- [1. 목표 구조](#1-목표-구조)
- [2. 공용 PC 보안 원칙](#2-공용-pc-보안-원칙)
- [3. Phase M0 — OrbStack 사전 점검](#3-phase-m0--orbstack-사전-점검)
- [4. Phase M1 — Ubuntu 24.04 codyssey 준비](#4-phase-m1--ubuntu-2404-codyssey-준비)
- [5. Phase M2 — 공통 도구 준비](#5-phase-m2--공통-도구-준비)
- [6. Phase M3 — Linux 사용자 5개 생성](#6-phase-m3--linux-사용자-5개-생성)
- [7. Phase M4 — GitHub 계정 5개 gh 인증](#7-phase-m4--github-계정-5개-gh-인증)
- [8. Phase M5 — Account Identity Gate](#8-phase-m5--account-identity-gate)
- [9. Phase M6 — Repository clone과 협업 시작](#9-phase-m6--repository-clone과-협업-시작)
- [10. Phase M7 — MAC-V Runtime Verification](#10-phase-m7--mac-v-runtime-verification)
- [11. Phase M8 — 공용 PC 종료/정리](#11-phase-m8--공용-pc-종료정리)
- [12. PASS 기준](#12-pass-기준)

## 1. 목표 구조

### Host

```text
학교 공용 Mac
└── macOS 사용자: 기존 공용/사용 계정 1개
```

B2-2 학습을 위해 macOS 사용자 `codyssey01`~`codyssey05`를 만들지 않습니다.

### Virtual Runtime

```text
OrbStack
└── codyssey
    └── Ubuntu 24.04 LTS (Noble)
```

OrbStack 공식 CLI에서 Ubuntu 24.04는 `ubuntu:noble`로 지정할 수 있습니다.

### Linux users

```text
/home/codyssey01
/home/codyssey02
/home/codyssey03
/home/codyssey04
/home/codyssey05
```

각 사용자별로 다음을 독립적으로 유지합니다.

- GitHub CLI(`gh`) 인증
- `~/.gitconfig`
- `~/.config/gh/`
- Git repository clone
- shell history
- B2-2 작업 파일

## 2. 공용 PC 보안 원칙

MAC-V는 학교 공용 PC이므로 일반 개인 장비보다 보안 기준을 강화합니다.

### 필수

- B2-2 Simulation에는 **학습용 GitHub 계정**만 사용합니다.
- 개인 주계정의 Token/SSH private key를 저장하지 않습니다.
- `gh auth token`, `gh auth status --show-token`을 실행하거나 Evidence에 저장하지 않습니다.
- 브라우저에 GitHub 비밀번호 저장을 허용하지 않습니다.
- 작업 종료 시 각 Linux 사용자의 `gh` 로그아웃을 확인합니다.
- 필요한 Evidence는 GitHub 원격에 push한 뒤 로컬에만 남기지 않습니다.

### 권장

MAC-V는 **Resettable / Ephemeral** 환경으로 취급합니다.

```text
사용 시작
→ codyssey 상태 확인
→ 학습 수행
→ GitHub 원격 Evidence 확인
→ gh 로그아웃
→ 필요 시 machine stop
→ 장기 보존 필요가 없고 백업 확인 후에만 machine 삭제 검토
```

`orb delete codyssey`는 파괴적 명령이므로 자동화 스크립트에 넣지 않습니다.

## 3. Phase M0 — OrbStack 사전 점검

### macOS Terminal에서 확인

```bash
orb status
orb list
```

판정:

- OrbStack이 실행 중이면 계속합니다.
- `codyssey`가 이미 있으면 **새로 만들지 않고 먼저 확인**합니다.
- `codyssey`가 없을 때만 M1의 생성 명령을 사용합니다.

기존 `codyssey`를 확인할 때:

```bash
orb -m codyssey cat /etc/os-release
```

`VERSION_ID="24.04"`가 아니면 자동 삭제/덮어쓰기를 하지 않고 STOP합니다.

## 4. Phase M1 — Ubuntu 24.04 codyssey 준비

### `codyssey`가 없을 때만

```bash
orb create ubuntu:noble codyssey
```

OrbStack 공식 문서 기준 `ubuntu:noble`은 Ubuntu 24.04 LTS입니다.

생성 후 확인:

```bash
orb -m codyssey cat /etc/os-release
orb -m codyssey uname -m
```

Ubuntu 기준:

```text
ID=ubuntu
VERSION_ID=24.04
```

CPU architecture는 학교 Mac 하드웨어에 따라 `arm64/aarch64` 또는 `amd64/x86_64`일 수 있습니다. B2-2에서는 Ubuntu 24.04 사용자 공간과 Git/GitHub 절차 일치를 핵심 기준으로 사용합니다.

## 5. Phase M2 — 공통 도구 준비

Ubuntu `codyssey`의 기본 사용자로 들어갑니다.

```bash
orb -m codyssey
```

이 저장소의 MAC-V 환경 도구는 다음 파일로 관리합니다.

```text
environment/mac-v/setup-base.sh
environment/mac-v/setup-users.sh
environment/mac-v/verify.sh
```

Repository를 준비한 뒤:

```bash
sudo bash training/round-01-clear/environment/mac-v/setup-base.sh
sudo bash training/round-01-clear/environment/mac-v/setup-users.sh
```

`setup-base.sh`는 **CHECK BEFORE INSTALL** 원칙으로 Git/GitHub CLI 등의 존재 여부를 먼저 확인하고 필요한 항목만 설치합니다.

## 6. Phase M3 — Linux 사용자 5개 생성

생성 대상:

```text
codyssey01
codyssey02
codyssey03
codyssey04
codyssey05
```

정책:

- 각 사용자 HOME 생성
- shell: `/bin/bash`
- 기본적으로 `sudo` 그룹에 추가하지 않음
- 각 HOME은 사용자별 격리를 위해 `700`
- 각 사용자에 `~/b2-2-team` 작업 디렉터리 준비
- 비밀번호/Secret을 Repository에 저장하지 않음

OrbStack은 표준 `adduser`/`useradd`로 추가 Linux 사용자를 만들 수 있으며 `orb -m codyssey -u <user>` 형식으로 직접 접속할 수 있습니다.

사용자 접속 예:

```bash
orb -m codyssey -u codyssey01
```

## 7. Phase M4 — GitHub 계정 5개 gh 인증

각 Linux 사용자는 **자신에게 배정된 GitHub 계정 하나만** 인증합니다.

| Linux User | GitHub Account |
|---|---|
| `codyssey01` | Account A |
| `codyssey02` | Account B |
| `codyssey03` | Account C |
| `codyssey04` | Account D |
| `codyssey05` | Account E |

각 사용자 세션에서:

```bash
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git --hostname github.com
```

GitHub CLI는 `gh auth login`의 web flow를 지원하며, `gh auth setup-git`은 Git이 `gh`를 credential helper로 사용하도록 구성합니다.

주의:

- Linux 환경에서 안전한 credential store를 찾지 못하면 GitHub CLI가 자격 증명을 파일에 저장할 수 있으므로 공용 PC에서는 **종료 시 로그아웃이 필수**입니다.
- Token 값을 직접 출력하지 않습니다.

## 8. Phase M5 — Account Identity Gate

Git 작업을 시작하기 전 각 계정에서 반드시 확인합니다.

```bash
whoami
gh api user --jq '.login'
git config --get user.name
git config --get user.email
```

Git identity가 아직 없으면 해당 사용자에서만 설정합니다.

```bash
git config --global user.name "<학습 계정 표시 이름>"
git config --global user.email "<해당 GitHub 계정 이메일>"
```

PASS 조건:

```text
Linux User
↔ GitHub Login
↔ Git Commit Identity
```

세 항목의 매핑이 맞아야 합니다.

예:

```text
codyssey03
↔ GitHub Account C
↔ Account C의 Git name/email
```

불일치하면 **STOP**하고 Issue/Commit/PR/Review를 만들지 않습니다.

## 9. Phase M6 — Repository clone과 협업 시작

각 Linux 사용자는 자신의 HOME 아래에 **별도 clone**을 가집니다.

```text
/home/codyssey01/b2-2-team
/home/codyssey02/b2-2-team
/home/codyssey03/b2-2-team
/home/codyssey04/b2-2-team
/home/codyssey05/b2-2-team
```

하나의 working tree를 5개 계정이 공유하지 않습니다.

각 사용자에서 GitHub 계정 확인 후 실제 Simulation Repository를 clone합니다.

이후 흐름:

```text
Issue
→ feature/<issue>-<topic>
→ Commit
→ Push
→ PR(What/Why/How + Closes #n)
→ 다른 계정 Review
→ Author feedback 반영
→ Approve
→ Merge
→ Evidence
```

## 10. Phase M7 — MAC-V Runtime Verification

시스템 구성 검증:

```bash
sudo bash training/round-01-clear/environment/mac-v/verify.sh
```

계정별 추가 검증:

```bash
whoami
gh auth status --active --hostname github.com
gh api user --jq '.login'
git config --get user.name
git config --get user.email
```

Token을 화면이나 Evidence에 노출하지 않습니다.

## 11. Phase M8 — 공용 PC 종료/정리

상세 절차는 [`CLOSEOUT.md`](CLOSEOUT.md)를 사용합니다.

핵심 순서:

```text
모든 변경 Commit/Push 확인
→ GitHub 원격 Evidence 확인
→ 각 계정 gh logout
→ 브라우저 GitHub 세션 정리
→ Secret/Token 잔존 여부 점검
→ 필요 시 OrbStack machine stop
→ 백업 확인 후에만 수동 삭제 검토
```

## 12. PASS 기준

### Documentation Ready

- [x] MAC-V 구조 정의
- [x] Ubuntu 24.04 기준 정의
- [x] Linux User 5개 정책 정의
- [x] `gh` 인증 정책 정의
- [x] 설치 스크립트 준비
- [x] 사용자 생성 스크립트 준비
- [x] 검증 스크립트 준비
- [x] 공용 PC Closeout 정책 준비

### Runtime PASS — 실제 실행 후에만

- [ ] OrbStack 실행 확인
- [ ] `codyssey` machine 존재
- [ ] Ubuntu 24.04 확인
- [ ] Git 설치/버전 확인
- [ ] GitHub CLI 설치/버전 확인
- [ ] `codyssey01`~`codyssey05` 실제 존재
- [ ] 각 HOME 소유권/권한 PASS
- [ ] GitHub A~E 각각 올바른 Linux User에 인증
- [ ] 각 사용자 Git name/email 설정
- [ ] Account Identity Gate 5/5 PASS
- [ ] Repository clone 5/5
- [ ] Secret/Token 노출 없음

MAC-V Runtime PASS는 학습 환경의 실행 통과일 뿐이며 실제 B2-2 Mission CLEAR를 의미하지 않습니다.

## 공식 참고

- OrbStack Linux machines: https://docs.orbstack.dev/machines
- OrbStack commands: https://docs.orbstack.dev/machines/commands
- OrbStack distributions: https://docs.orbstack.dev/machines/distros
- GitHub CLI Linux install: https://github.com/cli/cli/blob/trunk/docs/install_linux.md
- GitHub CLI auth login: https://cli.github.com/manual/gh_auth_login
- GitHub CLI auth setup-git: https://cli.github.com/manual/gh_auth_setup-git
