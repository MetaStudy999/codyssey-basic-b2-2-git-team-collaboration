# Runtime과 Identity Gate

## 왜 하는가

B2-2는 PR/Review 작성자가 누구인지가 Evidence의 일부입니다. 잘못된 GitHub 계정이나 Git 작성자로 작업하면 기록이 섞입니다.

## 현재 공통 구조

```text
MAC-V
학교 macOS → OrbStack → Ubuntu 24.04

WIN-V
Windows 11 Pro → WSL2 → Ubuntu 24.04
```

5계정 Simulation에서는 양쪽에서 같은 매핑을 유지합니다.

```text
codyssey01 → GitHub Account A
codyssey02 → GitHub Account B
codyssey03 → GitHub Account C
codyssey04 → GitHub Account D
codyssey05 → GitHub Account E
```

## 작업 전 확인

```bash
whoami
gh api user --jq '.login'
git config --get user.name
git config --get user.email
git remote -v
git branch --show-current
```

판정:

```text
Linux User
↔ GitHub Login
↔ Git Commit Identity
```

매핑이 맞지 않으면 **STOP**하고 Issue/Commit/PR/Review를 만들지 않습니다.

Token, Password, Private Key 값은 채팅이나 Evidence에 출력하지 않습니다.

상세 설치·계정 생성·공용 PC 종료 절차는 `environment/` 문서를 단일 기준으로 사용합니다.

[이전: 모듈 README](README.md) · [전체 허브](../../BEGINNER-GUIDE.md) · [다음: 팀 저장소·GitHub Flow](../02-team-repo-github-flow/README.md)
