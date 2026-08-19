# B2-2 R01 — Reference Status

## 현재 판정

**Phase A Reference Build: ✅ CORE READY**

**전역 운영 단계: Phase C — FAST EXECUTE / Runtime**

**B2-2 Workcell: 🟡 ACTIVE / CLEAR 아님**

**실제 팀 GitHub Runtime/Evidence: 🟡 PENDING / 최종 검증 전**

Phase A의 `CORE READY`는 현재 Mission 상태가 Phase A에 머물러 있다는 뜻이 아닙니다. Reference Build는 이미 완료된 준비 상태이고, 현재 Workcell은 Phase C에서 실제 팀 협업과 별도의 5계정 학습 Simulation을 진행·검증하는 단계입니다.

B2-2의 평가 핵심은 실제 3~5인 팀의 GitHub 협업 기록입니다. CORE READY는 실제 PR/Review/Conflict를 수행했다는 뜻이 아니라, 실제 Runtime에서 사용할 규칙·템플릿·검증 기준·Evidence index가 준비되었다는 의미입니다.

## Source of Truth

1. `b2-2-mission.pdf`
2. `b2-2-mission.md`
3. `b2-2-evaluation.md`
4. 현재 B2-2 Repository `main`
5. Control Tower 현재 `main`과 `standards/`
6. B2-2 학습·실행 문서

공식 요구와 내부 문서가 충돌하면 공식 Mission/Evaluation이 우선합니다.

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
- [x] B2-2 Beginner Guide 3계층 모듈화
- [x] MAC-V 5계정 Simulation 문서/자동화 준비

## 현재 Phase C에서 검증할 것

### 실제 팀 Runtime

- [ ] 실제 3~5인 팀과 협업 권한
- [ ] 실제 팀 저장소 현재 상태
- [ ] 실제 main Branch Protection 또는 Ruleset
- [ ] main direct push 없이 PR 중심 협업
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

### 5계정 학습 Simulation

- [x] 동일 GitHub Account A~E를 MAC-V/WIN-V에서 공통 사용하도록 설계
- [x] `codyssey01`~`codyssey05` Linux User 매핑 설계
- [x] `gh` + HTTPS 인증 기준
- [x] MAC-V 공용 Mac → OrbStack → Ubuntu 24.04 `codyssey` Runbook
- [ ] MAC-V Runtime 실제 실행
- [ ] WIN-V Runtime 실제 실행
- [ ] Cross-platform Simulation
- [ ] 독립 VM/Instance 5개 ADVANCED Lab

Simulation 완료 여부는 실제 팀 Runtime/Evidence Gate를 대체하지 않습니다.

## 자체감사에서 확인·보완한 핵심

### 1. Reference artifact와 실제 협업 기록 분리

Reference의 `SUBMISSION.md`, conflict/troubleshooting docs는 구조를 제공하지만 실제 Issue/PR/Review 링크를 만들어내지 않습니다. `TODO_RUNTIME`은 Phase C에서 실제 URL/기록으로만 교체합니다.

### 2. GitHub 서버 상태는 로컬 Git만으로 증명할 수 없음

Branch Protection/Ruleset, merged PR, Review, Issue linkage, conversation은 로컬 `.git`만으로 완전히 검증할 수 없습니다. `docs/github-runtime-audit.md`의 기준으로 `gh`/GitHub UI/API 실제 기록을 별도로 확인합니다.

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

Reference mode에서는 필수 skeleton/docs/template, CONTRIBUTING 정책, PR What/Why/How, Issue closing keyword, non-trivial conflict template, troubleshooting 4종, SUBMISSION Evidence 슬롯, Runtime placeholder, Secret-pattern 추적 여부를 확인합니다.

Runtime local mode에서는 실제 team repo 파일/TODO/Git graph/feature branch/명백한 무의미 commit subject/troubleshooting marker를 점검하고, GitHub-hosted 메타데이터는 별도 audit가 필요하다고 명시합니다.

## CLEAR Gate

```text
Reference Build            = ✅ CORE READY
Documentation              = ✅ READY
5계정 Simulation           = 학습용 별도 상태
실제 팀 Runtime/Evidence   = 🟡 PENDING
Evaluation                 = 실제 팀 활동 근거 필요
B2-2 CLEAR                 = ❌ 아직 아님
```

다음 실제 항목이 모두 확인된 경우에만 `✅ B2-2 CLEAR`로 변경합니다.

- [ ] 실제 팀/권한 Evidence
- [ ] Branch Protection/Ruleset Evidence
- [ ] 팀원별 PR/Review/feedback Evidence
- [ ] conflict 2+ / non-trivial 1+ Evidence
- [ ] troubleshooting 4종 / 전원 참여 Evidence
- [ ] simple deliverable 전원 contribution Evidence
- [ ] 실제 `SUBMISSION.md`
- [ ] Secret/Token 노출 없음
- [ ] 공식 Mission/Evaluation 누락 없음
