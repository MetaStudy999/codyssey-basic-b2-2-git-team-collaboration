# Contributing Guide — B2-2 Reference

## 1. GitHub Flow

- `main`: 팀 기준에서 항상 깨지지 않는 상태
- 모든 작업은 `feature/*` 브랜치에서 수행
- `main` 직접 push 금지
- PR + 최소 1명 승인 후 병합

## 2. Branch Naming

```text
feature/<issue-number>-<short-topic>
```

예:

```text
feature/12-string-utils
feature/18-contributing-guide
```

한 브랜치에는 가능한 한 하나의 Issue 목적만 담습니다.

## 3. Commit Convention

권장 prefix:

- `feat:` 기능/결과물 추가
- `fix:` 오류 수정
- `docs:` 문서 변경
- `refactor:` 동작 변화 없는 구조 개선
- `test:` 테스트 변경
- `chore:` 설정/보조 작업

좋은 예:

```text
feat: add normalize_email utility
fix: handle empty input in slug helper
docs: document conflict scenario 1
```

금지 예:

```text
update
fix
temp
wip
final
bug fix
edit file
```

## 4. Issue → PR 흐름

1. Issue 생성
2. `feature/<issue>-<topic>` 브랜치 생성
3. 작업 + 의미 있는 commit
4. remote push
5. PR 생성
6. PR 본문에 `Closes #<issue-number>`
7. What / Why / How 작성
8. 본인 외 리뷰어가 실질 코멘트 작성
9. 작성자가 답글 또는 수정 commit으로 피드백 반영
10. 최소 1명 approve
11. `main` merge

## 5. PR 최소 품질

PR 본문 필수:

- **What**: 무엇이 바뀌었는가
- **Why**: 왜 필요한가
- **How**: 어떻게 확인했는가
- **Issue Link**: `Closes #n` 또는 `Fixes #n`

## 6. Review 최소 품질

`LGTM`, `좋아요`만 단독 작성하는 리뷰는 실질 리뷰로 계산하지 않습니다.

최소 1개 이상 다음 형태의 코멘트를 남깁니다.

- 특정 파일/라인의 동작 질문
- 경계값/예외 상황 질문
- 가독성 또는 명명 개선 제안
- 리스크 지적
- 더 단순한 대안 제안
- 테스트 누락 지적

리뷰어와 작성자 사이에 최소 1회 상호작용이 남아야 합니다.

## 7. Conflict 대응 흐름

```text
충돌 발견
→ PR/팀 채널에 공유
→ 두 변경의 의도 확인
→ 담당자 중심으로 해결
→ 로컬 검증
→ PR 업데이트
→ docs/conflict-resolution.md 기록
```

충돌 마커를 보고 한쪽 내용을 기계적으로 삭제하지 않습니다. 두 변경의 목적을 먼저 확인합니다.

## 8. Shared History 안전 규칙

- `main`에서 `git reset --hard`로 원격 히스토리를 되돌리지 않음
- push된 공유 commit 취소는 `git revert` 우선
- 팀 합의 없는 force push 금지
- 팀 합의 없는 shared branch rebase 금지
- `reset --soft`는 아직 공유하지 않은 로컬 commit 실습에 사용
- `rebase -i` 보너스는 개인 feature branch에서만 수행

## 9. Troubleshooting 기록 규칙

모든 시나리오는 다음 항목을 고정합니다.

1. 상황
2. 재현 조건
3. 실행 명령
4. 실행 결과
5. 왜 그 명령을 선택했는가
6. 주의점
7. 참여 팀원
8. 관련 Issue/PR/Commit 링크

## 10. 팀원 최소 기준

전원:

- merged PR 2+
- 다른 사람 PR review 2+
- 본인 PR feedback 반영 1+
- 결과물 기여 commit 1+
- troubleshooting 4종 중 최소 1개 기록 참여
