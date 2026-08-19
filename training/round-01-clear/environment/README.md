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
→ Linux User 5개 방식(CORE)
→ Cross-platform
→ VM/Instance 5개 방식(ADVANCED)
```

상세 설계:

- [`MULTI-ACCOUNT-SIMULATION.md`](MULTI-ACCOUNT-SIMULATION.md) — GitHub 계정 5개를 MAC-V/WIN-V에서 각각 운영하는 학습 시뮬레이션과 VM/Instance 5개 확장안

## 📑 목차

- [빠른 시작](#빠른-시작quick-start)
- [Golden Path](#golden-path)
- [Runtime 전 확인](#runtime-전-확인)
- [5계정 Simulation 정책](#5계정-simulation-정책)
- [안전 원칙](#안전-원칙)
- [Reference vs Runtime](#reference-vs-runtime)

## Golden Path

- Git
- GitHub account
- GitHub CLI (`gh`)는 **5계정 Simulation의 기본 인증 도구**로 사용
- Python 3.10+는 간단 결과물 선택 시 사용할 수 있음
- 공식 B2-2는 실제 3~5인 팀

## Runtime 전 확인

```bash
git --version
gh --version 2>/dev/null || true
git config --get user.name
git config --get user.email
```

GitHub 인증 정보와 Token 값 자체를 채팅/Evidence에 출력하지 않습니다.

## 5계정 Simulation 정책

GitHub 학습 계정은 총 5개만 사용하고, **동일한 5개 계정**을 MAC-V와 WIN-V에서 각각 사용합니다.

기본 학습 경로:

```text
CORE
MAC-V: Ubuntu Runtime 1개 + codyssey01~05 Linux User
WIN-V: Ubuntu Runtime 1개 + codyssey01~05 Linux User
        ↓
CROSS-PLATFORM
MAC-V ↔ WIN-V 협업
        ↓
ADVANCED
MAC-V: codyssey01~05 VM/Instance 5개
WIN-V: codyssey01~05 VM/Instance 5개
```

Linux User와 GitHub 계정은 1:1로 고정합니다.

```text
codyssey01 → Account A
codyssey02 → Account B
codyssey03 → Account C
codyssey04 → Account D
codyssey05 → Account E
```

상세 절차와 비교 기준은 `MULTI-ACCOUNT-SIMULATION.md`를 단일 기준으로 사용합니다.

## 안전 원칙

- main/shared branch force push 금지
- `reset --soft` 실습은 push 전 로컬 commit에 수행
- push된 commit 취소는 `revert` 실습
- `rebase -i` 보너스는 개인 feature branch에서만
- 실제 충돌 실습 전 작업 파일을 commit/push하여 복구 지점을 확보
- `OS User ↔ GitHub Account ↔ Git Commit Identity`가 맞지 않으면 STOP
- Simulation 기록을 실제 팀 Evidence로 대체하지 않음

## Reference vs Runtime

Reference Build에서는 정책·템플릿·실습 시나리오를 준비합니다. Branch Protection, PR, Review, conflict count는 실제 GitHub 팀 활동에서만 PASS 처리합니다.

```text
Simulation PASS ≠ Runtime Mission PASS
Simulation Evidence ≠ 실제 팀 Evidence
Simulation CLEAR ≠ B2-2 Mission CLEAR
```
