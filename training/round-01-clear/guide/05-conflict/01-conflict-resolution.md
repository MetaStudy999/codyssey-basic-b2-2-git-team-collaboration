# STEP 06 — 충돌 2회, 비자명 충돌 1회 재현

## ① 왜 하는가

충돌은 실패가 아니라 두 변경이 같은 영역에서 경쟁한다는 신호입니다. 팀은 의도를 비교해 안전하게 통합할 수 있어야 합니다.

## ② 무엇을 하는가

`conflict-resolution.md`의 두 시나리오를 실제 feature branch/PR에서 수행합니다.

## ③ 이번 단계에서 알아야 할 용어

- **Merge Conflict** — Git이 두 변경을 자동으로 합칠 수 없는 상태입니다.
- **hunk** — diff에서 서로 가까운 변경 라인 묶음입니다.
- **비자명 충돌 (Non-trivial Conflict)** — 같은 hunk 또는 rename/delete vs modify처럼 의사결정이 필요한 충돌입니다.

## ④ 필요한 핵심 개념

```text
충돌 마커 확인 → 양쪽 Issue 의도 확인 → 최종 내용 결정 → test → 기록
```

## ⑤ 실행할 명령어 또는 코드

```bash
git status
git diff
# 파일을 직접 해결
git add <resolved-file>
git status
# merge 상황에 맞게 commit
git push
```

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

`<<<<<<<`, `=======`, `>>>>>>>`는 어느 쪽 변경인지 보여 주는 마커입니다. 마커만 삭제하고 한쪽을 무조건 버리면 안 됩니다.

## ⑦ 예상되는 정상 결과

최소 2개의 실제 conflict 기록과 해결 PR/commit이 남고, 그중 1개는 공식 비자명 기준을 만족합니다.

## ⑧ 그 결과가 의미하는 것

Git 충돌을 요구사항과 변경 의도를 바탕으로 해결할 수 있습니다.

## ⑨ 자주 발생하는 오류와 해결 방법

conflict가 발생하지 않으면 두 branch가 실제 같은 hunk를 수정했는지, 한 branch가 먼저 main에 merge된 뒤 다른 branch가 최신 main을 가져왔는지 확인합니다.

## ⑩ 완료 확인

- [ ] conflict 2+
- [ ] non-trivial 1+
- [ ] 해결 과정 문서
- [ ] 해결 후 test

[이전: 모듈 README](README.md) · [다음: Troubleshooting](../06-troubleshooting/README.md)
