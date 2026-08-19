# B2-2 Round 01 — CLEAR

## 현재 상태

- 전역 운영 단계: **Phase C — FAST EXECUTE / Runtime**
- B2-2 Workcell: **🟡 ACTIVE**
- Phase A Reference Build: **CORE READY**
- 실제 팀 GitHub Runtime/Evidence: **🟡 PENDING / 최종 검증 전**
- 5계정 Simulation Documentation: **✅ READY**
- MAC-V Simulation Runtime: **⬜ NOT RUN**
- WIN-V Simulation Runtime: **⬜ NOT RUN**
- CLEAR: **아님**

> Reference Build, 5계정 Simulation, 실제 3~5인 팀 Runtime은 서로 다른 상태입니다. Simulation 결과를 실제 팀 Evidence로 제출하지 않습니다.

## 선행 학습

- **필수 선행 미션:** 없음
- **권장 선행 미션:** B2-1
- **있으면 좋은 선행 지식:** Git `add/commit/branch/merge/remote`, GitHub Issue/PR 기초

B2-1을 먼저 수행하면 개인 단위 Python/Git 작업 흐름을 익힌 뒤 팀 협업으로 확장하기 쉬워집니다. 그러나 Git/GitHub 기본 사용 경험이 이미 있다면 B2-1을 CLEAR하지 않고도 B2-2 학습을 시작할 수 있습니다.

## 빠른 시작(Quick Start)

처음 진입:

1. [`START-CHECK.md`](START-CHECK.md) — Git/GitHub 기본 흐름 자가진단
2. [`BEGINNER-GUIDE.md`](BEGINNER-GUIDE.md) — Quick Start + 전체 학습 모듈 지도
3. [`environment/README.md`](environment/README.md) — 실행환경 진입
4. [`CHECKLIST.md`](CHECKLIST.md) — 실제 완료 Gate

5계정 Simulation:

1. [`environment/MULTI-ACCOUNT-SIMULATION.md`](environment/MULTI-ACCOUNT-SIMULATION.md)
2. [`environment/mac-v/README.md`](environment/mac-v/README.md) — 현재 우선 준비된 MAC-V Runbook
3. MAC-V 완료 후 WIN-V 동일 구조 재현
4. 이후 Cross-platform 및 독립 VM/Instance 5개 ADVANCED Lab

실제 팀 Runtime:

1. [`REFERENCE-STATUS.md`](REFERENCE-STATUS.md) — Reference 준비 상태 확인
2. [`reference/team-repo/`](reference/team-repo/) — 팀 저장소용 skeleton
3. [`docs/github-runtime-audit.md`](docs/github-runtime-audit.md) — 실제 GitHub 서버 기록 감사
4. [`CHECKLIST.md`](CHECKLIST.md) — 실제 링크/Evidence와 최종 대조

`START-CHECK.md`는 공식 Gate가 아니라 부족한 Git/협업 개념을 미리 찾기 위한 안내입니다.

## 📑 목차

- [현재 상태](#현재-상태)
- [선행 학습](#선행-학습)
- [빠른 시작](#빠른-시작quick-start)
- [입문자 가이드 구조](#입문자-가이드-구조)
- [5계정 학습 Simulation](#5계정-학습-simulation)
- [핵심 원칙](#핵심-원칙)

## 입문자 가이드 구조

B2-2는 B1-1과 같은 3계층 정보 구조를 사용합니다.

```text
BEGINNER-GUIDE.md
→ guide/<module>/README.md
→ guide/<module>/<learning-unit>.md
```

현재 모듈은 `00-overview`부터 `08-verification-evaluation`까지 나뉘며, 중앙 `BEGINNER-GUIDE.md`는 상세 명령을 반복하지 않고 Quick Start와 전체 이동 경로를 담당합니다.

분할 감사 기록:

- [`docs/BEGINNER-GUIDE-MODULARIZATION-AUDIT.md`](docs/BEGINNER-GUIDE-MODULARIZATION-AUDIT.md)

## 5계정 학습 Simulation

GitHub 학습 계정은 총 5개를 준비하고, 동일한 5개 계정을 MAC-V와 WIN-V에서 각각 사용합니다.

기본 권장 경로:

```text
CORE
MAC-V: OrbStack Ubuntu 24.04 `codyssey` + Linux User codyssey01~05
WIN-V: WSL2 Ubuntu 24.04 + Linux User codyssey01~05
        ↓
CROSS-PLATFORM
MAC-V ↔ WIN-V 협업
        ↓
ADVANCED
MAC-V: 독립 OrbStack Ubuntu machine 5개
WIN-V: 독립 WSL2 instance 또는 Ubuntu 24.04 VM 5개
```

GitHub 로그인은 `gh`(GitHub CLI)를 기본으로 사용하고, Linux User/VM별 GitHub Identity를 1:1로 고정합니다.

상세 기준은 [`environment/MULTI-ACCOUNT-SIMULATION.md`](environment/MULTI-ACCOUNT-SIMULATION.md)를 사용합니다.

> Simulation PASS/CLEAR는 실제 B2-2 Mission PASS/CLEAR가 아닙니다. 학습 Simulation 기록을 실제 팀 Evidence로 대체하지 않습니다.

## 핵심 원칙

B2-2는 Reference 문서의 존재보다 **실제 팀의 Issue/PR/Review/Conflict/Troubleshooting 기록**이 중요합니다.

```text
시작 전 지식 체크
→ 환경 / Identity 확인
→ 실제 3~5인 팀
→ Issue / feature / PR / Review
→ conflict / troubleshooting
→ SUBMISSION actual links
→ local verify + GitHub server audit
→ Evaluation
→ CLEAR
```

`TODO_RUNTIME`을 임의 링크/가상 기록으로 채우지 않습니다. 실제 Runtime과 Evidence가 완료되기 전에는 `✅ CLEAR`가 아닙니다.
