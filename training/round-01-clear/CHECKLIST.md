# B2-2 Round 01 — Mission Clear Checklist

> B2-2의 핵심은 실제 3~5인 팀 GitHub 협업 기록입니다. **Phase A CORE READY는 실제 협업 PASS/CLEAR가 아닙니다.**

## 현재 상태

- Training Round: **R01 — CLEAR**
- Mission: **B2-2**
- Runtime Mission 상태: **⬜ NOT STARTED**
- Phase A Reference 상태: **CORE READY**
- 5계정 Simulation 문서 상태: **✅ DOCUMENTATION READY**
- MAC-V Simulation Runtime: **⬜ NOT RUN**
- WIN-V Simulation Runtime: **⬜ NOT RUN**

## A. Source / Reference

- [x] `b2-2-mission.pdf` 확인
- [x] `b2-2-mission.md` 확인
- [x] `b2-2-evaluation.md` 확인
- [x] 필수/보너스 구분
- [x] Team repo skeleton
- [x] PR/Issue templates
- [x] `docs/CONTRIBUTING.md`
- [x] `docs/conflict-resolution.md`
- [x] `docs/troubleshooting-log.md`
- [x] `SUBMISSION.md`
- [x] `docs/requirements-mapping.md`
- [x] `docs/evaluation-qa.md`
- [x] `docs/github-runtime-audit.md`
- [x] `environment/verify.sh`
- [x] `REFERENCE-STATUS.md`
- [x] actual Runtime links 대신 `TODO_RUNTIME` 유지
- [x] Phase A 자체감사 BLOCKER/MAJOR 0

## B. 협업 정책 Reference

- [x] GitHub Flow: `main` + `feature/*`
- [x] branch naming `feature/<issue>-<topic>`
- [x] main direct push 금지 정책
- [x] PR + approve 1+ 정책
- [x] commit convention
- [x] 의미 없는 commit message 금지 예시
- [x] Issue → PR `Closes/Fixes #n`
- [x] PR What / Why / How
- [x] 실질 Review 품질 기준
- [x] reviewer ↔ author 상호작용 기준
- [x] shared branch force push/rebase 안전 규칙

## C. 실제 팀/Repository — Phase C

- [ ] 실제 3~5인 팀
- [ ] 실제 팀 저장소 1개
- [ ] 모든 팀원 협업 권한
- [ ] README/docs/src 구조
- [ ] 실제 main Branch Protection 또는 Ruleset
- [ ] 직접 push 차단
- [ ] PR merge 요구
- [ ] required approval >= 1
- [ ] force push/deletion 정책 확인

## D. Issue / PR / Review — Phase C

각 팀원 전원:

- [ ] Issue 2+ 또는 PR 작업과 추적 가능한 Issue
- [ ] merged PR 2+
- [ ] PR에 `Closes #n` 또는 `Fixes #n`
- [ ] PR What/Why/How
- [ ] 본인 제외 Review 2+
- [ ] Review가 LGTM-only가 아닌 실질 내용
- [ ] 본인 PR feedback 반영 1+
- [ ] review → reply/change commit 상호작용 Evidence
- [ ] `SUBMISSION.md`에 실제 링크

## E. Conflict — Phase C

- [x] Reference same-hunk scenario 설계
- [x] Reference rename/delete-modify scenario 설계
- [ ] 실제 conflict 해결 2+
- [ ] 실제 non-trivial conflict 1+
- [ ] 두 변경 의도 확인 기록
- [ ] 해결 후 검증 기록
- [ ] 관련 PR/commit 링크
- [ ] `docs/conflict-resolution.md` 실제 기록

## F. Troubleshooting — Phase C

- [x] `amend` 안전 절차 Reference
- [x] `reset --soft HEAD~1` 안전 절차 Reference
- [x] `revert` 공유 이력 안전 절차 Reference
- [x] `stash` / `stash pop` Reference
- [ ] 실제 amend 수행
- [ ] 실제 reset --soft 수행
- [ ] 실제 revert 수행
- [ ] 실제 stash/pop 수행
- [ ] 각 기록에 상황/재현/명령/결과/이유/주의점/참여자/링크
- [ ] 모든 팀원 최소 1개 시나리오 기록 참여

## G. Simple Deliverable / History — Phase C

- [x] Reference `src/` 가이드
- [ ] 선택 결과물 확정
- [ ] 팀원별 최소 1건 실제 기여 commit
- [ ] README에서 결과물 안내
- [ ] 실제 `git log --oneline --graph --all --decorate`
- [ ] Git history Evidence 저장/링크

## H. Runtime Audit

### Local

- [x] Reference/local Runtime verifier 준비
- [ ] 실제 team repo 대상으로 `verify.sh --runtime <path>` 0 FAIL
- [ ] `TODO_RUNTIME` 0개
- [ ] 명백한 금지 commit subject 없음

### GitHub server

- [x] `docs/github-runtime-audit.md` 준비
- [ ] Branch Protection/Ruleset 실제 확인
- [ ] merged PR 팀원별 2+ 실제 확인
- [ ] Review 팀원별 2+ 실제 확인
- [ ] Issue→PR 실제 linkage 확인
- [ ] feedback 반영 실제 thread/commit 확인
- [ ] conflict 실제 PR/commit 대조

## I. Evaluation 설명

- [x] branch가 commit pointer라는 개념 기준 답안
- [x] GitHub Flow 선택 이유
- [x] PR/review 가치
- [x] conflict marker와 의사결정 기준
- [x] reset/revert/stash 차이
- [x] hotfix 흐름
- [x] 의미 없는 push commit 대응
- [x] 반복 conflict 원인/예방
- [x] rebase 위험/안전수칙(보너스)
- [ ] 실제 팀 활동을 근거로 사용자 자기 말 설명

## J. Evidence / Final CLEAR

- [x] Reference Evidence 구조
- [ ] 실제 팀/권한 Evidence
- [ ] actual protection/rules Evidence
- [ ] member PR/Review/feedback Evidence
- [ ] conflict 2+/non-trivial 1+ Evidence
- [ ] troubleshooting 4종/전원 참여 Evidence
- [ ] simple deliverable 전원 contribution Evidence
- [ ] 실제 SUBMISSION 완성
- [ ] Secret/Token 노출 없음
- [ ] 공식 Mission/Evaluation 누락 없음
- [ ] **✅ B2-2 CLEAR**

## K. 5계정 학습 Simulation — 공식 Evidence와 분리

> 이 섹션은 학습용입니다. 체크되어도 실제 팀 B2-2 Evidence를 대신하지 않습니다.

### 공통 설계

- [x] 동일 GitHub 학습 계정 5개를 MAC-V/WIN-V에서 공통 사용하도록 설계
- [x] `codyssey01`~`codyssey05` ↔ GitHub Account A~E 1:1 매핑
- [x] `gh` + HTTPS 기본 인증 정책
- [x] `OS User ↔ GitHub Login ↔ Git Commit Identity` Gate 정의
- [x] `environment/MULTI-ACCOUNT-SIMULATION.md` 작성

### MAC-V Documentation / Automation

- [x] 학교 공용 Mac의 macOS 사용자 계정 1개 유지 정책
- [x] OrbStack Ubuntu 24.04 machine 이름 `codyssey` 고정
- [x] Ubuntu 내부 Linux User `codyssey01`~`codyssey05` 설계
- [x] `environment/mac-v/README.md` 단계별 실행 가이드
- [x] `environment/mac-v/setup-base.sh` 준비
- [x] `environment/mac-v/setup-users.sh` 준비
- [x] `environment/mac-v/verify.sh` 준비
- [x] `environment/mac-v/CLOSEOUT.md` 공용 PC 보안 마무리 절차

### MAC-V Runtime — 실제 Mac 실행 후에만

- [ ] `orb status` PASS
- [ ] OrbStack `codyssey` 존재/생성
- [ ] `codyssey` = Ubuntu 24.04
- [ ] Git/gh 공통 도구 PASS
- [ ] `codyssey01`~`codyssey05` 5/5 존재
- [ ] 사용자 HOME/Workspace 검증 0 FAIL
- [ ] GitHub Account A~E gh 인증 5/5
- [ ] Git identity 5/5
- [ ] Account Identity Gate 5/5
- [ ] 각 사용자별 Repository clone 5/5
- [ ] MAC-V Simulation 협업 Runtime 수행
- [ ] 공용 PC Closeout PASS

### WIN-V Runtime

- [ ] WSL2 Ubuntu 24.04 기준 확인
- [ ] `codyssey01`~`codyssey05` 구성
- [ ] 동일 GitHub Account A~E 인증/Identity Gate
- [ ] WIN-V Simulation 협업 Runtime 수행

### Cross-platform / Advanced

- [ ] MAC-V ↔ WIN-V Cross-platform 협업
- [ ] MAC-V 독립 OrbStack machine 5개 ADVANCED 실습
- [ ] WIN-V 독립 WSL2 instance 또는 VM 5개 ADVANCED 실습
