# MAC-V 5계정 Simulation — Task / Review Matrix

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

## 목적

5개 계정 모두가 최소한 다음을 직접 경험하도록 작업을 배정합니다.

```text
Issue 2+
Merged PR 2+
Review 2+
자기 PR Feedback 반영 1+
Deliverable contribution 1+
```

## Cycle 1 — 기본 기능 PR

| ID | Author | Linux User | 작업 예시 | 1차 Reviewer |
|---|---|---|---|---|
| M01 | A | `codyssey01` | `src/math_ops.py` 기본 산술 함수 | B |
| M02 | B | `codyssey02` | `src/string_ops.py` 문자열 정리 함수 | C |
| M03 | C | `codyssey03` | `src/date_ops.py` 날짜 포맷 함수 | D |
| M04 | D | `codyssey04` | `src/list_ops.py` 목록 유틸 함수 | E |
| M05 | E | `codyssey05` | `src/file_ops.py` 파일명/경로 유틸 함수 | A |

각 작업은 별도 Issue → Branch → Commit → PR로 수행합니다.

## Cycle 2 — 개선/검증 PR

| ID | Author | Linux User | 작업 예시 | 필수 Reviewer |
|---|---|---|---|---|
| M06 | A | `codyssey01` | `math_ops` 예외/경계값 처리 | C |
| M07 | B | `codyssey02` | `string_ops` 입력 검증/문서화 | D |
| M08 | C | `codyssey03` | `date_ops` 옵션/오류 처리 | E |
| M09 | D | `codyssey04` | `list_ops` 빈 값/중복 처리 | A |
| M10 | E | `codyssey05` | `file_ops` 안전한 입력 처리 | B |

Cycle 2의 모든 PR은 **Feedback Application 필수 PR**로 사용합니다.

```text
Reviewer가 구체적 개선 의견 작성
→ Author가 답변
→ 실제 수정 commit 또는 타당한 설명 보완
→ Reviewer 재확인
→ Approve
→ Merge
```

## Review 수량 검산

Reviewer 배정 결과:

```text
Account A = M05 + M09 = Review 2+
Account B = M01 + M10 = Review 2+
Account C = M02 + M06 = Review 2+
Account D = M03 + M07 = Review 2+
Account E = M04 + M08 = Review 2+
```

따라서 5명 모두 최소 Review 2회를 경험합니다.

## Branch 이름

실제 Issue 번호를 사용합니다.

```text
feature/<issue-number>-math-basic
feature/<issue-number>-string-basic
feature/<issue-number>-date-basic
feature/<issue-number>-list-basic
feature/<issue-number>-file-basic
```

Cycle 2도 동일하게 실제 Issue 번호를 사용합니다.

## Commit Message 예

```text
feat: add safe average calculation
fix: handle empty string input
refactor: simplify date formatting

docs: document file path behavior
```

`update`, `fix`, `test`처럼 맥락이 없는 한 단어 commit subject는 피합니다.

## PR 본문

모든 PR:

```text
Closes #<issue-number>

## What
변경 내용

## Why
변경 이유

## How
구현 및 확인 방법
```

## 완료 체크

| Account | Issue 2+ | PR 2+ | Review 2+ | Feedback 1+ | Code contribution |
|---|---|---|---|---|---|
| A | [ ] | [ ] | [ ] | [ ] | [ ] |
| B | [ ] | [ ] | [ ] | [ ] | [ ] |
| C | [ ] | [ ] | [ ] | [ ] | [ ] |
| D | [ ] | [ ] | [ ] | [ ] | [ ] |
| E | [ ] | [ ] | [ ] | [ ] | [ ] |

실제 GitHub 링크로 검증하기 전에는 체크하지 않습니다.
