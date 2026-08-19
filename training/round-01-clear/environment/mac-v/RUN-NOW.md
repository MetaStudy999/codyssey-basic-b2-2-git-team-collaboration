# B2-2 MAC-V — 지금 실행하기(Run Now)

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

이 문서는 여러 번 멈추지 않고 MAC-V CORE 환경을 **단계 묶음**으로 준비하기 위한 실행 진입점입니다.

```text
학교 공용 Mac
→ OrbStack
→ Ubuntu 24.04 `codyssey`
→ Control Tower Bootstrap
→ codyssey01~05
→ GitHub A~E
→ Identity Gate 5/5
→ Simulation
```

실제 명령 출력이 없으면 PASS로 기록하지 않습니다.

## 1. macOS Host — OrbStack / codyssey 준비

`host-preflight.sh`를 macOS에서 실행할 수 있는 위치에 B2-2 Repository가 있다면:

```bash
bash training/round-01-clear/environment/mac-v/host-preflight.sh --prepare
```

이 스크립트는:

- OrbStack 상태 확인
- 기존 `codyssey` 재사용
- 없을 때만 `ubuntu:noble`로 생성
- 기존 `codyssey`가 Ubuntu 24.04가 아니면 STOP
- machine 삭제/덮어쓰기 금지

을 수행합니다.

Repository가 macOS Host에 없다면 다음 Host 명령으로 같은 사전 점검을 수행합니다.

```bash
orb status
orb list
orb -m codyssey cat /etc/os-release 2>/dev/null || true
```

`codyssey`가 **없다는 것을 확인한 경우에만**:

```bash
orb create ubuntu:noble codyssey
```

그 다음:

```bash
orb -m codyssey cat /etc/os-release
orb -m codyssey uname -m
orb -m codyssey
```

Ubuntu 24.04가 아니면 자동 삭제/재생성하지 않습니다.

## 2. Ubuntu Guest — Repository / CORE 준비

Ubuntu `codyssey` 안에서 수행합니다.

### 2-1. Git bootstrap seed

Control Tower를 clone하려면 Git이 먼저 필요합니다. Git이 이미 있으면 아무 것도 설치하지 않습니다.

```bash
command -v git >/dev/null 2>&1 || {
  sudo apt-get update &&
  sudo apt-get install -y git ca-certificates
}
```

### 2-2. Control Tower 준비

```bash
mkdir -p "$HOME/codyssey"
cd "$HOME/codyssey"

if [ -d codyssey-basic/.git ]; then
  cd codyssey-basic
  git status --short --branch
  git pull --ff-only
else
  git clone https://github.com/MetaStudy999/codyssey-basic.git
  cd codyssey-basic
fi

bash environments/ubuntu/bootstrap.sh --check || {
  bash environments/ubuntu/bootstrap.sh --install &&
  bash environments/ubuntu/bootstrap.sh --check
}
```

### 2-3. B2-2 Repository 준비

```bash
cd "$HOME/codyssey"

if [ -d codyssey-basic-b2-2-git-team-collaboration/.git ]; then
  cd codyssey-basic-b2-2-git-team-collaboration
  git status --short --branch
  git pull --ff-only
else
  git clone https://github.com/MetaStudy999/codyssey-basic-b2-2-git-team-collaboration.git
  cd codyssey-basic-b2-2-git-team-collaboration
fi
```

로컬 변경이 존재해 `git pull --ff-only`이 막히면 변경을 덮어쓰지 말고 STOP합니다.

### 2-4. CORE 시스템 준비

```bash
bash training/round-01-clear/environment/mac-v/prepare-core.sh
```

정상 완료 시 다음까지만 증명합니다.

```text
Ubuntu 24.04                         PASS
Control Tower Bootstrap             PASS
codyssey01~05                       PASS
HOME / Workspace                    PASS
```

아직 GitHub 인증은 증명하지 않습니다.

## 3. GitHub Account A~E 인증

Linux User와 GitHub Account를 고정합니다.

| Linux User | GitHub Account |
|---|---|
| `codyssey01` | A |
| `codyssey02` | B |
| `codyssey03` | C |
| `codyssey04` | D |
| `codyssey05` | E |

각 사용자에 들어가 **본인에게 배정된 계정 하나만** 인증합니다.

예: Account A

```bash
orb -m codyssey -u codyssey01

gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git --hostname github.com

git config --global user.name "<Account A Git name>"
git config --global user.email "<Account A GitHub email 또는 noreply email>"
```

같은 방식으로 `codyssey02`~`codyssey05`까지 수행합니다.

Token, Password, 2FA code, recovery code, private key는 문서/채팅/Evidence에 기록하지 않습니다.

## 4. Identity Gate 5/5

5개 인증이 끝나면 Ubuntu 관리자 세션에서:

```bash
cd "$HOME/codyssey/codyssey-basic-b2-2-git-team-collaboration"

sudo bash training/round-01-clear/environment/mac-v/verify-all-identities.sh \
  <github-A> <github-B> <github-C> <github-D> <github-E>
```

PASS 기준:

```text
codyssey01 ↔ GitHub A ↔ Git Identity A
codyssey02 ↔ GitHub B ↔ Git Identity B
codyssey03 ↔ GitHub C ↔ Git Identity C
codyssey04 ↔ GitHub D ↔ Git Identity D
codyssey05 ↔ GitHub E ↔ Git Identity E
```

하나라도 불일치하면 Issue/Commit/PR/Review Simulation을 시작하지 않습니다.

## 5. 다음 Gate

Identity Gate 5/5 이후에만:

```text
Simulation Repository 확정
→ 사용자별 독립 clone 5개
→ Issue
→ Branch
→ Commit / Push
→ PR
→ Review
→ Feedback
→ Merge
→ Conflict
→ Troubleshooting
→ Simulation Evidence
```

으로 이동합니다.

Simulation Evidence 위치:

- `training/round-01-clear/evidence/simulation/mac-v/`

실제 팀 Evidence 위치:

- `training/round-01-clear/evidence/actual/`

두 Evidence를 혼합하지 않습니다.

## 6. 공용 PC Closeout

학습 종료 시:

- [`CLOSEOUT.md`](CLOSEOUT.md)

를 사용합니다.

특히 5개 Linux User의 `gh` 인증과 브라우저 GitHub 세션을 정리합니다.

## 상태 판정

현재 Repository 반영 상태:

```text
Runbook / Automation     ✅ READY
MAC-V 실제 Runtime       ⬜ NOT RUN
Identity Gate            ⬜ NOT RUN
Simulation               ⬜ NOT RUN
Actual Mission CLEAR     ❌ 아님
```
