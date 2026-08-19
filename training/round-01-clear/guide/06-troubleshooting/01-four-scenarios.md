# STEP 07 — amend/reset/revert/stash 4종 실습

## ① 왜 하는가

Git 실수와 작업 전환 상황에서 history를 손상하지 않고 적절한 복구 도구를 선택해야 합니다.

## ② 무엇을 하는가

`troubleshooting-log.md`의 네 시나리오를 실제로 수행하고 Before/After를 기록합니다.

## ③ 이번 단계에서 알아야 할 용어

- **amend** — 최근 commit 수정
- **reset --soft** — 로컬 commit을 취소하면서 변경은 유지
- **revert** — 기존 commit의 반대 변경을 새 commit으로 추가
- **stash** — 미완성 변경 임시 보관

## ④ 필요한 핵심 개념

```text
아직 공유 전 → amend/reset 가능
이미 공유됨 → revert 우선
미완성 작업 임시 보관 → stash
```

## ⑤ 실행할 명령어 또는 코드

```bash
sed -n '1,320p' training/round-01-clear/reference/team-repo/docs/troubleshooting-log.md
```

각 시나리오를 **실습용 feature branch**에서 수행합니다.

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

공유 main에서 reset/force push 실습을 하지 않습니다. `revert`는 shared history를 보존하는 핵심 차이를 직접 확인합니다.

## ⑦ 예상되는 정상 결과

4종 모두 Before/After 명령 출력과 관련 commit/PR 링크가 남습니다.

## ⑧ 그 결과가 의미하는 것

상황에 따라 Git 복구 명령을 구분해 사용할 수 있습니다.

## ⑨ 자주 발생하는 오류와 해결 방법

실습 중 history가 예상과 달라지면 force push부터 하지 말고 `git status`, `git log --oneline --graph --all`, `git reflog`로 현재 상태를 먼저 확인합니다.

## ⑩ 완료 확인

- [ ] amend
- [ ] reset --soft
- [ ] revert
- [ ] stash/pop
- [ ] 팀원별 최소 1개 기록 참여

[이전: 모듈 README](README.md) · [다음: Deliverable·Evidence](../07-deliverable-evidence/README.md)
