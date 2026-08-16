# Codyssey Basic B2-2 — 친구 3~5명과 함께 프로그램 만드는 법 연습하기

## 현재 훈련 상태

- 구분: **필수 미션 (REQUIRED)**
- Round: **R01 — CLEAR**
- Mission 상태: **⬜ NOT STARTED**
- 현재 모드: **Phase A — REFERENCE BUILD**

B2-2는 실제 팀 협업 기록이 핵심입니다. 현재는 실제 PR/Review/Conflict를 수행한 것으로 간주하지 않고, Phase C에서 팀이 사용할 Reference Complete Path와 문서/템플릿을 먼저 준비합니다.

## 공식 원본

- `b2-2-mission.pdf`
- `b2-2-mission.md`
- `b2-2-evaluation.md`

공식 원본은 수정하지 않습니다.

## 시작 위치

- `training/round-01-clear/REFERENCE-BUILD.md`
- `training/round-01-clear/BEGINNER-GUIDE.md`
- `training/round-01-clear/CHECKLIST.md`
- `training/round-01-clear/reference/team-repo/`

## Reference Team Repository

```text
training/round-01-clear/reference/team-repo/
├── README.md
├── SUBMISSION.md
├── .github/
│   ├── pull_request_template.md
│   └── ISSUE_TEMPLATE/task.md
├── docs/
│   ├── CONTRIBUTING.md
│   ├── conflict-resolution.md
│   └── troubleshooting-log.md
└── src/README.md
```

실제 팀 저장소를 만들 때 이 구조와 규칙을 기준으로 사용하되, `TODO_RUNTIME`은 실제 Issue/PR/Review/Conflict 링크로만 교체합니다.

## 공식 Runtime 최소 기준

### 팀

- 3~5명
- 팀 저장소 1개
- main Branch Protection
- main 직접 push 금지
- PR merge
- 최소 1명 approve

### 팀원별 전원

- merged PR 2개 이상
- 본인 제외 Review 2개 이상
- 본인 PR feedback 반영 1회 이상
- 간단 결과물 기여 commit 1회 이상
- troubleshooting 시나리오 기록 참여 1개 이상

### 팀 전체

- conflict 해결 2회 이상
- 그중 비자명 conflict 1회 이상
- `amend`, `reset --soft`, `revert`, `stash/pop` 4종 모두 수행
- `docs/CONTRIBUTING.md`
- `docs/conflict-resolution.md`
- `docs/troubleshooting-log.md`
- `SUBMISSION.md`
- `git log --oneline --graph --all` Evidence

## 핵심 협업 흐름

```text
Issue
→ feature/*
→ 의미 있는 commit
→ PR (Closes/Fixes #n + What/Why/How)
→ 실질 Review
→ 작성자 feedback 반영
→ approve
→ main merge
```

## 안전 원칙

- shared `main`에 force push하지 않음
- push된 commit 취소는 `revert` 우선
- `reset --soft`/`amend`는 공유 전 로컬 실습 중심
- 보너스 rebase는 개인 feature branch에서만
- Token/Password/Private Key를 Evidence에 저장하지 않음

## Reference 문서

- `docs/requirements-mapping.md` — 공식 요구 ↔ 실제 Evidence
- `docs/evaluation-qa.md` — 평가 설명 기준
- `evidence/README.md` — 실제 GitHub Evidence 수집 계획
- `environment/verify.sh` — Reference/local Runtime 구조 점검

## CLEAR 원칙

Reference 문서와 템플릿만으로 CLEAR하지 않습니다. 실제 3~5인 팀의 GitHub 활동과 팀원별 최소 수량, conflict/troubleshooting 기록, Evidence가 모두 확인된 경우에만 `✅ CLEAR`로 변경합니다.
