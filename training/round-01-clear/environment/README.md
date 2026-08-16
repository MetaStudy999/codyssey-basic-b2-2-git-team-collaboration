# B2-2 R01 Environment

## Golden Path

- Git
- GitHub account
- GitHub CLI (`gh`)는 선택이지만 확인 작업에 유용
- Python 3.10+는 간단 결과물 선택 시 사용할 수 있음
- 3~5인 실제 팀

## Runtime 전 확인

```bash
git --version
gh --version 2>/dev/null || true
git config --get user.name
git config --get user.email
```

GitHub 인증 정보와 Token 값 자체를 채팅/Evidence에 출력하지 않습니다.

## 안전 원칙

- main/shared branch force push 금지
- `reset --soft` 실습은 push 전 로컬 commit에 수행
- push된 commit 취소는 `revert` 실습
- `rebase -i` 보너스는 개인 feature branch에서만
- 실제 충돌 실습 전 작업 파일을 commit/push하여 복구 지점을 확보

## Reference vs Runtime

Reference Build에서는 정책·템플릿·실습 시나리오를 준비합니다. Branch Protection, PR, Review, conflict count는 실제 GitHub 팀 활동에서만 PASS 처리합니다.
