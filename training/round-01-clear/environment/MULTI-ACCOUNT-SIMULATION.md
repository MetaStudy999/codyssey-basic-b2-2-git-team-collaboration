# B2-2 R01 — 5계정 듀얼 런타임 협업 시뮬레이션

## 빠른 시작(Quick Start)

이 문서는 B2-2의 실제 팀 미션과 별도로, **동일한 GitHub 학습 계정 5개를 MAC-V와 WIN-V에서 각각 운용**하여 Git/GitHub 협업을 반복 훈련하는 시뮬레이션 기준입니다.

기본 CORE 환경은 다음처럼 고정합니다.

```text
GitHub Account A / B / C / D / E  (총 5개)
                │
        ┌───────┴────────┐
        │                │
      MAC-V            WIN-V
        │                │
학교 공용 Mac         Windows 11 Pro
macOS 사용자 1개      WSL2
        │                │
    OrbStack         Ubuntu 24.04
        │                │
Ubuntu 24.04          Linux User 5개
machine: codyssey        │
        │                ├─ codyssey01 → A
Linux User 5개           ├─ codyssey02 → B
        │                ├─ codyssey03 → C
        ├─ codyssey01 → A├─ codyssey04 → D
        ├─ codyssey02 → B└─ codyssey05 → E
        ├─ codyssey03 → C
        ├─ codyssey04 → D
        └─ codyssey05 → E
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
- [3. CORE 런타임 구조](#3-core-런타임-구조)
- [4. Ubuntu 24.04 공통 실행 기준](#4-ubuntu-2404-공통-실행-기준)
- [5. ADVANCED — 독립 VM/Instance 5개](#5-advanced--독립-vminstance-5개)
- [6. CORE와 VM 방식 비교](#6-core와-vm-방식-비교)
- [7. GitHub CLI 인증 정책](#7-github-cli-인증-정책)
- [8. Workspace와 Repository 정책](#8-workspace와-repository-정책)
- [9. 단계별 학습 순서](#9-단계별-학습-순서)
- [10. Account Identity Gate](#10-account-identity-gate)
- [11. 증빙과 상태 관리](#11-증빙과-상태-관리)

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

원칙:

```text
Linux User 1명
↔ GitHub Account 1개
↔ Git Commit Identity 1개
```

MAC-V와 WIN-V에서도 이 매핑을 바꾸지 않습니다.

## 3. CORE 런타임 구조

### 3.1 MAC-V — 학교 공용 Mac

학교 Mac은 공용 PC이므로 **macOS 호스트 사용자 계정은 1개만 사용**합니다. 호스트에 B2-2용 macOS 사용자 5개를 만들지 않습니다.

```text
학교 공용 Mac
→ macOS 공용/사용 사용자 1개
→ OrbStack
→ Ubuntu 24.04 machine 1개
   이름: codyssey
   ├── codyssey01 → GitHub A
   ├── codyssey02 → GitHub B
   ├── codyssey03 → GitHub C
   ├── codyssey04 → GitHub D
   └── codyssey05 → GitHub E
```

격리는 Ubuntu 내부 Linux User의 HOME 기준으로 수행합니다.

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

MAC-V 특성:

- 학교 공용 Mac 호스트의 개인화/영구 변경을 최소화합니다.
- OrbStack의 `codyssey` Ubuntu 환경 안에서 학습 상태를 분리합니다.
- MAC-V는 Resettable / Ephemeral 성격으로 취급하고 재사용 전 상태를 확인합니다.

### 3.2 WIN-V — Windows 11 Pro + WSL2

WIN-V는 Windows 11 Pro의 WSL2 Ubuntu 24.04 하나를 기본 Runtime으로 사용합니다.

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

Linux HOME 구조는 MAC-V와 동일하게 맞춥니다.

```text
/home/codyssey01
/home/codyssey02
/home/codyssey03
/home/codyssey04
/home/codyssey05
```

WIN-V 특성:

- WSL2 Ubuntu 24.04는 Persistent Runtime으로 사용합니다.
- 기존 설치를 재사용할 때는 먼저 상태와 버전을 확인합니다.
- 이유 없이 재설치하지 않습니다.

## 4. Ubuntu 24.04 공통 실행 기준

MAC-V와 WIN-V의 가상화 계층은 서로 다릅니다.

```text
MAC-V: macOS → OrbStack → Ubuntu 24.04
WIN-V: Windows 11 Pro → WSL2 → Ubuntu 24.04
```

따라서 커널/가상화 구현이 완전히 동일하다고 주장하지 않습니다. 대신 **B2-2에서 사용자가 접하는 Ubuntu 사용자 공간(User Space)과 작업 절차를 동일한 기준으로 맞춥니다.**

### 공통 기준

| 항목 | MAC-V | WIN-V | 기준 |
|---|---|---|---|
| Linux 배포판 | Ubuntu 24.04 | Ubuntu 24.04 | 동일 |
| 논리 Runtime | `codyssey` | `codyssey` | 동일한 학습 이름 |
| Linux 사용자 | `codyssey01~05` | `codyssey01~05` | 동일 |
| HOME | `/home/codysseyXX` | `/home/codysseyXX` | 동일 |
| GitHub 계정 | A~E | 동일 A~E | 동일 |
| Git 인증 | `gh` + HTTPS | `gh` + HTTPS | 동일 |
| Git workflow | GitHub Flow | GitHub Flow | 동일 |
| 저장소 위치 | `~/b2-2-team` | `~/b2-2-team` | 동일 |
| 기본 shell 명령 | Ubuntu/Linux | Ubuntu/Linux | 동일 |
| Mission 검증 | 동일 B2-2 기준 | 동일 B2-2 기준 | 동일 |

공통 도구 기준은 `ubuntu-packages.txt`와 Control Tower의 공통 개발환경 기준을 사용합니다.

각 환경을 시작하면 최소 다음을 확인하여 같은 학습 기준점에 들어왔는지 검증합니다.

```bash
cat /etc/os-release
uname -m
whoami
pwd
git --version
gh --version
```

`uname`의 커널 문자열이 MAC-V와 WIN-V에서 다를 수 있는 것은 정상입니다. B2-2에서는 이를 FAIL로 판정하지 않습니다.

### 동일하게 유지할 것

- Ubuntu major/minor release: 24.04
- Linux 사용자 이름: `codyssey01`~`codyssey05`
- GitHub 계정 매핑 A~E
- HOME 기반 `gh` 인증 분리
- Git commit identity
- Repository clone 위치
- GitHub Flow / PR / Review 규칙
- line ending 정책은 Repository `.gitattributes` 우선
- 실제 Evidence와 Simulation Evidence 분리

## 5. ADVANCED — 독립 VM/Instance 5개

CORE 학습 후에는 같은 GitHub 계정 5개를 사용하여 **각 개발자를 독립 가상 환경으로 분리하는 확장 훈련**도 유지합니다.

### 5.1 MAC-V — OrbStack 독립 machine 5개

```text
학교 Mac
→ macOS 사용자 1개
→ OrbStack
   ├── codyssey01 Ubuntu 24.04 → GitHub A
   ├── codyssey02 Ubuntu 24.04 → GitHub B
   ├── codyssey03 Ubuntu 24.04 → GitHub C
   ├── codyssey04 Ubuntu 24.04 → GitHub D
   └── codyssey05 Ubuntu 24.04 → GitHub E
```

각 machine은 독립 HOME, Git 설정, `gh` 인증, Repository clone, 패키지 상태를 가집니다.

### 5.2 WIN-V — 독립 환경 5개

WIN-V의 5개 독립 환경 실습은 다음 중 하나로 수행할 수 있습니다.

```text
A. WSL2 Ubuntu 24.04 독립 Distribution/Instance 5개
   codyssey01~05

또는

B. Hyper-V/VMware 기반 Ubuntu 24.04 VM 5개
   codyssey01~05
```

이 단계에서는 어떤 방식을 사용할지 실습 시작 시 리소스/격리 목표를 확인하여 선택합니다.

독립 VM/Instance 방식의 목적:

- 실제 5대 개발자 장비에 가까운 격리
- 인증/환경 오염 위험 최소화
- 독립 OS/패키지/네트워크 상태 학습
- Snapshot/Reset 기반 장애·복구 훈련
- CORE Linux User 방식과 결과 비교

주의:

- MAC-V 5개 + WIN-V 5개 = 최대 10개의 독립 가상 환경을 관리하게 됩니다.
- 공식 B2-2 통과에 이 구성이 필요한 것은 아닙니다.
- ADVANCED 실습 때문에 실제 B2-2 Mission 완료를 지연시키지 않습니다.

## 6. CORE와 VM 방식 비교

| 기준 | CORE: Runtime 1개 + Linux User 5개 | ADVANCED: 독립 VM/Instance 5개 |
|---|---:|---:|
| B2-2 Git/GitHub 협업 학습 | 매우 적합 | 매우 적합 |
| GitHub Identity 분리 | 좋음 | 매우 좋음 |
| 환경 격리 | 좋음 | 매우 좋음 |
| 설정 난이도 | 낮음 | 높음 |
| CPU/RAM/디스크 효율 | 매우 좋음 | 낮음 |
| 반복 실습 속도 | 빠름 | 보통 |
| 실제 5대 장비 재현 | 부분 | 높음 |
| 인프라/VM 학습 | 낮음 | 높음 |

채택 순서:

```text
CORE
MAC-V: OrbStack Ubuntu 24.04 `codyssey` + Linux User 5개
WIN-V: WSL2 Ubuntu 24.04 + Linux User 5개
        ↓
CROSS-PLATFORM
MAC-V 5 User ↔ WIN-V 5 User
        ↓
ADVANCED
MAC-V 5 OrbStack machines
WIN-V 5 WSL2 instances 또는 5 VM
```

## 7. GitHub CLI 인증 정책

GitHub 로그인은 `gh`(GitHub CLI)를 기본으로 사용합니다.

각 Linux User 또는 독립 VM/Instance에는 **자신에게 매핑된 GitHub 계정 하나만 인증하는 것을 기본값**으로 합니다.

```text
codyssey01 → gh Account A
codyssey02 → gh Account B
codyssey03 → gh Account C
codyssey04 → gh Account D
codyssey05 → gh Account E
```

인증 방식의 기준 예시:

```bash
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git
```

각 Linux User의 HOME이 분리되므로 CORE 방식에서는 하나의 사용자 안에서 A~E를 계속 `gh auth switch`하는 방식보다 **사용자 전환 자체를 GitHub Identity 전환 Gate로 사용**하는 것을 우선합니다.

비밀정보 보호:

- Token 값을 채팅, Screenshot, Evidence에 기록하지 않습니다.
- `gh auth token`, `gh auth status --show-token` 결과를 Evidence로 사용하지 않습니다.
- 계정 존재와 로그인 사용자만 검증합니다.

## 8. Workspace와 Repository 정책

### CORE Linux User 방식

MAC-V와 WIN-V 모두 같은 경로 규칙을 사용합니다.

```text
/home/codyssey01/b2-2-team
/home/codyssey02/b2-2-team
/home/codyssey03/b2-2-team
/home/codyssey04/b2-2-team
/home/codyssey05/b2-2-team
```

### ADVANCED VM/Instance 방식

각 VM/Instance에서도 동일한 논리 경로를 사용합니다.

```text
~/b2-2-team
```

한 working tree를 여러 GitHub Identity가 공유하지 않습니다.

## 9. 단계별 학습 순서

```text
PHASE S0 — GitHub 학습 계정 A~E 총 5개 확정
PHASE S1 — MAC-V: OrbStack Ubuntu 24.04 `codyssey` 준비
PHASE S2 — MAC-V: codyssey01~05 Linux User 구성
PHASE S3 — MAC-V: 각 User별 gh/Git Identity 검증
PHASE S4 — MAC-V: GitHub Flow 전체 Simulation
PHASE S5 — WIN-V: WSL2 Ubuntu 24.04 준비/검증
PHASE S6 — WIN-V: codyssey01~05 Linux User 구성
PHASE S7 — WIN-V: 각 User별 gh/Git Identity 검증
PHASE S8 — WIN-V: 동일 Simulation 재현
PHASE S9 — MAC-V ↔ WIN-V Cross-platform 협업
PHASE S10 — MAC-V: 독립 OrbStack machine 5개 확장 실습
PHASE S11 — WIN-V: 독립 WSL2 instance/VM 5개 확장 실습
PHASE S12 — CORE/ADVANCED 비교·회고·검증
```

B2-2 공식 Mission 완료를 지연시키지 않도록 S10~S12는 ADVANCED 학습 단계로 이동할 수 있습니다.

## 10. Account Identity Gate

각 작업 시작 전 아래를 확인합니다.

```text
현재 Runtime(MAC-V/WIN-V)
→ Ubuntu 24.04 확인
→ 현재 OS User
→ 현재 GitHub Login
→ Git Commit Identity
→ 현재 Repository
→ 현재 Branch
→ GO / STOP
```

기본 확인 명령:

```bash
cat /etc/os-release
whoami
gh api user --jq '.login'
git config --get user.name
git config --get user.email
git remote -v
git branch --show-current
```

판정 원칙:

```text
Linux User ↔ GitHub Account ↔ Git Commit Identity
```

매핑이 맞지 않으면 **STOP**하고 작업을 시작하지 않습니다.

## 11. 증빙과 상태 관리

Simulation 상태는 실제 B2-2 Mission과 별도로 관리합니다.

```text
B2-2 실제 Mission
🟡 ACTIVE

B2-2 SIM-5 CORE
├── MAC-V / OrbStack `codyssey` / Linux User 5개   ⬜ NOT RUN
├── WIN-V / WSL2 Ubuntu 24.04 / Linux User 5개    ⬜ NOT RUN
└── Cross-platform                                 ⬜ NOT RUN

B2-2 SIM-5 ADVANCED
├── MAC-V / OrbStack machine 5개                  ⬜ NOT RUN
└── WIN-V / WSL2 instance 또는 VM 5개             ⬜ NOT RUN
```

시뮬레이션에서 만든 PR/Review/Conflict/Troubleshooting 기록은 **학습 기록**으로 보존할 수 있지만, 실제 팀의 공식 Evidence로 대체하지 않습니다.
