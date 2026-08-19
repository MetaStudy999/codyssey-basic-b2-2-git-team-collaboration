# Contributing — MAC-V Training Simulation

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

## Branch

```text
feature/<issue-number>-<short-topic>
```

`main`에서 직접 기능 작업을 하지 않습니다.

## Commit

작업 의도가 드러나는 메시지를 사용합니다.

```text
feat: add average helper
fix: handle empty input
refactor: simplify date formatting
```

`update`, `test`, `fix`처럼 의미가 부족한 단독 메시지는 피합니다.

## Pull Request

모든 PR에는 다음을 포함합니다.

- `Closes #n` 또는 `Fixes #n`
- What
- Why
- How
- Verification

## Review

`LGTM`, `좋아요`만으로 끝내지 않습니다. 최소 한 가지 실제 근거를 포함합니다.

- 특정 파일/라인/동작
- 질문
- 대안
- 위험
- 개선 제안
- 테스트 관점

작성자는 Review에 답하거나 필요한 수정 commit을 남깁니다.

## Conflict

충돌 발생 시 양쪽 변경 의도를 확인한 뒤 해결합니다. `<<<<<<<`, `=======`, `>>>>>>>` marker를 단순 삭제하는 것으로 끝내지 않습니다.

해결 기록은 `docs/conflict-resolution.md`에 남깁니다.

## Troubleshooting

`amend`, `reset --soft`, `revert`, `stash/pop` 실습은 `docs/troubleshooting-log.md`에 상황·명령·결과·주의점을 기록합니다.

공유된 `main`에 force push하지 않습니다. 공유된 commit 취소는 `revert`를 우선합니다.
