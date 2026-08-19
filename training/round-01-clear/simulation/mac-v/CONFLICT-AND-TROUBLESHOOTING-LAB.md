# MAC-V 5계정 Simulation — Conflict / Troubleshooting Lab

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

## 목표

```text
Conflict 2+
└─ Non-trivial 1+

Troubleshooting 4종
├─ git commit --amend
├─ git reset --soft HEAD~1
├─ git revert
└─ git stash / git stash pop

모든 GitHub Account A~E가 최소 1개 시나리오에 참여
```

공유 `main`에서 force push, 무합의 rebase, `git reset --hard`를 사용하지 않습니다.

## Conflict 1 — Same-Hunk Non-trivial

참여 예:

```text
Author A / codyssey01
Author B / codyssey02
```

두 branch가 `src/team_message.py`의 **같은 함수/같은 줄 범위**를 서로 다른 의도로 수정합니다.

예:

```python
def team_message(name):
    return f"Hello, {name}"
```

A의 변경 의도:

```text
입력값 trim + 기본값 처리
```

B의 변경 의도:

```text
메시지 형식 변경 + 역할 표시
```

한 PR을 먼저 merge한 뒤 다른 branch에서 최신 `main`을 반영하여 실제 conflict를 발생시킵니다.

기록할 것:

```text
Conflict 발생 branch
충돌 파일
<<<<<<< / ======= / >>>>>>> marker 확인
A의 의도
B의 의도
최종 선택/통합 이유
해결 commit
검증 결과
관련 Issue/PR 링크
```

이 시나리오는 **same file / same hunk**이므로 non-trivial conflict 후보입니다.

## Conflict 2 — Adjacent Behavior Conflict

참여 예:

```text
Author C / codyssey03
Author D / codyssey04
Reviewer E / codyssey05
```

`src/config.py` 또는 `README.md`의 동일한 설정 블록을 C와 D가 서로 다른 순서/값/설명으로 수정합니다.

목적은 conflict marker를 없애는 것 자체가 아니라:

```text
두 변경 의도 확인
→ 팀 의사결정
→ 최종 통합
→ 실행/문서 검증
```

을 기록하는 것입니다.

Conflict가 우연히 발생하지 않으면 억지로 완료 처리하지 않고 branch 상태를 다시 설계하여 **실제 Git conflict가 발생한 경우에만** 카운트합니다.

## Troubleshooting 1 — amend

담당 예: **A**

조건:

```text
아직 push하지 않은 최신 local commit
```

흐름:

```bash
git log -1 --oneline
# 작은 수정 또는 commit message 보완
git add <file>
git commit --amend

git log -1 --oneline
```

기록:

```text
Before commit SHA/subject
왜 amend가 필요했는지
After commit SHA/subject
아직 공유 전이었는지
```

## Troubleshooting 2 — reset --soft

담당 예: **B**

조건:

```text
push 전 local commit
```

흐름:

```bash
git log -2 --oneline
git reset --soft HEAD~1
git status
```

확인:

```text
commit만 취소됨
변경 내용은 staged 상태로 유지됨
```

이후 올바르게 recommit합니다.

`reset --hard`를 사용하지 않습니다.

## Troubleshooting 3 — revert

담당 예: **C**

조건:

```text
이미 push/공유된 commit을 안전하게 취소하는 훈련
```

먼저 취소 대상 SHA를 정확히 확인합니다.

```bash
git log --oneline --decorate -n 10
```

그 다음 feature branch 또는 합의된 안전한 위치에서:

```bash
git revert <target-sha>
```

기록:

```text
Target commit
Revert commit
왜 reset 대신 revert를 선택했는지
결과 검증
```

## Troubleshooting 4 — stash / stash pop

주 담당 예: **D**

공동 확인 예: **E**

D가 아직 commit하지 않은 작업이 있는 상태에서 긴급 branch 전환 상황을 만듭니다.

```bash
git status
git stash push -m "b2-2-sim temporary work"
git stash list
# 다른 안전한 확인 작업 후
git stash pop
git status
```

E는 상황·절차·결과를 검토하고 `docs/troubleshooting-log.md` 기록 품질을 Review합니다.

이렇게 하면 A~E 모두 최소 한 시나리오에 참여할 수 있습니다.

## 참여 매핑 예

| Account | 역할 |
|---|---|
| A | amend + Conflict 1 |
| B | reset --soft + Conflict 1 |
| C | revert + Conflict 2 |
| D | stash operator + Conflict 2 |
| E | stash reviewer + Conflict 2 reviewer |

## 문서 기록 형식

각 시나리오는 Simulation Repository의 다음 파일에 남깁니다.

```text
docs/conflict-resolution.md
docs/troubleshooting-log.md
```

최소 항목:

```text
상황
원인
참여자
Before 상태
명령/절차
의사결정 이유
After 상태
검증 결과
주의점
Issue/PR/Commit 링크
```

## 완료 판정

```text
[ ] 실제 Conflict 2+
[ ] 실제 Non-trivial Conflict 1+
[ ] amend 실제 수행
[ ] reset --soft 실제 수행
[ ] revert 실제 수행
[ ] stash/pop 실제 수행
[ ] Account A~E 모두 최소 1개 기록 참여
[ ] 관련 GitHub/Commit 링크 존재
[ ] Secret 노출 없음
```

문서에 시나리오를 적어 둔 것만으로는 PASS가 아닙니다. 실제 Git history와 GitHub 흐름으로 재현된 경우에만 체크합니다.
