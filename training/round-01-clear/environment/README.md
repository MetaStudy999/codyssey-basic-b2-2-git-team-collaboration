# B2-2 R01 Environment

## 빠른 시작(Quick Start)

B2-2의 실제 협업 Runtime과 5계정 학습 Simulation을 분리하여 운영합니다.

```text
공식 B2-2 실제 팀 Runtime
→ 실제 Issue / PR / Review / Conflict / Troubleshooting Evidence
→ Verification
→ 조건 충족 시에만 Mission CLEAR

학습 Simulation
→ 동일 GitHub 계정 5개를 MAC-V와 WIN-V에서 각각 사용
→ 양쪽 모두 Ubuntu 24.04 사용자 공간을 공통 기준으로 사용
→ Linux User 5개 방식(CORE)
→ Cross-platform
→ 독립 VM/Instance 5개 방식(ADVANCED)
```

### CORE 실행 환경

```text
MAC-V
학교 공용 Mac
→ macOS 호스트 사용자 1개
→ OrbStack
→ Ubuntu 24.04 machine `codyssey`
→ codyssey01~05 Linux User

WIN-V
Windows 11 Pro
→ WSL2
→ Ubuntu 24.04
→ codyssey01~05 Linux User
```

GitHub 계정은 **총 5개**이며 MAC-V와 WIN-V에서 동일한 계정 A~E를 사용합니다.

### 현재 준비 상태

```text
MAC-V Documentation / Automation  ✅ READY
MAC-V Runtime                      ⬜ NOT RUN
WIN-V Documentation baseline       ✅ DEFINED
WIN-V Runtime                      ⬜ NOT RUN
B2-2 실제 Mission                  🟡 ACTIVE
```

MAC-V 문서와 스크립트가 준비되었다는 뜻이지 실제 OrbStack/Ubuntu/계정/`gh` 실행이 통과했다는 뜻은 아닙니다.

## 📑 목차

- [빠른 시작](#빠른-시작quick-start)
- [환경별 실행 문서](#환경별-실행-문서)
- [Golden Path](#golden-path)
- [Runtime 전 확인](#runtime-전-확인)
- [공통 Ubuntu 24.04 기준](#공통-ubuntu-2404-기준)
- [5계정 Simulation 정책](#5계정-simulation-정책)
- [안전 원칙](#안전-원칙)
- [Reference vs Runtime](#reference-vs-runtime)

## 환경별 실행 문서

### 공통 설계

- [`MULTI-ACCOUNT-SIMULATION.md`](MULTI-ACCOUNT-SIMULATION.md) — 5계정 듀얼 런타임 구조, Ubuntu 24.04 공통 기준, `gh` 인증, Cross-platform, 독립 VM/Instance 5개 확장안

### MAC-V — 우선 진행

- [`mac-v/README.md`](mac-v/README.md) — 학교 공용 Mac → OrbStack → Ubuntu 24.04 `codyssey` → Linux User 5개 전체 단계
- [`mac-v/setup-base.sh`](mac-v/setup-base.sh) — Ubuntu 24.04 확인 후 Git/GitHub CLI 공통 도구 CHECK BEFORE INSTALL
- [`mac-v/setup-users.sh`](mac-v/setup-users.sh) — `codyssey01`~`codyssey05` idempotent 생성/권한 준비
- [`mac-v/verify.sh`](mac-v/verify.sh) — Ubuntu/도구/사용자/HOME/Workspace 구조 검증
- [`mac-v/CLOSEOUT.md`](mac-v/CLOSEOUT.md) — 공용 PC용 gh 로그아웃/브라우저/Secret/OrbStack 종료 절차

MAC-V 실행 순서:

```text
M0 OrbStack 사전 점검
→ M1 Ubuntu 24.04 codyssey 생성/확인
→ M2 공통 도구 준비
→ M3 Linux User 5개 생성
→ M4 gh 계정 A~E 인증
→ M5 Account Identity Gate
→ M6 Repository clone / 협업
→ M7 Runtime Verification
→ M8 Public-PC Closeout
```

## Golden Path

- Ubuntu 24.04
- Git
- GitHub account 5개
- GitHub CLI (`gh`)는 **5계정 Simulation의 기본 인증 도구**로 사용
- Python 3.10+는 간단 결과물 선택 시 사용할 수 있음
- 공식 B2-2는 실제 3~5인 팀

## Runtime 전 확인

각 환경에서 먼저 Ubuntu 기준점을 확인합니다.

```bash
cat /etc/os-release
uname -m
whoami
pwd
git --version
gh --version 2>/dev/null || true
```

계정별 작업 직전에는 추가로 확인합니다.

```bash
gh api user --jq '.login'
git config --get user.name
git config --get user.email
```

GitHub 인증 정보와 Token 값 자체를 채팅/Evidence에 출력하지 않습니다.

## 공통 Ubuntu 24.04 기준

MAC-V와 WIN-V의 가상화 계층은 다릅니다.

```text
MAC-V: macOS → OrbStack → Ubuntu 24.04
WIN-V: Windows 11 Pro → WSL2 → Ubuntu 24.04
```

따라서 커널 구현 자체가 동일한 환경이라는 의미는 아닙니다. B2-2에서는 **Ubuntu 24.04 사용자 공간, 사용자 이름, HOME 경로, 도구, Git/GitHub 작업 절차를 동일한 기준으로 맞추는 것**을 목표로 합니다.

공통 기준:

```text
Ubuntu 24.04
codyssey01~05
/home/codyssey01~05
gh + HTTPS
GitHub Account A~E 동일 매핑
~/b2-2-team
GitHub Flow
Repository .gitattributes 우선
```

`uname`의 커널 문자열이 두 환경에서 다른 것은 정상이며 B2-2 FAIL 사유가 아닙니다.

## 5계정 Simulation 정책

GitHub 학습 계정은 총 5개만 사용하고, **동일한 5개 계정**을 MAC-V와 WIN-V에서 각각 사용합니다.

기본 학습 경로:

```text
CORE
MAC-V: OrbStack Ubuntu 24.04 `codyssey` + codyssey01~05
WIN-V: WSL2 Ubuntu 24.04 + codyssey01~05
        ↓
CROSS-PLATFORM
MAC-V ↔ WIN-V 협업
        ↓
ADVANCED
MAC-V: OrbStack Ubuntu 24.04 machine 5개
WIN-V: WSL2 독립 instance 5개 또는 Ubuntu 24.04 VM 5개
```

Linux User와 GitHub 계정은 1:1로 고정합니다.

```text
codyssey01 → Account A
codyssey02 → Account B
codyssey03 → Account C
codyssey04 → Account D
codyssey05 → Account E
```

## 안전 원칙

- main/shared branch force push 금지
- `reset --soft` 실습은 push 전 로컬 commit에 수행
- push된 commit 취소는 `revert` 실습
- `rebase -i` 보너스는 개인 feature branch에서만
- 실제 충돌 실습 전 작업 파일을 commit/push하여 복구 지점을 확보
- `OS User ↔ GitHub Account ↔ Git Commit Identity`가 맞지 않으면 STOP
- Simulation 기록을 실제 팀 Evidence로 대체하지 않음
- 학교 공용 MAC-V에서는 작업 종료 시 `gh`/브라우저 세션을 정리하고 Token을 남기지 않음

## Reference vs Runtime

Reference Build에서는 정책·템플릿·실습 시나리오를 준비합니다. Branch Protection, PR, Review, conflict count는 실제 GitHub 팀 활동에서만 PASS 처리합니다.

```text
Simulation PASS ≠ Runtime Mission PASS
Simulation Evidence ≠ 실제 팀 Evidence
Simulation CLEAR ≠ B2-2 Mission CLEAR
```
