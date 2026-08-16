# Codyssey Basic B2-2 — 친구 3~5명과 함께 프로그램 만드는 법 연습하기

## 현재 훈련 상태

- 구분: **필수 미션 (REQUIRED)**
- Round: **R01 — CLEAR**
- Runtime Mission 상태: **⬜ NOT STARTED**
- Phase A Reference 상태: **CORE READY**

B2-2는 실제 팀 협업 기록이 핵심입니다. Phase A에서는 실제 PR/Review/Conflict를 수행한 것으로 간주하지 않고, Phase C에서 팀이 사용할 Reference Complete Path와 문서/검증 기준을 준비했습니다.

## 공식 원본

- `b2-2-mission.pdf`
- `b2-2-mission.md`
- `b2-2-evaluation.md`

공식 원본은 수정하지 않습니다.

## 시작 위치

- `training/round-01-clear/REFERENCE-STATUS.md` — Phase A 자체감사
- `training/round-01-clear/REFERENCE-BUILD.md` — 기준 경로
- `training/round-01-clear/BEGINNER-GUIDE.md` — Phase C 단계별 실습
- `training/round-01-clear/CHECKLIST.md` — Mission/Evaluation/CLEAR Gate
- `training/round-01-clear/reference/team-repo/` — 실제 팀 저장소용 skeleton
- `training/round-01-clear/docs/github-runtime-audit.md` — GitHub 서버 기록 검증

## Reference Team Repository

```text
reference/team-repo/
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

`TODO_RUNTIME`은 실제 팀의 Issue/PR/Review/Conflict/Commit 링크로만 교체합니다.

## Runtime 최소 기준

### 팀/저장소

- 3~5명
- 팀 저장소 1개
- main Branch Protection/Ruleset
- main 직접 push 금지
- PR + 최소 1명 approve

### 팀원별 전원

- merged PR 2+
- 본인 제외 Review 2+
- 본인 PR feedback 반영 1+
- 간단 결과물 contribution commit 1+
- troubleshooting 기록 참여 1+

### 팀 전체

- conflict 2+, non-trivial 1+
- amend / reset --soft / revert / stash-pop 4종
- 협업 문서 3종
- 실제 SUBMISSION index
- 실제 git graph

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

## Reference 자체감사에서 보강한 점

- 로컬 Git과 GitHub 서버 메타데이터 검증을 분리
- Branch Protection/PR/Review/Issue linkage는 `github-runtime-audit.md`로 실제 확인
- 팀 전체 합계가 아니라 팀원별 최소 수량을 검증
- Review는 개수뿐 아니라 실질 내용과 author interaction을 사람이 확인
- conflict는 문서 주장만이 아니라 실제 PR/commit과 연결
- shared history는 revert 우선, 무합의 force push/rebase 금지
- `environment/verify.sh`가 Reference template/policy/TODO/local Runtime 구조를 점검

## CLEAR 원칙

**Phase A: CORE READY**

**Runtime: ⬜ NOT STARTED / CLEAR 아님**

실제 3~5인 팀 GitHub 활동과 팀원별 최소 수량, conflict/troubleshooting, GitHub 서버 설정, Evidence가 모두 확인된 경우에만 `✅ CLEAR`로 변경합니다.
