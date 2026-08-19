# B2-2 R01 — MAC-V 5계정 협업 Simulation

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

## 빠른 시작(Quick Start)

이 문서는 MAC-V의 Ubuntu 24.04 `codyssey` 안에서 Identity Gate 5/5를 통과한 뒤 실제 GitHub 협업 훈련을 수행하는 Runbook입니다.

```text
Identity Gate 5/5
→ Simulation Repository 확정
→ main 보호 정책
→ clone 5개
→ 10 Issue
→ 10 PR
→ Review 10+
→ Feedback 5+
→ Conflict 2+
→ Troubleshooting 4종
→ Simulation SUBMISSION
→ Verification
```

## 📑 목차

- [1. 시작 Gate](#1-시작-gate)
- [2. Simulation Repository](#2-simulation-repository)
- [3. Repository 초기 구조](#3-repository-초기-구조)
- [4. 5계정 작업 배정](#4-5계정-작업-배정)
- [5. Issue → PR 기본 흐름](#5-issue--pr-기본-흐름)
- [6. Review / Feedback](#6-review--feedback)
- [7. Conflict / Troubleshooting](#7-conflict--troubleshooting)
- [8. Evidence / 제출 인덱스](#8-evidence--제출-인덱스)
- [9. 완료 Gate](#9-완료-gate)

## 1. 시작 Gate

다음을 모두 실제 PASS한 뒤 시작합니다.

```text
[ ] OrbStack codyssey = Ubuntu 24.04
[ ] codyssey01~05 존재
[ ] GitHub A~E 인증
[ ] Git identity 5/5
[ ] Identity Gate 5/5
```

하나라도 미완료면 GitHub Issue/PR/Review Simulation을 시작하지 않습니다.

## 2. Simulation Repository

별도 학습용 GitHub Repository를 사용합니다.

```text
권장 이름 예:
codyssey-b2-2-sim-mac-v
```

Repository 이름은 예시이며 실제 생성 이름은 사용자가 정합니다.

다음 저장소는 기본적으로 Simulation Repository로 사용하지 않습니다.

- `MetaStudy999/codyssey-basic-b2-2-git-team-collaboration` — Reference/Training Repository
- 실제 B2-2 3~5인 팀 Repository — 공식 Evidence 대상

Simulation Repository가 확정되면 5개 GitHub Account 모두 Collaboration 가능한지 확인합니다.

### main 보호

훈련을 위해 최소 다음을 적용합니다.

```text
main 직접 push 금지
PR을 통한 변경
approval 1+ 요구
force push 금지
branch deletion 보호 정책 확인
```

설정 화면/Ruleset 정책은 Repository 종류와 GitHub 요금제/조직 정책에 따라 표현이 달라질 수 있으므로 실제 UI/API 결과를 기준으로 확인합니다.

## 3. Repository 초기 구조

간단한 Python utility project를 권장합니다.

```text
README.md
SUBMISSION.md
.github/
  pull_request_template.md
docs/
  CONTRIBUTING.md
  conflict-resolution.md
  troubleshooting-log.md
src/
  math_ops.py
  string_ops.py
  date_ops.py
  list_ops.py
  file_ops.py
```

목적은 복잡한 애플리케이션 개발이 아니라 **협업 흐름 자체를 반복 훈련**하는 것입니다.

## 4. 5계정 작업 배정

상세 배정은 [`TASK-MATRIX.md`](TASK-MATRIX.md)를 사용합니다.

핵심 수량:

```text
A  PR 2+ / Review 2+ / Feedback 1+
B  PR 2+ / Review 2+ / Feedback 1+
C  PR 2+ / Review 2+ / Feedback 1+
D  PR 2+ / Review 2+ / Feedback 1+
E  PR 2+ / Review 2+ / Feedback 1+
```

각 계정은 최소 1회 simple deliverable 코드에 실제 contribution commit을 남깁니다.

## 5. Issue → PR 기본 흐름

각 작업은 다음 순서를 지킵니다.

```text
Issue 생성
→ feature/<issue>-<topic>
→ 코드 변경
→ 의미 있는 Commit
→ Push
→ PR
→ Review
→ Author feedback 반영
→ Approve
→ Merge
```

PR 본문 최소 기준:

```text
Closes #<issue>

## What
무엇을 변경했는가

## Why
왜 필요한가

## How
어떻게 구현/검증했는가
```

한 계정의 PR을 같은 계정이 스스로 Review하지 않습니다.

## 6. Review / Feedback

실질 Review 기준:

- 특정 파일/함수/동작을 근거로 함
- 질문, 위험, 대안, 개선, 테스트 관점 중 하나 이상 포함
- `LGTM`, `좋습니다`만 단독으로 작성하지 않음

각 계정은 최소 1개의 자기 PR에서 실제 Feedback을 받아 변경 commit 또는 설명 보완으로 반영합니다.

```text
Reviewer 의견
→ Author 답변
→ 수정 commit 또는 합리적 설명
→ 재확인
→ Approve
```

`TASK-MATRIX.md`의 두 번째 PR Cycle을 각 계정의 필수 Feedback Cycle로 사용합니다.

## 7. Conflict / Troubleshooting

상세 실습은 [`CONFLICT-AND-TROUBLESHOOTING-LAB.md`](CONFLICT-AND-TROUBLESHOOTING-LAB.md)를 사용합니다.

필수 Simulation 목표:

```text
Conflict 2+
└─ non-trivial 1+

Troubleshooting
├─ commit --amend
├─ reset --soft HEAD~1
├─ revert
└─ stash / stash pop
```

공유 `main`에서 force push나 무합의 history rewrite를 하지 않습니다.

## 8. Evidence / 제출 인덱스

Simulation Repository 자체에도 `SUBMISSION.md`를 만들고 다음을 인덱싱합니다.

```text
Repository URL
Account A~E
Issue 링크
PR 링크
Review 링크
Feedback 적용 링크
Conflict 기록
Troubleshooting 기록
Git graph
```

단, 파일 상단에 반드시 다음을 표시합니다.

```text
TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE
```

Control Repository의 Simulation Evidence 위치:

```text
training/round-01-clear/evidence/simulation/mac-v/
```

## 9. 완료 Gate

MAC-V Simulation을 PASS로 기록하려면 최소 다음을 확인합니다.

```text
[ ] GitHub Account 5/5
[ ] 독립 clone 5/5
[ ] Issue 10+
[ ] merged PR 10+ / 계정별 2+
[ ] substantive Review 10+ / 계정별 2+
[ ] Feedback application 계정별 1+
[ ] simple deliverable contribution 5/5
[ ] Conflict 2+ / non-trivial 1+
[ ] Troubleshooting 4종
[ ] 모든 계정 troubleshooting 참여 1+
[ ] Simulation SUBMISSION.md 완성
[ ] Token/Secret 노출 없음
```

이 Gate를 통과해도:

```text
MAC-V Simulation PASS ≠ B2-2 Mission CLEAR
```

입니다.
