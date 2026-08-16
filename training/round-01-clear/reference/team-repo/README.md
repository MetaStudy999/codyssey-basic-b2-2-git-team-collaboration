# B2-2 Reference Team Repository

> 이 폴더는 실제 팀 협업을 시작하기 위한 **기준 구조**입니다. 실제 팀원 이름, Issue/PR/Review 링크와 충돌 Evidence는 Phase C에서 생성합니다.

## 목표

GitHub Flow를 사용해 3~5명이 Issue → feature branch → Pull Request → Review → Merge 흐름을 반복하고, 충돌과 Git 트러블슈팅을 재현 가능한 문서로 남깁니다.

## GitHub Flow 선택 이유

1. `main`을 항상 깨지지 않는 상태로 유지하기 쉽습니다.
2. 작업을 `feature/*`로 격리하고 PR에서 리뷰·검증할 수 있습니다.
3. Issue/PR/Review/Merge 기록이 남아 책임과 변경 이유를 추적하기 쉽습니다.

## Reference 구조

```text
team-repo/
├── README.md
├── SUBMISSION.md
├── .github/
│   ├── pull_request_template.md
│   └── ISSUE_TEMPLATE/
│       └── task.md
├── docs/
│   ├── CONTRIBUTING.md
│   ├── conflict-resolution.md
│   └── troubleshooting-log.md
└── src/
    └── README.md
```

## 실제 팀 Runtime 필수량

팀원 **전원**:

- 병합 PR 2개 이상
- 본인 제외 코드 리뷰 2개 이상
- 본인 PR에서 리뷰 피드백 반영 1회 이상
- 간단 결과물 기여 커밋 1개 이상
- `amend/reset/revert/stash` 중 최소 1개 시나리오 기록 참여

팀 전체:

- 충돌 해결 기록 2회 이상
- 그중 비자명 충돌 1회 이상
- amend/reset/revert/stash 4종 모두 수행
- Branch Protection 적용
- main 직접 push 없이 PR Merge

## 간단 결과물 선택

Reference는 **유틸 함수 모음**을 권장합니다. 실제 팀원별로 `src/`에 함수 1개 이상을 각자의 feature branch/PR로 추가합니다. Phase A에서는 팀원 기여를 가짜 커밋으로 만들지 않습니다.
