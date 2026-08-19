# STEP 02 — GitHub Flow와 협업 규칙 확정

## ① 왜 하는가

사람마다 branch/commit/review 방식이 다르면 기록은 남아도 협업이 일관되지 않습니다.

## ② 무엇을 하는가

Reference `docs/CONTRIBUTING.md`를 팀 기준으로 옮기고 branch naming, commit convention, PR/Review 규칙을 합의합니다.

## ③ 이번 단계에서 알아야 할 용어

- **GitHub Flow** — main + 짧은 feature branch + PR 중심의 협업 흐름입니다.
- **Commit Convention** — commit 메시지의 의미와 형식을 맞추는 규칙입니다.

## ④ 필요한 핵심 개념

```text
main = 통합 기준
feature/* = 한 작업 단위
```

작업 단위를 작게 나누면 Review와 충돌 해결이 쉬워집니다.

## ⑤ 실행할 명령어 또는 코드

```bash
sed -n '1,260p' training/round-01-clear/reference/team-repo/docs/CONTRIBUTING.md
```

팀 저장소에서는 예를 들어:

```bash
git switch main
git pull --ff-only
git switch -c feature/12-string-utils
```

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

- `pull --ff-only`: 예상하지 못한 자동 merge commit을 피하면서 최신 main을 받습니다.
- `switch -c`: 새 feature branch를 만들고 이동합니다.

## ⑦ 예상되는 정상 결과

팀의 branch/commit/PR/review/conflict 규칙이 `CONTRIBUTING.md`에 고정됩니다.

## ⑧ 그 결과가 의미하는 것

이후 팀원이 같은 협업 계약을 사용하게 됩니다.

## ⑨ 자주 발생하는 오류와 해결 방법

`update`, `fix`, `wip`처럼 의미 없는 commit 메시지는 구체적인 변경 대상을 포함하도록 고칩니다.

## ⑩ 완료 확인

- [ ] branch naming
- [ ] commit convention
- [ ] PR What/Why/How
- [ ] Review 최소 품질
- [ ] conflict 대응 흐름

[이전 STEP](01-team-repository.md) · [다음 모듈](../03-issue-pr-contribution/README.md)
