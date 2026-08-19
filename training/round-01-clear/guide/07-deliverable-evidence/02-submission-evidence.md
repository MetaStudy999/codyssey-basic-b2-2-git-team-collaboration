# STEP 09 — SUBMISSION과 Git Evidence 정리

## ① 왜 하는가

평가자가 여러 PR과 Review를 직접 찾아다니지 않도록 증거를 한 곳에 연결해야 합니다.

## ② 무엇을 하는가

`SUBMISSION.md`에 팀원별 Issue/PR/Review/feedback/troubleshooting 링크를 정리하고 git graph를 남깁니다.

## ③ 이번 단계에서 알아야 할 용어

- **Evidence Index** — 여러 증거의 위치를 한 문서에서 찾게 하는 목록입니다.
- **Git Graph** — branch/merge commit 관계를 시각적으로 보여 주는 로그입니다.

## ④ 필요한 핵심 개념

문서의 체크 표시보다 **클릭 가능한 실제 GitHub 기록**이 더 강한 Evidence입니다.

## ⑤ 실행할 명령어 또는 코드

```bash
git log --oneline --graph --all --decorate | tee git-history.txt
```

Reference SUBMISSION을 실제 팀 저장소에 맞춰 채웁니다.

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

`--graph --all`은 main뿐 아니라 여러 branch의 commit 관계를 함께 보여 줍니다.

## ⑦ 예상되는 정상 결과

평가자가 `SUBMISSION.md`에서 각 팀원의 최소 요건과 핵심 문서를 바로 확인할 수 있습니다.

## ⑧ 그 결과가 의미하는 것

협업 과정이 재현·감사 가능한 형태로 정리되었습니다.

## ⑨ 자주 발생하는 오류와 해결 방법

`TODO_RUNTIME`이 남아 있으면 실제 링크가 없는 항목이므로 완료 처리하지 않습니다.

## ⑩ 완료 확인

- [ ] SUBMISSION 실제 링크
- [ ] 협업 문서 3종
- [ ] git graph
- [ ] conflict/troubleshooting links

[이전 STEP](01-deliverable.md) · [다음 모듈](../08-verification-evaluation/README.md)
