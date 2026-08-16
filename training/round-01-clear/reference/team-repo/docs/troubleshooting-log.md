# Git Troubleshooting Log — Reference

> 팀 전체가 `amend`, `reset --soft`, `revert`, `stash` 4종을 **실제로 수행**해야 합니다. 각 팀원은 최소 1개 시나리오 기록에 이름/역할이 드러나야 합니다. 아래는 안전한 Runtime 절차와 기록 골격입니다.

## 공통 기록 항목

- 상황
- 참여 팀원 / 역할
- 재현 조건
- 관련 Issue/Branch/PR/Commit
- 실행 전 상태
- 실행 명령
- 실행 후 상태
- 결과
- 왜 이 명령을 선택했는가
- 주의점

---

## Scenario A — `git commit --amend`

### 상황

**아직 원격에 push하지 않은 최근 로컬 commit**의 메시지를 잘못 작성한 상황을 사용합니다.

### 안전 실습

```bash
git status
git log -1 --oneline
git commit --amend -m "docs: clarify team contribution rule"
git log -1 --oneline
```

### 핵심

`amend`는 마지막 commit 자체를 새 commit으로 바꾸므로 commit SHA가 달라집니다. 이미 다른 사람이 사용하는 shared history에는 신중해야 합니다.

### Runtime Evidence

- 참여 팀원: TODO_RUNTIME
- Before SHA/message: TODO_RUNTIME
- After SHA/message: TODO_RUNTIME
- 관련 PR: TODO_RUNTIME

---

## Scenario B — `git reset --soft HEAD~1`

### 상황

**아직 push하지 않은 로컬 commit**을 취소하되 변경 내용은 staged 상태로 유지하고 싶은 경우입니다.

### 안전 실습

```bash
git status
git log -2 --oneline
git reset --soft HEAD~1
git status
git diff --cached
```

필요한 수정 후 다시 commit합니다.

```bash
git commit -m "feat: add corrected utility behavior"
```

### 핵심

`--soft`는 commit pointer를 되돌리지만 작업 내용은 index에 유지합니다. 이미 push된 shared commit을 없애는 용도로 사용하지 않습니다.

### Runtime Evidence

- 참여 팀원: TODO_RUNTIME
- 취소 전 commit: TODO_RUNTIME
- reset 후 staged 변경: TODO_RUNTIME
- 재commit: TODO_RUNTIME

---

## Scenario C — `git revert`

### 상황

이미 remote에 push되고 팀이 볼 수 있는 commit의 효과를 안전하게 취소해야 하는 상황입니다.

### 안전 실습

실습용 feature branch/PR에서 대상 SHA를 확인합니다.

```bash
git log --oneline --decorate -5
git revert <target-sha>
git log --oneline --decorate -5
git show --stat HEAD
```

### 핵심

`revert`는 기존 shared history를 지우지 않고 **반대 변경을 담은 새 commit**을 추가합니다. 그래서 원격 협업에서 추적성과 안전성이 높습니다.

### Runtime Evidence

- 참여 팀원: TODO_RUNTIME
- 대상 commit: TODO_RUNTIME
- revert commit: TODO_RUNTIME
- PR/검증 결과: TODO_RUNTIME

---

## Scenario D — `git stash` / `git stash pop`

### 상황

작업 중인 변경이 있지만 다른 branch로 급히 이동해야 하는 상황입니다.

### 안전 실습

```bash
git status
git stash push -m "b2-2 stash practice"
git status
git stash list
# 필요한 branch 확인/이동 후 원래 branch로 복귀
git stash pop
git status
```

### 핵심

stash는 미완성 작업을 commit하지 않고 임시 보관합니다. `pop`에서 충돌이 날 수 있으므로 적용 후 `git status`를 확인합니다.

### Runtime Evidence

- 참여 팀원: TODO_RUNTIME
- stash 전 변경: TODO_RUNTIME
- stash list: TODO_RUNTIME
- pop 후 복원 결과: TODO_RUNTIME

---

## 4종 비교

| 명령 | 대표 목적 | Shared History 주의 |
|---|---|---|
| `commit --amend` | 최근 로컬 commit 수정 | push 후에는 history rewrite 주의 |
| `reset --soft` | 로컬 commit 취소 + 변경 유지 | shared push commit에 사용 금지 원칙 |
| `revert` | push된 commit 효과 취소 | 새 commit으로 안전하게 기록 유지 |
| `stash/pop` | 미완성 변경 임시 보관 | pop conflict 확인 |

## 완료 조건

- [ ] 4종 모두 실제 수행
- [ ] 각 시나리오에 Before/After
- [ ] 각 팀원 최소 1개 기록 참여
- [ ] 관련 Issue/PR/Commit 추적 가능
