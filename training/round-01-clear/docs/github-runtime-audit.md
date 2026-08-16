# B2-2 R01 — GitHub Runtime Audit

## 목적

B2-2의 핵심 평가는 로컬 파일이 아니라 **실제 GitHub 메타데이터와 팀 상호작용 기록**입니다. Reference 템플릿이 존재하는 것만으로 PR/Review/Issue/Branch Protection 요구를 PASS 처리하지 않습니다.

이 문서는 Phase C에서 실제 팀 저장소를 검증할 기준입니다.

## 입력

- 팀 저장소: `<OWNER>/<REPO>`
- 팀원 GitHub username: 3~5명
- GitHub CLI(`gh`) 로그인 상태

```bash
gh auth status
```

## 1. 팀/저장소

확인할 것:

- 실제 팀 저장소 1개
- 3~5명 모두 협업 권한 보유
- `README.md`, `SUBMISSION.md`, `docs/`, `src/` 존재

Collaborator/Organization 권한은 저장소 Visibility/Organization 정책에 따라 API 응답이 달라질 수 있으므로 GitHub Settings/People 화면 또는 권한 조회 결과를 Evidence로 남깁니다.

## 2. main 보호 정책

Classic branch protection을 사용하는 경우:

```bash
gh api repos/<OWNER>/<REPO>/branches/main/protection
```

최소 확인:

- PR 기반 변경 요구
- required approving review count >= 1
- force push 비허용
- deletion 비허용

GitHub Ruleset을 사용하는 경우 classic protection API만으로는 전체 정책을 설명하지 못할 수 있습니다. 해당 저장소의 **Rules / Rulesets 실제 설정 화면 또는 API**로 `main` 직접 변경 차단과 승인 1+를 확인합니다.

> 설정이 존재한다는 것과 실제 이력에서 main 직접 push가 없었다는 것은 별도 확인 항목입니다.

## 3. Issue → PR 연동

각 팀원 PR 2개 이상에서 다음을 확인합니다.

- 실제 Issue 존재
- PR 본문에 `Closes #n` 또는 `Fixes #n`
- PR이 merge 되었음
- Issue와 PR이 추적 가능함

PR 목록 예시:

```bash
gh pr list --repo <OWNER>/<REPO> --state merged --limit 100 \
  --json number,title,author,url,body,mergedAt
```

`SUBMISSION.md`의 링크와 실제 GitHub PR을 대조합니다.

## 4. 팀원별 merged PR 2+

팀원별 예시:

```bash
gh pr list --repo <OWNER>/<REPO> --state merged --limit 100 \
  --search 'author:<USERNAME>' \
  --json number,title,url,author,mergedAt
```

팀원 전원이 **2개 이상**인지 확인합니다.

## 5. 팀원별 타인 PR Review 2+

Review는 단순 댓글이 아니라 실제 PR review/comment 내용과 대상을 확인해야 합니다.

특정 PR의 review:

```bash
gh api repos/<OWNER>/<REPO>/pulls/<PR_NUMBER>/reviews

gh api repos/<OWNER>/<REPO>/pulls/<PR_NUMBER>/comments

gh api repos/<OWNER>/<REPO>/issues/<PR_NUMBER>/comments
```

판정:

- 본인 PR 제외
- 팀원별 2개 이상
- `LGTM`, `좋아요` 단독이 아닌 실질적 내용
- 파일/라인/동작/리스크/대안/테스트 등 구체적 근거

## 6. 본인 PR에서 feedback 반영 1+

각 팀원 최소 1건에서 다음 연결을 확인합니다.

```text
review/comment
→ 작성자 reply 또는 수정 commit
→ 필요 시 reviewer 재확인/approve
```

Evidence는 PR conversation URL + 반영 commit URL을 `SUBMISSION.md`에 연결합니다.

## 7. PR What / Why / How

모든 평가 대상 PR 본문에서 다음을 확인합니다.

- What
- Why
- How
- `Closes #n` 또는 `Fixes #n`

Reference `.github/pull_request_template.md`는 작성 보조일 뿐 실제 PR 본문을 대신하지 않습니다.

## 8. 충돌 2회 + 비자명 충돌 1회

`docs/conflict-resolution.md`의 실제 2건을 PR/commit 이력과 대조합니다.

최소 1건은:

- same hunk/인접 라인 상충 수정, 또는
- rename/delete와 상대편 내용 수정

중 하나여야 합니다.

단순히 문서에 “충돌했다”고 적는 것만으로 PASS하지 않습니다. 실제 conflict 해결 commit/PR 흐름과 연결합니다.

## 9. troubleshooting 4종

실제 수행:

- `git commit --amend`
- `git reset --soft HEAD~1`
- `git revert`
- `git stash` / `git stash pop`

각 기록은 `docs/troubleshooting-log.md`에서:

1. 상황
2. 재현 조건
3. 명령
4. 결과
5. 선택 이유
6. 주의점
7. 참여 팀원
8. 관련 Issue/PR/Commit 링크

을 유지합니다.

특히 `revert`는 원격 공유 이력에 안전한 새 commit으로 취소한 실제 기록을 확인합니다. `reset --soft`는 공유 push 전 로컬 실습에 사용합니다.

## 10. 팀원별 troubleshooting 참여 1+

4개 시나리오를 팀 전체가 수행하는 것과 별개로 **팀원 전원이 최소 한 시나리오 기록에 참여**해야 합니다.

`SUBMISSION.md` 팀원별 섹션과 `troubleshooting-log.md`의 참여자 이름을 서로 대조합니다.

## 11. 간단 결과물 기여

선택한 결과물에서 팀원별 최소 1건의 실제 기여 commit이 있어야 합니다.

```bash
git log --format='%h %an <%ae> %s' -- src team README.md
```

GitHub username과 Git author email/name이 다를 수 있으므로 commit URL/작성자를 실제 계정과 연결해 확인합니다.

## 12. Git history

```bash
git log --oneline --graph --all --decorate
```

Reference 텍스트가 아니라 **실제 팀 저장소 이력**을 Evidence로 사용합니다.

## 13. SUBMISSION completeness

`SUBMISSION.md`에 `TODO_RUNTIME`이 하나라도 남아 있으면 Runtime 제출 준비 완료로 보지 않습니다.

```bash
grep -Rni 'TODO_RUNTIME' SUBMISSION.md docs || true
```

## 14. 최종 Runtime 판정

자동/반자동으로 확인 가능한 것과 사람이 내용을 읽어야 하는 것을 분리합니다.

### 구조/수량 확인 가능

- 파일 존재
- merged PR 수
- Branch Protection/Ruleset 설정
- Issue/PR URL
- Review 개수
- Git history
- TODO_RUNTIME 존재 여부

### 반드시 내용 검토 필요

- Review가 실질적인가
- feedback이 실제 반영되었는가
- conflict가 실제이며 비자명한가
- troubleshooting 기록이 재현 가능한가
- 팀원 contribution이 의미 있는가
- 사용자가 Git 개념을 자기 말로 설명할 수 있는가

## CLEAR 금지 조건

다음 중 하나라도 있으면 `✅ CLEAR`로 바꾸지 않습니다.

- 실제 팀이 3~5명이 아님
- main 보호/PR-only/approval 1+ 미확인
- 팀원별 PR 2+ 미달
- 팀원별 타인 review 2+ 미달
- feedback 반영 1+ 미달
- conflict 2+/non-trivial 1+ 미달
- troubleshooting 4종 또는 전원 참여 미달
- 실제 링크 대신 Reference placeholder 사용
- `TODO_RUNTIME` 잔존
