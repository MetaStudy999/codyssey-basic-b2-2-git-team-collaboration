# B2-2 MAC-V — 공용 PC 종료/정리(Closeout)

## 빠른 시작(Quick Start)

학교 공용 Mac에서 작업을 끝낼 때는 **GitHub 원격 증빙 보존 → 사용자별 gh 로그아웃 → 브라우저 세션 정리 → 로컬 Secret 확인 → OrbStack 종료** 순서로 마무리합니다.

```text
Push / Evidence 확인
→ gh logout 5/5
→ Browser logout
→ Secret 잔존 점검
→ orb stop codyssey
→ 필요 시 백업 확인 후 수동 delete 검토
```

`orb delete codyssey`는 파괴적이므로 자동화하지 않습니다.

## 📑 목차

- [1. Git 작업 보존](#1-git-작업-보존)
- [2. GitHub CLI 로그아웃](#2-github-cli-로그아웃)
- [3. 브라우저 세션 정리](#3-브라우저-세션-정리)
- [4. 로컬 Secret 점검](#4-로컬-secret-점검)
- [5. OrbStack 종료](#5-orbstack-종료)
- [6. 선택 — machine 삭제](#6-선택--machine-삭제)
- [7. 완료 체크](#7-완료-체크)

## 1. Git 작업 보존

각 `codyssey01`~`codyssey05`에서 실제 작업이 있다면 먼저 확인합니다.

```bash
git status
git branch --show-current
git log -3 --oneline
```

필요한 변경은 해당 feature branch에서 commit/push하고 GitHub에서 PR/Commit/Evidence가 실제로 보이는지 확인합니다.

공용 PC 정리를 이유로 작업 중 변경을 무조건 삭제하지 않습니다.

## 2. GitHub CLI 로그아웃

각 Linux 사용자 세션으로 접속합니다.

예:

```bash
orb -m codyssey -u codyssey01
```

현재 인증 계정을 Token 노출 없이 확인합니다.

```bash
gh auth status --active --hostname github.com
```

로그아웃:

```bash
gh auth logout --hostname github.com
```

다시 확인:

```bash
gh auth status --hostname github.com
```

`codyssey01`~`codyssey05` 모두 수행합니다.

금지:

```text
gh auth token
gh auth status --show-token
```

Token 출력은 Closeout이나 Evidence에 필요하지 않습니다.

## 3. 브라우저 세션 정리

`gh auth login --web` 과정에서 사용한 GitHub 브라우저 세션을 공용 Mac에 남기지 않습니다.

- GitHub 학습 계정에서 로그아웃
- 브라우저에 비밀번호 저장하지 않음
- 필요하면 해당 학습 세션의 쿠키/사이트 데이터 정리
- 개인 주 GitHub/Google 계정을 공용 브라우저 프로필에 남기지 않음

## 4. 로컬 Secret 점검

각 사용자 HOME에서 다음 유형을 확인합니다.

```text
.env
*.pem
*.key
개인 access token 메모
복사한 비밀번호 파일
```

Git repository에서는 최소한 다음을 확인합니다.

```bash
git status --short
```

Secret이 Git history에 commit/push되었다면 단순 파일 삭제로 끝내지 않고 즉시 Credential 폐기/회전과 별도 사고 대응이 필요합니다.

## 5. OrbStack 종료

모든 사용자 로그아웃과 원격 Evidence 확인이 끝난 뒤 macOS Terminal에서:

```bash
orb stop codyssey
```

이 명령은 machine을 중지하며 데이터를 삭제하지 않습니다.

## 6. 선택 — machine 삭제

MAC-V는 Resettable / Ephemeral 정책이므로 장기 보존할 필요가 없다면 `codyssey` 삭제를 검토할 수 있습니다.

삭제 전 반드시 확인:

```text
[ ] 필요한 변경이 모두 GitHub에 push됨
[ ] PR/Issue/Review Evidence가 원격에 존재함
[ ] 로컬에만 있는 학습 자료가 없음
[ ] 다음 실습에서 기존 machine을 재사용할 필요가 없음
```

그 뒤에만 **수동으로** 실행합니다.

```bash
orb delete codyssey
```

이 명령은 파괴적입니다. 이 Repository의 자동화 스크립트에서는 실행하지 않습니다.

## 7. 완료 체크

- [ ] codyssey01 gh logout
- [ ] codyssey02 gh logout
- [ ] codyssey03 gh logout
- [ ] codyssey04 gh logout
- [ ] codyssey05 gh logout
- [ ] GitHub 브라우저 세션 로그아웃
- [ ] 비밀번호 자동 저장 없음
- [ ] Token/Secret 노출 없음
- [ ] 필요한 Git 변경 원격 저장 확인
- [ ] `orb stop codyssey` 완료
- [ ] machine 삭제 여부는 별도 판단

Closeout 완료는 **공용 PC 보안 마무리** 상태이며 B2-2 Mission CLEAR와는 별개입니다.
