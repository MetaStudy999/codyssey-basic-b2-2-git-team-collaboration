# B2-2 R01 — Reference Build

## 목적

B2-2는 코드 완성보다 **3~5인 팀의 실제 GitHub 협업 기록**이 핵심인 미션입니다. Phase A에서는 팀이 그대로 사용할 규칙·템플릿·충돌/트러블슈팅 시나리오·검증 기준을 준비합니다.

실제 팀원, Issue, PR, Review, Merge, Branch Protection, 충돌 해결 기록은 만들어낸 것처럼 기록하지 않습니다. Phase C에서 실제 팀 활동으로 생성되어야 합니다.

## Source of Truth

1. `b2-2-mission.pdf`
2. `b2-2-mission.md`
3. `b2-2-evaluation.md`

## Reference Complete Path

1. 3~5인 팀 확정
2. 팀 저장소/Collaborator 또는 Organization 구성
3. main Branch Protection 또는 Ruleset: 직접 push 금지, PR, 승인 1명
4. GitHub Flow와 branch naming 확정
5. commit convention 확정
6. Issue → feature branch → PR (`Closes #n`) → Review → 수정 반영 → 승인 → Merge
7. 전원 merged PR 2+
8. 전원 타인 PR Review 2+
9. 전원 본인 PR Review 반영 1+
10. 충돌 해결 2+, 비자명 충돌 1+
11. amend/reset/revert/stash 4종 + 전원 최소 1개 기록 참여
12. 간단 결과물 전원 최소 1건 기여
13. `SUBMISSION.md`, 협업 문서 3종, 실제 git graph
14. local Runtime verify
15. GitHub server metadata audit
16. Evaluation Q&A
17. CLEAR Gate

## Phase A 준비 결과

- [x] Team repo skeleton
- [x] PR template: closing keyword + What/Why/How
- [x] Issue template
- [x] CONTRIBUTING: GitHub Flow/branch/commit/PR/review/shared history
- [x] Conflict 기록 템플릿 + 2회 실습 설계
- [x] 비자명 conflict same-hunk / rename-delete-modify 설계
- [x] Troubleshooting amend/reset/revert/stash 4종 안전 절차
- [x] SUBMISSION 팀원별 contribution/evidence matrix
- [x] simple deliverable 팀원별 기여 가이드
- [x] Requirement/Evidence Mapping
- [x] Evaluation Q&A
- [x] Evidence Guide
- [x] `environment/verify.sh` Reference/local Runtime 검사 강화
- [x] `docs/github-runtime-audit.md` GitHub-hosted metadata 검사
- [x] Beginner Guide
- [x] CHECKLIST Reference/Runtime 분리
- [x] `REFERENCE-STATUS.md`
- [x] 실제 PR/Review/Conflict를 가짜 PASS로 기록하지 않음

## 자체감사 핵심

### GitHub metadata와 local Git 분리

로컬 Git 이력만으로 Branch Protection, Review 품질, Issue linkage, PR conversation을 증명할 수 없습니다. 따라서 local verifier와 GitHub Runtime Audit을 분리했습니다.

### 사람별 최소 기준

팀 전체 합계가 아니라 각 팀원별 PR/Review/feedback/contribution/troubleshooting 기준을 `SUBMISSION.md`에서 실제 링크로 검증합니다.

### 품질 기준

Review는 단순 수량이 아니라 내용과 상호작용을 읽어 판단하고, conflict는 실제 PR/commit 이력과 연결하며, troubleshooting은 상황/절차/결과/주의점/참여자/링크가 재현 가능해야 합니다.

## Phase C에서만 완료할 것

- [ ] 실제 3~5인 팀/권한
- [ ] 실제 Branch Protection/Ruleset
- [ ] 실제 Issue/feature/PR/Review/Merge
- [ ] 팀원별 merged PR 2+
- [ ] 팀원별 타인 Review 2+
- [ ] 팀원별 본인 PR feedback 반영 1+
- [ ] 실질 Review와 author interaction
- [ ] conflict 2+ / non-trivial 1+
- [ ] troubleshooting 4종 + 팀원별 1개 참여
- [ ] simple deliverable 팀원별 commit 1+
- [ ] 실제 SUBMISSION links
- [ ] 실제 git graph
- [ ] local Runtime verify 0 FAIL
- [ ] GitHub server metadata Audit
- [ ] Evaluation 자기 말 설명
- [ ] `✅ B2-2 CLEAR`

## 현재 판정

**Phase A Reference Build: CORE READY**

**Runtime Mission 상태: ⬜ NOT STARTED / CLEAR 아님**

다음 Phase A 작업은 B3-1 자체감사/정합성 마감입니다.
