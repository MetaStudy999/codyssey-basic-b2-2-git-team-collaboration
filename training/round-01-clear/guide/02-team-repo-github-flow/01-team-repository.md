# STEP 01 — 실제 3~5인 팀과 팀 저장소 준비

## ① 왜 하는가

이 미션은 혼자 만든 가짜 기록이 아니라 실제 협업 권한과 팀 활동을 평가합니다.

## ② 무엇을 하는가

3~5인 팀을 확정하고 Organization 저장소 또는 Collaborator 방식의 팀 저장소 1개를 준비합니다.

## ③ 이번 단계에서 알아야 할 용어

- **Collaborator** — 저장소에 협업 권한을 가진 사용자입니다.
- **Organization** — 여러 사람이 공동으로 GitHub 저장소를 관리하는 계정 단위입니다.
- **Branch Protection** — 특정 branch의 push/merge 방식을 제한하는 규칙입니다.

## ④ 필요한 핵심 개념

`main`을 아무나 직접 바꾸지 않고 PR과 승인 절차를 통과하게 해야 협업 기록과 품질 Gate가 남습니다.

## ⑤ 실행할 명령어 또는 코드

```bash
git --version
git config --get user.name
git config --get user.email
```

GitHub UI에서 실제 팀 저장소와 멤버 권한을 구성합니다.

```text
- main 직접 push 금지
- PR을 통한 병합
- 최소 1명 approve
```

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

Git 설정의 name/email은 commit 작성자를 기록합니다. Token/Password 자체는 출력하거나 Evidence에 남기지 않습니다.

## ⑦ 예상되는 정상 결과

3~5명 모두 팀 저장소에 접근 가능하고 main 보호 규칙이 확인됩니다.

## ⑧ 그 결과가 의미하는 것

이후 PR/Review 활동이 실제 팀 협업 기록으로 남을 기본 환경이 준비되었습니다.

## ⑨ 자주 발생하는 오류와 해결 방법

- 팀원이 push/PR 권한 없음 → Collaborator/Org 권한 재확인
- 보호 규칙 때문에 첫 설정 작업이 막힘 → 규칙을 우회하지 말고 feature branch + PR로 진행

## ⑩ 완료 확인

- [ ] 팀원 3~5명
- [ ] 팀 저장소 1개
- [ ] main Branch Protection
- [ ] PR + approve 1+

[이전: 모듈 README](README.md) · [다음 STEP](02-github-flow-rules.md)
