# Conflict Resolution Log — Reference

> 실제 팀 Runtime에서 PR/commit/담당자/출력을 채웁니다. Reference 예시를 실제 충돌 기록처럼 제출하지 않습니다.

## 공통 기록 형식

- Scenario:
- 참여 팀원:
- 관련 Issue:
- 관련 Branch/PR:
- 충돌 파일:
- 발생 이유:
- 충돌 마커/상태:
- 해결 의사결정:
- 실행 명령:
- 검증 결과:
- 주의점:

---

## Scenario 1 — 같은 hunk를 다르게 수정하는 비자명 충돌

### 목적

공식 비자명 충돌 기준인 **같은 파일의 같은 hunk(인접 라인)를 서로 다르게 수정**하는 상황을 재현합니다.

### 설계

예를 들어 `src/team_utils.py`의 같은 함수 또는 README의 같은 문단을 두 feature branch에서 서로 다른 의도로 수정합니다.

```text
main
├─ feature/<issue-A>-format-message    : 같은 라인을 A 방식으로 수정
└─ feature/<issue-B>-format-message    : 같은 라인을 B 방식으로 수정
```

먼저 한 PR을 main에 병합한 뒤 두 번째 branch에서 최신 main을 merge/rebase하여 실제 conflict를 발생시킵니다.

### Runtime 기록

- 실제 참여 팀원: TODO_RUNTIME
- 실제 Issue/PR: TODO_RUNTIME
- 실제 충돌 파일/라인: TODO_RUNTIME
- `git status`: TODO_RUNTIME
- 충돌 마커: TODO_RUNTIME
- 양쪽 변경 의도: TODO_RUNTIME
- 최종 선택/통합 이유: TODO_RUNTIME
- 해결 후 테스트: TODO_RUNTIME

---

## Scenario 2 — 두 번째 충돌 기록

팀 전체 최소 2회 요구를 충족하기 위한 별도 시나리오입니다.

### 권장안 A — 같은 인접 라인 충돌

첫 시나리오와 다른 파일/목적으로 동일 hunk conflict를 다시 경험합니다.

### 권장안 B — rename/delete vs modify

공식 비자명 기준의 다른 유형을 경험하려면:

- Branch A: 파일 이동/rename 또는 삭제
- Branch B: 같은 파일 내용 수정

후속 merge/rebase에서 rename/modify 또는 delete/modify 상황을 확인하고 팀 의도에 맞게 해결합니다.

### Runtime 기록

- 실제 유형: TODO_RUNTIME
- 참여 팀원: TODO_RUNTIME
- Issue/PR: TODO_RUNTIME
- 충돌 파일: TODO_RUNTIME
- 발생 이유: TODO_RUNTIME
- 해결 과정: TODO_RUNTIME
- 결과/검증: TODO_RUNTIME

---

## 충돌 마커 설명

```text
<<<<<<< HEAD
현재 branch의 내용
=======
병합하려는 상대 branch의 내용
>>>>>>> other-branch
```

- `<<<<<<<`: 현재 쪽 시작
- `=======`: 양쪽 경계
- `>>>>>>>`: 상대 쪽 끝

마커를 지우는 것 자체가 해결이 아닙니다. 두 변경의 요구사항을 이해한 뒤 최종 내용을 결정하고 테스트해야 합니다.

## 기본 명령 흐름

```bash
git status
git diff
# 파일을 직접 수정해 충돌 해결
git add <resolved-file>
git status
git commit    # merge 상황에 따라 필요
git push
```

공유 branch에서는 팀 합의 없는 `git push --force`를 사용하지 않습니다.
