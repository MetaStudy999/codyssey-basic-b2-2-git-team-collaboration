# B2-2 R01 — 5계정 듀얼 런타임 협업 시뮬레이션

## 빠른 시작(Quick Start)

이 문서는 B2-2의 실제 팀 미션과 별도로, **동일한 GitHub 학습 계정 5개를 MAC-V와 WIN-V에서 각각 운용**하여 Git/GitHub 협업을 반복 훈련하는 시뮬레이션 기준입니다.

```text
GitHub Account A / B / C / D / E  (총 5개)
                │
        ┌───────┴───────┐
        │               │
      MAC-V           WIN-V
    A B C D E         A B C D E
```

핵심 상태 규칙:

```text
Simulation PASS ≠ Runtime Mission PASS
Simulation Evidence ≠ 실제 팀 Evidence
Simulation CLEAR ≠ B2-2 Mission CLEAR
```

B2-2 공식 평가는 실제 3~5인 팀의 Issue / PR / Review / Merge / Conflict / Troubleshooting Evidence를 기준으로 합니다. 이 시뮬레이션 기록을 실제 팀원 활동으로 제출하지 않습니다.

## 📑 목차

- [1. 목적](#1-목적)
- [2. 공통 계정 매핑](#2-공통-계정-매핑)
- [3. 권장 방식 — 한 Runtime + Linux 계정 5개](#3-권장-방식--한-runtime--linux-계정-5개)
- [4. 확장 방식 — 독립 VM/Instance 5개](#4-확장-방식--독립-vminstance-5개)
- [5. 두 방식 비교와 채택 기준](#5-두-방식-비교와-채택-기준)
- [6. GitHub CLI 인증 정책](#6-github-cli-인증-정책)
- [7. Workspace와 Repository 정책](#7-workspace와-repository-정책)
- [8. 단계별 학습 순서](#8-단계별-학습-순서)
- [9. Account Identity Gate](#9-account-identity-gate)
- [10. 증빙과 상태 관리](#10-증빙과-상태-관리)

## 1. 목적

이 시뮬레이션의 목적은 B2-2의 핵심인 GitHub Flow와 협업 기록을 반복해서 재현하는 것입니다.

훈련 범위:

```text
Issue
→ feature branch
→ Commit
→ Push
→ Pull Request(PR)
→ Review
→ Review feedback 반영
→ Approve
→ Merge
→ Conflict
→ Troubleshooting
→ Evidence
```

추가로 MAC-V와 WIN-V 양쪽에서 같은 5개의 GitHub Identity를 운용하여 환경 차이와 재현성도 학습합니다.

## 2. 공통 계정 매핑

GitHub 계정은 총 5개만 사용합니다. MAC-V와 WIN-V에서 동일한 5개 계정을 사용합니다.

| 논리 사용자 | GitHub 계정 | MAC-V | WIN-V |
|---|---|---|---|
| `codyssey01` | Account A | Account A | Account A |
| `codyssey02` | Account B | Account B | Account B |
| `codyssey03` | Account C | Account C | Account C |
| `codyssey04` | Account D | Account D | Account D |
| `codyssey05` | Account E | Account E | Account E |

계정 이름은 실제 생성 후 확정하며, 문서에서는 A~E를 논리 이름으로 사용합니다.

## 3. 권장 방식 — 한 Runtime + Linux 계정 5개

B2-2 CORE 학습에는 이 방식을 우선 권장합니다.

### MAC-V

```text
학교 Mac
→ macOS
→ OrbStack
→ Ubuntu 24.04 Runtime 1개
   ├── codyssey01 → GitHub A
   ├── codyssey02 → GitHub B
   ├── codyssey03 → GitHub C
   ├── codyssey04 → GitHub D
   └── codyssey05 → GitHub E
```

### WIN-V

```text
Windows 11 Pro
→ WSL2
→ Ubuntu 24.04 Runtime 1개
   ├── codyssey01 → GitHub A
   ├── codyssey02 → GitHub B
   ├── codyssey03 → GitHub C
   ├── codyssey04 → GitHub D
   └── codyssey05 → GitHub E
```

각 Linux 사용자는 독립 HOME을 사용합니다.

```text
/home/codyssey01
/home/codyssey02
/home/codyssey03
/home/codyssey04
/home/codyssey05
```

각 사용자에게 다음을 분리합니다.

- `~/.gitconfig`
- `~/.config/gh/`
- Repository clone
- shell history
- 작업 파일

장점:

- B2-2 핵심 학습에 집중 가능
- CPU/RAM/디스크 사용량이 작음
- Git/GitHub Identity를 Linux User와 1:1 매핑하기 쉬움
- `gh` 로그인 상태가 사용자 HOME 기준으로 분리됨
- MAC-V/WIN-V 양쪽에서 동일한 구조를 재현하기 쉬움

## 4. 확장 방식 — 독립 VM/Instance 5개

B2-2 CORE 이후 **ADVANCED 환경 격리 훈련**으로 함께 유지합니다.

### MAC-V

```text
MAC-V
├── codyssey01 VM/Instance → GitHub A
├── codyssey02 VM/Instance → GitHub B
├── codyssey03 VM/Instance → GitHub C
├── codyssey04 VM/Instance → GitHub D
└── codyssey05 VM/Instance → GitHub E
```

OrbStack을 사용할 경우 Ubuntu 24.04 기반의 독립 Linux machine/instance 5개를 `codyssey01`~`codyssey05` 이름으로 구성하는 방식을 우선 검토합니다.

### WIN-V

```text
WIN-V
├── codyssey01 VM/Instance → GitHub A
├── codyssey02 VM/Instance → GitHub B
├── codyssey03 VM/Instance → GitHub C
├── codyssey04 VM/Instance → GitHub D
└── codyssey05 VM/Instance → GitHub E
```

WIN-V에서는 WSL2의 독립 Ubuntu instance/distribution 또는 별도 Hyper-V/VMware VM을 사용할 수 있습니다. 어떤 구현을 사용할지는 해당 실습을 시작할 때 리소스 사용량과 격리 목표를 확인한 후 확정합니다.

각 VM/Instance는 다음을 독립적으로 가집니다.

- OS 사용자/HOME
- Git 설정
- GitHub CLI 인증
- Repository clone
- 패키지와 런타임
- 네트워크/시스템 설정

장점:

- 실제 5대의 개발자 장비에 가까운 격리
- 인증/환경 오염 위험 최소화
- 독립 OS, 패키지, 네트워크 차이까지 학습 가능
- Snapshot/Reset 기반 장애·복구 훈련으로 확장 가능

주의:

- MAC-V 5개 + WIN-V 5개 = 최대 10개 VM/Instance를 관리하므로 B2-2 핵심보다 인프라 관리 비중이 커질 수 있습니다.
- 공식 B2-2 통과에 VM 5개가 필요한 것은 아닙니다.

## 5. 두 방식 비교와 채택 기준

| 기준 | 한 Runtime + Linux User 5개 | 독립 VM/Instance 5개 |
|---|---:|---:|
| B2-2 Git/GitHub 협업 학습 | 매우 적합 | 매우 적합 |
| GitHub Identity 분리 | 좋음 | 매우 좋음 |
| 환경 격리 | 좋음 | 매우 좋음 |
| 설정 난이도 | 낮음 | 높음 |
| CPU/RAM/디스크 효율 | 매우 좋음 | 낮음 |
| 반복 실습 속도 | 빠름 | 보통 |
| 실제 5대 장비 재현 | 부분 | 높음 |
| 인프라/VM 학습 | 낮음 | 높음 |

채택 기준:

```text
CORE
한 Runtime + Linux User 5개
        ↓
CROSS-PLATFORM
MAC-V 5 User ↔ WIN-V 5 User
        ↓
ADVANCED
MAC-V 5 VM/Instance + WIN-V 5 VM/Instance
```

즉, **계정 5개 방식은 기본 훈련**, **VM/Instance 5개 방식은 같은 5개 GitHub 계정으로 수행하는 확장 훈련**으로 함께 운영합니다.

## 6. GitHub CLI 인증 정책

GitHub 로그인은 `gh`(GitHub CLI)를 기본으로 사용합니다.

각 Linux User 또는 VM/Instance에는 **자신에게 매핑된 GitHub 계정 하나만 인증하는 것을 기본값**으로 합니다.

예:

```text
codyssey01 → gh Account A
codyssey02 → gh Account B
codyssey03 → gh Account C
codyssey04 → gh Account D
codyssey05 → gh Account E
```

인증 방식의 기준 예시는 다음과 같습니다.

```bash
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git
```

비밀정보 보호:

- Token 값을 채팅, Screenshot, Evidence에 기록하지 않습니다.
- `gh auth token`, `gh auth status --show-token` 결과를 Evidence로 사용하지 않습니다.
- 계정 존재와 로그인 사용자만 검증합니다.

## 7. Workspace와 Repository 정책

### Linux User 방식

각 사용자가 자신의 HOME 아래에 독립 clone을 가집니다.

```text
/home/codyssey01/b2-2-team
/home/codyssey02/b2-2-team
/home/codyssey03/b2-2-team
/home/codyssey04/b2-2-team
/home/codyssey05/b2-2-team
```

### VM/Instance 방식

각 VM/Instance 안에서 동일한 기준 경로를 사용합니다.

```text
~/b2-2-team
```

한 working tree를 여러 계정이 공유하지 않습니다.

## 8. 단계별 학습 순서

```text
PHASE S0 — 5개 GitHub 학습 계정 확정
PHASE S1 — MAC-V: Linux User 5개 방식 구성
PHASE S2 — MAC-V: GitHub Flow 전체 Simulation
PHASE S3 — WIN-V: Linux User 5개 방식 구성
PHASE S4 — WIN-V: 동일 Simulation 재현
PHASE S5 — MAC-V ↔ WIN-V Cross-platform 협업
PHASE S6 — MAC-V: VM/Instance 5개 확장 실습
PHASE S7 — WIN-V: VM/Instance 5개 확장 실습
PHASE S8 — 두 방식 비교/회고/검증
```

B2-2 공식 Mission 완료를 지연시키지 않도록 S6~S8은 필요 시 ADVANCED 학습 단계로 이동할 수 있습니다.

## 9. Account Identity Gate

각 작업 시작 전 아래를 확인합니다.

```text
현재 Runtime
→ 현재 OS User
→ 현재 GitHub Login
→ Git Commit Identity
→ 현재 Repository
→ 현재 Branch
→ GO / STOP
```

기본 확인 명령:

```bash
whoami
gh api user --jq '.login'
git config --get user.name
git config --get user.email
git remote -v
git branch --show-current
```

판정 원칙:

```text
OS User ↔ GitHub Account ↔ Git Commit Identity
```

매핑이 맞지 않으면 **STOP**하고 작업을 시작하지 않습니다.

## 10. 증빙과 상태 관리

Simulation 상태는 실제 B2-2 Mission과 별도로 관리합니다.

```text
B2-2 실제 Mission
🟡 ACTIVE

B2-2 SIM-5
├── MAC-V / Linux User 5개        ⬜ NOT RUN
├── WIN-V / Linux User 5개        ⬜ NOT RUN
├── Cross-platform                ⬜ NOT RUN
├── MAC-V / VM-Instance 5개       ⬜ NOT RUN
└── WIN-V / VM-Instance 5개       ⬜ NOT RUN
```

시뮬레이션에서 만든 PR/Review/Conflict/Troubleshooting 기록은 **학습 기록**으로 보존할 수 있지만, 실제 팀의 공식 Evidence로 대체하지 않습니다.
