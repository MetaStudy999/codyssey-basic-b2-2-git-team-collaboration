# STEP 03 — Issue → feature → PR 한 사이클 완주

## ① 왜 하는가

공식 미션은 모든 작업을 Issue와 PR로 추적할 수 있어야 합니다.

## ② 무엇을 하는가

작업 Issue 하나를 만들고 feature branch에서 작업한 뒤 `Closes #n`을 포함한 PR을 생성합니다.

## ③ 이번 단계에서 알아야 할 용어

- **Issue** — 해야 할 일/문제를 기록하는 GitHub 항목입니다.
- **Pull Request (PR)** — branch 변경을 main에 병합하기 전에 검토하는 요청입니다.
- **Traceability (추적성)** — 요구와 변경 기록을 서로 연결해 따라갈 수 있는 성질입니다.

## ④ 필요한 핵심 개념

`Issue = Why/Goal`, `PR = 실제 변경 + 검증`으로 연결합니다.

## ⑤ 실행할 명령어 또는 코드

```bash
git switch main
git pull --ff-only
git switch -c feature/<issue-number>-<topic>
# 파일 작업
git add <files>
git commit -m "feat: add <specific utility>"
git push -u origin HEAD
```

PR 본문:

```text
Closes #<issue-number>
What: ...
Why: ...
How: ...
```

## ⑥ 명령어와 코드에 입문자가 이해할 수 있는 주석

`-u origin HEAD`는 현재 feature branch를 원격에 올리고 이후 `git push` 기본 대상을 연결합니다.

## ⑦ 예상되는 정상 결과

Issue와 PR이 연결되고 diff/What/Why/How가 리뷰 가능한 상태로 보입니다.

## ⑧ 그 결과가 의미하는 것

팀원이 변경 이유부터 병합까지 한 흐름을 추적할 수 있습니다.

## ⑨ 자주 발생하는 오류와 해결 방법

- main에서 작업함 → 변경을 잃지 말고 새 feature branch로 옮긴 뒤 PR 흐름으로 복구
- `Closes #n` 누락 → PR 본문 수정

## ⑩ 완료 확인

- [ ] Issue
- [ ] feature branch
- [ ] 의미 있는 commit
- [ ] PR
- [ ] Closes/Fixes
- [ ] What/Why/How

[이전: 모듈 README](README.md) · [다음 STEP](02-contribution-plan.md)
