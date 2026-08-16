# B2-2 R01 — Reference Status

## 판정

**Phase A Reference Build: CORE READY**

**Runtime Mission: ⬜ NOT STARTED / CLEAR 아님**

B2-2의 평가 핵심은 실제 3~5인 팀의 GitHub 협업 기록입니다. CORE READY는 실제 PR/Review/Conflict를 수행했다는 뜻이 아니라, 팀이 Phase C에서 그대로 사용할 규칙·템플릿·검증 기준·Evidence index가 준비되었다는 의미입니다.

## Source of Truth

- `b2-2-mission.pdf`
- `b2-2-mission.md`
- `b2-2-evaluation.md`

## Phase A 준비 완료

- [x] Reference team repository skeleton
- [x] Issue template
- [x] PR template: Issue link + What/Why/How
- [x] GitHub Flow / branch naming / commit convention
- [x] substantive review minimum quality rule
- [x] review → author response/change interaction rule
- [x] conflict 2+ template / non-trivial conflict scenarios
- [x] amend/reset/revert/stash reproducible troubleshooting template
- [x] team-member minimum contribution matrix in `SUBMISSION.md`
- [x] Requirements → Runtime Verification → Evidence mapping
- [x] Evaluation Q&A
- [x] local Reference/Runtime verifier
- [x] GitHub-hosted metadata audit guide
- [x] Evidence guide
- [x] `TODO_RUNTIME` placeholders retained instead of fake team activity

## 자체감사에서 확인·보완한 핵심

### 1. Reference artifact와 실제 협업 기록 분리

Reference의 `SUBMISSION.md`, conflict/troubleshooting docs는 구조를 제공하지만 실제 Issue/PR/Review 링크를 만들어내지 않습니다. `TODO_RUNTIME`은 Phase C에서 실제 URL/기록으로만 교체합니다.

### 2. GitHub 서버 상태는 로컬 Git만으로 증명할 수 없음

Branch Protection/Ruleset, merged PR, Review, Issue linkage, conversation은 로컬 `.git`만으로 완전히 검증할 수 없습니다. `docs/github-runtime-audit.md`를 추가하여 `gh`/GitHub UI를 통한 별도 Runtime Audit을 명시했습니다.

### 3. 팀원별 최소 수량을 사람 단위로 검증

- merged PR 2+
- 타인 PR Review 2+
- 본인 PR feedback 반영 1+
- simple deliverable commit 1+
- troubleshooting 참여 1+

를 `SUBMISSION.md` 팀원별 섹션과 실제 GitHub 링크로 대조합니다.

### 4. Review 품질은 개수만 자동 검사하지 않음

`LGTM`/`좋아요` 단독 리뷰는 인정하지 않습니다. 파일/라인/동작/리스크/대안/테스트 등을 근거로 한 실질 내용과 작성자 상호작용은 사람이 실제 thread를 읽어 확인합니다.

### 5. conflict 진위 검증

문서에 “충돌 2회”라고 적는 것으로 끝내지 않고 실제 PR/commit 흐름과 연결합니다. 최소 1회는 same-hunk 또는 rename/delete-modify 수준의 비자명 충돌이어야 합니다.

### 6. 공유 이력 안전성

- push된 공유 commit 취소는 `revert`
- `reset --soft`는 공유 전 로컬 시나리오
- 팀 합의 없는 force push/shared rebase 금지

을 Reference policy에 포함했습니다.

### 7. verify 강화

Reference mode에서:

- 필수 skeleton/docs/template 존재
- CONTRIBUTING 정책 키워드
- PR What/Why/How + Issue closing keyword
- non-trivial conflict template
- troubleshooting 4종
- SUBMISSION 팀원별 최소 Evidence 슬롯
- Runtime placeholder 유지
- Secret-pattern file 추적 여부

를 확인합니다.

Runtime local mode에서는 실제 team repo 파일/TODO/Git graph/feature branch/명백한 무의미 commit subject/troubleshooting marker를 점검하고, GitHub-hosted 메타데이터는 별도 audit가 필요하다고 명시합니다.

## Phase C에서만 PASS 처리

- [ ] 실제 3~5인 팀과 협업 권한
- [ ] 실제 main Branch Protection 또는 Ruleset
- [ ] main direct push 없이 PR-only history
- [ ] 실제 Issue→PR linkage
- [ ] 팀원별 merged PR 2+
- [ ] 팀원별 타인 Review 2+
- [ ] 팀원별 본인 PR feedback 반영 1+
- [ ] 실질 Review + author interaction
- [ ] conflict 2+ / non-trivial 1+
- [ ] troubleshooting 4종 + 전원 참여
- [ ] simple deliverable 전원 기여
- [ ] 실제 `SUBMISSION.md` 링크 완성
- [ ] 실제 git graph
- [ ] Evaluation 자기 말 설명
- [ ] `✅ B2-2 CLEAR`

## Phase A Gate

- BLOCKER: **0**
- MAJOR: **0**
- GitHub Runtime-only metadata: **명확히 분리**
- Fake PR/Review/Conflict PASS: **없음**

따라서 B2-2는 Phase A 기준 **CORE READY**로 분류합니다.
