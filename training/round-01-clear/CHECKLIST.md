# B2-2 Round 01 — Mission Clear Checklist

> Mission 상태는 `⬜ NOT STARTED`, `🟡 ACTIVE`, `⛔ BLOCKED`, `✅ CLEAR`만 사용합니다. 현재는 Reference Build이며 실제 팀 협업은 아직 수행하지 않습니다.

## 현재 상태

- Training Round: **R01 — CLEAR**
- Mission: **B2-2**
- Mission 상태: **⬜ NOT STARTED**
- 작업 모드: **Phase A — REFERENCE BUILD**

## A. Source

- [x] 공식 `b2-2-mission.pdf` 확인
- [x] 공식 `b2-2-mission.md` 확인
- [x] 공식 `b2-2-evaluation.md` 확인
- [x] 필수/보너스 구분
- [x] Reference Complete Path 설계

## B. Reference Build

- [x] `REFERENCE-BUILD.md`
- [x] Team repository skeleton
- [x] PR template
- [x] Issue template
- [x] `docs/CONTRIBUTING.md` 기준본
- [x] `docs/conflict-resolution.md` 기준본
- [x] `docs/troubleshooting-log.md` 기준본
- [x] `SUBMISSION.md` 기준본
- [x] simple deliverable 가이드
- [x] `docs/requirements-mapping.md`
- [x] `docs/evaluation-qa.md`
- [x] `evidence/README.md`
- [x] `environment/verify.sh`
- [x] `BEGINNER-GUIDE.md` Step 01~10
- [x] 실제 팀 활동을 가짜 PASS로 기록하지 않음

## C. Team / Repository Runtime

- [ ] 3~5인 실제 팀
- [ ] 팀 저장소 1개
- [ ] Organization 또는 Collaborator 권한
- [ ] `main` Branch Protection
- [ ] main 직접 push 금지
- [ ] PR을 통한 merge
- [ ] 최소 1명 approve 필요

## D. GitHub Flow / Convention

- [ ] main 항상 팀 기준 정상 상태
- [ ] 실제 `feature/*` 작업 흐름
- [ ] branch naming 실제 적용
- [ ] commit convention 실제 적용
- [ ] 의미 없는 commit 메시지 없음/보완
- [ ] GitHub Flow 선택 이유 3줄 이내 문서화

## E. Issue / PR Traceability

- [ ] 모든 대표 작업 Issue 기반
- [ ] PR에 `Closes #n` 또는 `Fixes #n`
- [ ] PR What
- [ ] PR Why
- [ ] PR How
- [ ] Issue→PR 추적 가능

## F. Member Minimum — 전원 충족

각 실제 팀원별:

- [ ] merged PR 2+
- [ ] 본인 제외 Review 2+
- [ ] 본인 PR에서 feedback 반영 1+
- [ ] 결과물 기여 commit 1+
- [ ] troubleshooting 시나리오 기록 참여 1+
- [ ] `SUBMISSION.md`에 해당 링크 정리

## G. Review Quality

- [ ] 각 대표 PR에 실질 comment 1+
- [ ] LGTM-only 리뷰를 실질 리뷰로 계산하지 않음
- [ ] 특정 파일/라인/리스크/대안/테스트 근거
- [ ] Reviewer ↔ Author 상호작용 1+
- [ ] 작성자 수정 commit 또는 답글 증빙

## H. Conflict

- [ ] 실제 conflict 해결 2회+
- [ ] non-trivial conflict 1회+
- [ ] same hunk 또는 rename/delete vs modify 기준 충족
- [ ] 발생 원인 기록
- [ ] 실제 branch/PR/commit 링크
- [ ] 해결 의사결정 기록
- [ ] 해결 후 test/확인
- [ ] `docs/conflict-resolution.md` 완성

## I. Troubleshooting 4종

- [ ] `git commit --amend`
- [ ] `git reset --soft HEAD~1`
- [ ] `git revert`
- [ ] `git stash` / `git stash pop`
- [ ] 각 시나리오 Before/After
- [ ] 상황/절차/결과/주의점
- [ ] 참여 팀원 이름/역할
- [ ] 팀원별 최소 1개 참여
- [ ] `docs/troubleshooting-log.md` 완성

## J. Simple Deliverable

- [ ] A/B/C 중 실제 선택
- [ ] 선택 결과물 최소 기준 충족
- [ ] 팀원별 최소 1건 실제 기여 commit
- [ ] README에서 결과물/사용 예시/목차 연결

## K. Required Documents

- [ ] 실제 팀 `README.md`
- [ ] 실제 팀 `SUBMISSION.md`
- [ ] 실제 팀 `docs/CONTRIBUTING.md`
- [ ] 실제 팀 `docs/conflict-resolution.md`
- [ ] 실제 팀 `docs/troubleshooting-log.md`
- [ ] `git log --oneline --graph --all` Evidence
- [ ] 모든 `TODO_RUNTIME` 실제 정보로 교체

## L. Evaluation — Process Explanation

- [x] branch 작업 단위 기준 Q&A 준비
- [x] What/Why/How + Issue link 운영 설명 준비
- [x] Review 최소 품질 설명 준비
- [x] conflict 공유→해결→기록 흐름 설명 준비
- [x] 재현 가능한 troubleshooting 기록 항목 준비
- [ ] 실제 팀 사례로 자기 말 설명

## M. Evaluation — Git Concepts

- [x] main 항상 정상 상태 이유 정리
- [x] PR+승인 이유 정리
- [x] Issue/PR 추적성 이유 정리
- [x] reset vs revert 정리
- [x] conflict marker/non-trivial 판단 기준 정리
- [ ] 실제 팀 사례로 자기 말 설명

## N. Evaluation — Situations

- [x] hotfix GitHub Flow 설명 준비
- [x] meaningless pushed commits 대응 준비
- [x] 반복 conflict 예방 준비
- [x] rebase 협업 위험/안전수칙 준비
- [ ] 실제 평가 대응

## O. Verification / Evidence

- [ ] Reference `verify.sh` 실제 실행 0 FAIL
- [ ] Runtime local verify
- [ ] GitHub Branch Protection 실제 확인
- [ ] PR/Review 수량 실제 확인
- [ ] SUBMISSION links 검증
- [ ] Conflict 2+ Evidence
- [ ] Troubleshooting 4종 Evidence
- [ ] Git graph Evidence
- [ ] Secret/credential 노출 없음

## P. Final CLEAR

- [ ] 공식 Mission 요구사항 누락 없음
- [ ] 공식 Evaluation 요구사항 누락 없음
- [ ] 실제 팀 활동 최소량 전원 충족
- [ ] 실제 협업 문서/Evidence 완료
- [ ] 사용자가 Git 개념/대응을 자기 말로 설명 가능
- [ ] **✅ B2-2 CLEAR**
