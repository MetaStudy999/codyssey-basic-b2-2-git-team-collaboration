# B2-2 R01 — Evidence Guide

B2-2는 문서 양보다 **실제 GitHub 협업 흔적**이 중요합니다.

## 빠른 시작(Quick Start)

Evidence는 처음부터 두 트랙으로 분리합니다.

```text
evidence/
├── actual/
│   └── 실제 3~5인 팀의 공식 B2-2 Evidence
└── simulation/
    └── 5계정 학습 Simulation Evidence
```

```text
Simulation Evidence ≠ Actual Mission Evidence
```

현재 MAC-V Simulation 기록 위치:

- [`simulation/mac-v/README.md`](simulation/mac-v/README.md)

실제 팀 Evidence 기준:

- [`actual/README.md`](actual/README.md)

## Evidence 우선순위

### 1. Repository / Team

- 실제 팀 저장소 URL
- 3~5인 Collaborator 또는 Organization 참여 확인
- main Branch Protection 설정
  - 직접 push 제한
  - PR merge
  - 승인 1명 이상

### 2. Member Contributions

팀원별:

- merged PR 2개 이상
- 타인 PR review 2개 이상
- 본인 PR 피드백 반영 1개 이상
- 간단 결과물 기여 commit 1개 이상
- troubleshooting 기록 참여 1개 이상

모든 링크를 `SUBMISSION.md`에 모읍니다.

### 3. PR Quality

각 대표 PR에서:

- `Closes #n`/`Fixes #n`
- What
- Why
- How
- 실질 review comment
- 작성자 답글 또는 수정 commit
- approval
- merge

### 4. Conflict

최소 2건:

- 실제 branch/PR
- 충돌 파일
- `git status`
- 충돌 원인
- 해결 의사결정
- 해결 후 test

최소 1건은 공식 비자명 기준:

- same file / same hunk
- 또는 rename/delete vs modify

### 5. Troubleshooting 4종

- amend Before/After
- reset --soft Before/After
- revert target/revert commit
- stash list/pop Before/After

각 기록에 참여 팀원 이름/역할과 관련 Issue/PR/Commit을 남깁니다.

### 6. Git Graph

```bash
git log --oneline --graph --all --decorate
```

결과 텍스트 또는 캡처를 남깁니다.

## Actual vs Simulation

### Actual Mission Evidence

`evidence/actual/`에는 실제 팀 Repository의 검증 가능한 기록만 연결합니다.

```text
실제 Team
→ GitHub Server Metadata
→ PR/Review/Conflict/Troubleshooting
→ SUBMISSION
→ Evaluation
```

### Simulation Evidence

`evidence/simulation/`은 MAC-V/WIN-V/Cross-platform 학습 기록용입니다.

```text
Training Simulation
→ 반복 연습
→ Identity / GitHub Flow / Conflict / Recovery 학습
→ 공식 Evidence 대체 불가
```

## 금지

- 실제로 하지 않은 Review/Conflict를 문서에 완료했다고 작성
- 수량을 맞추기 위한 무의미한 PR/Review 자동 생성
- main/shared branch 강제 push로 history 조작
- Token/Password/Private Key/credential을 Evidence에 포함
- Simulation 결과를 Actual Mission Evidence로 승격

## 최종 연결

```text
Requirement
→ 실제 GitHub 기록
→ evidence/actual/
→ SUBMISSION 링크
→ Evaluation
→ 조건 충족 시에만 Mission CLEAR
```
