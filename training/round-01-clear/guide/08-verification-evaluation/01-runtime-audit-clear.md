# STEP 10 — Runtime Audit, Evaluation, CLEAR

## ① 왜 하는가

파일이 존재하는 것과 공식 팀 활동 수량/품질을 충족하는 것은 다릅니다.

## ② 무엇을 하는가

Checklist, local verify, GitHub UI/API 기록, Evaluation Q&A를 교차 확인합니다.

## ③ 이번 단계에서 알아야 할 용어

- **Audit** — 기록과 요구사항을 근거로 누락을 체계적으로 점검하는 과정입니다.

## ④ 필요한 핵심 개념

```text
Requirement → GitHub Activity → Evidence Link → Evaluation → CLEAR
```

## ⑤ 실행할 명령어 또는 코드

Reference 구조 확인:

```bash
bash training/round-01-clear/environment/verify.sh
```

실제 팀 저장소 로컬 경로가 준비되면:

```bash
bash training/round-01-clear/environment/verify.sh --runtime /path/to/team-repo
```

GitHub의 Branch Protection/PR/Review 수량은 실제 UI/API 기록으로 별도 확인합니다.

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

local script는 GitHub 서버의 모든 Review/Protection 정책을 대신 검증하지 않습니다. 실제 GitHub 기록 확인이 반드시 필요합니다.

## ⑦ 예상되는 정상 결과

문서 구조 누락이 없고 팀원별 PR/Review/feedback, conflict, troubleshooting, Branch Protection이 모두 실제 기록으로 확인됩니다.

## ⑧ 그 결과가 의미하는 것

Git 명령을 외운 것이 아니라 팀 협업 워크플로우를 실제로 수행하고 설명할 수 있는 상태입니다.

## ⑨ 자주 발생하는 오류와 해결 방법

수량이 부족하면 가짜 PR을 한꺼번에 만들지 말고 남은 작은 실제 작업을 Issue로 분리해 정상 협업 흐름으로 보충합니다.

## ⑩ 완료 확인

- [ ] 3~5인 실제 팀
- [ ] Branch Protection
- [ ] 전원 PR 2+
- [ ] 전원 타인 Review 2+
- [ ] 전원 feedback 반영 1+
- [ ] conflict 2+ / non-trivial 1+
- [ ] troubleshoot 4종 / 전원 참여 1+
- [ ] 결과물 전원 기여
- [ ] SUBMISSION/Evidence
- [ ] Evaluation 설명
- [ ] **✅ B2-2 CLEAR**

실제 실행 근거가 없으면 체크하지 않습니다.

[이전: 모듈 README](README.md) · [전체 허브](../../BEGINNER-GUIDE.md) · [최종 Checklist](../../CHECKLIST.md)
