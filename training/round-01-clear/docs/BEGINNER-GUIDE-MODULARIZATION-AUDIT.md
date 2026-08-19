# B2-2 Beginner Guide 모듈화 감사

## 🚀 빠른 확인(Quick Check)

이번 감사에서 기존 `BEGINNER-GUIDE.md`는 GitHub `main` 기준 **19,615 bytes**였고 STEP 01~10의 **10개 실행 STEP**을 한 파일에 담고 있었습니다.

Control Tower 운영 표준의 모듈화 판단 신호는 다음과 같습니다.

```text
실행 STEP 8개 이상
100KB 이상
1,000줄 이상
여러 기술 관심사가 혼재
입문자가 현재 위치/다음 행동을 잃기 쉬움
```

따라서 B2-2는 100KB에는 도달하지 않았지만 **STEP 수와 기술 관심사 분리 조건을 이미 만족**하므로 선제 모듈화를 적용합니다.

## 📑 목차

- [감사 대상](#감사-대상)
- [판정](#판정)
- [분할 원칙](#분할-원칙)
- [새 구조](#새-구조)
- [무결성 원칙](#무결성-원칙)
- [후속 크기 관리](#후속-크기-관리)

## 감사 대상

- 기존 `training/round-01-clear/BEGINNER-GUIDE.md`
- Control Tower `standards/CODYSSEY-WORKING-OPERATING-STANDARD.md`
- B1-1 `training/round-01-clear/BEGINNER-GUIDE.md`
- B1-1 `training/round-01-clear/guide/`

## 판정

| 항목 | 기존 B2-2 상태 | 판정 |
|---|---:|---|
| 파일 크기 | 19,615 bytes | 100KB 강제 분할 신호에는 미도달 |
| 실행 STEP | 10 | **8개 이상 → 모듈화 신호 충족** |
| 관심사 | 환경/팀 저장소/PR/Review/Conflict/Troubleshooting/Evidence/Evaluation | **다중 관심사 → 모듈화 신호 충족** |
| 향후 5계정 Simulation 확장 | MAC-V/WIN-V/Cross-platform | 중앙 파일 비대화 위험 |

결론: **파일 크기 때문이 아니라 STEP 수·응집도·탐색성 때문에 분할**합니다.

## 분할 원칙

```text
LEVEL 1 — BEGINNER-GUIDE.md
Quick Start / 전체 지도 / 상태 언어 / 핵심 링크

LEVEL 2 — guide/<module>/README.md
모듈 목적 / Local TOC / 완료 조건 / 이전·다음

LEVEL 3 — guide/<module>/<unit>.md
실제 개념 / 명령 / 정상 결과 / 오류 / 완료 확인
```

환경의 상세 운영 명령은 `environment/`가 Source of Truth이며 `guide/01-environment-identity/`에서는 중복 복제하지 않고 링크합니다.

## 새 구조

```text
guide/
├── 00-overview/
├── 01-environment-identity/
├── 02-team-repo-github-flow/
├── 03-issue-pr-contribution/
├── 04-review-feedback/
├── 05-conflict/
├── 06-troubleshooting/
├── 07-deliverable-evidence/
└── 08-verification-evaluation/
```

기존 STEP 01~10의 의미는 각 Learning Unit으로 이동합니다.

## 무결성 원칙

- 공식 Mission/Evaluation 요구를 삭제하거나 완화하지 않습니다.
- 기존 실행 순서를 보존합니다.
- Reference 활동과 실제 Runtime 활동을 혼동하지 않습니다.
- Simulation 기록을 실제 팀 Evidence로 승격하지 않습니다.
- 문서 분할만으로 Runtime/Verification/CLEAR 상태를 변경하지 않습니다.

## 후속 크기 관리

다음 신호에서 다시 구조를 감사합니다.

```text
BEGINNER-GUIDE 또는 단일 대형 가이드가 100KB에 접근
Learning Unit이 50KB에 접근
단일 문서가 700줄 이상
독립 학습 단위 3개 이상이 한 파일에 다시 혼재
오류/복구 경로가 독립적으로 커짐
```

최종 기준은 단순 bytes가 아니라 **기술적 응집도(Cohesion)와 입문자 탐색성**입니다.
