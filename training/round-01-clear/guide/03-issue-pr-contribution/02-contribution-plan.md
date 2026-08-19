# STEP 04 — 팀원별 최소 기여량 계획

## ① 왜 하는가

팀 전체 PR 수가 많아도 특정 팀원이 협업에 참여하지 않으면 공식 기준을 통과하지 못합니다.

## ② 무엇을 하는가

`SUBMISSION.md`를 기준으로 **개인별** 최소 요구를 사전에 배분합니다.

## ③ 이번 단계에서 알아야 할 용어

- **Contribution** — 팀 결과물에 남긴 실제 기여 기록입니다.
- **Submission Index** — 평가자가 팀원별 증거를 빠르게 찾는 인덱스입니다.

## ④ 필요한 핵심 개념

```text
PR 2+ / 타인 Review 2+ / 본인 PR 피드백 반영 1+ / 결과물 commit 1+
```

## ⑤ 실행할 명령어 또는 코드

```bash
sed -n '1,240p' training/round-01-clear/reference/team-repo/SUBMISSION.md
```

실제 팀원 수에 맞춰 Member 섹션을 만듭니다.

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

PR 링크만 모으지 말고 Issue, Review, feedback 반영, troubleshooting 참여까지 개인별로 연결합니다.

## ⑦ 예상되는 정상 결과

각 팀원의 남은 PR/Review/시나리오가 명확하게 보입니다.

## ⑧ 그 결과가 의미하는 것

마지막에 한 사람의 활동 부족 때문에 전체 팀 평가가 막히는 위험을 줄입니다.

## ⑨ 자주 발생하는 오류와 해결 방법

한 사람이 문서/코드를 독점하지 말고 작은 Issue를 분리해 전원이 실제 branch/PR을 경험하도록 배분합니다.

## ⑩ 완료 확인

- [ ] 전원 PR 2개 계획
- [ ] 전원 Review 2개 계획
- [ ] 전원 피드백 반영 계획
- [ ] 전원 결과물 기여 계획

[이전 STEP](01-issue-feature-pr.md) · [다음 모듈](../04-review-feedback/README.md)
