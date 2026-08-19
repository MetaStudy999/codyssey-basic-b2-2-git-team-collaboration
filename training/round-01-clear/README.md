# B2-2 Round 01 — CLEAR

## 현재 상태

- Runtime Mission: **⬜ NOT STARTED**
- Phase A Reference Build: **CORE READY**
- 실제 팀 GitHub Runtime/Evidence: **미실행**
- CLEAR: **아님**

## 선행 학습

- **필수 선행 미션:** 없음
- **권장 선행 미션:** B2-1
- **있으면 좋은 선행 지식:** Git `add/commit/branch/merge/remote`, GitHub Issue/PR 기초

B2-1을 먼저 수행하면 개인 단위 Python/Git 작업 흐름을 익힌 뒤 팀 협업으로 확장하기 쉬워집니다. 그러나 Git/GitHub 기본 사용 경험이 이미 있다면 B2-1을 CLEAR하지 않고도 B2-2를 시작할 수 있습니다.

## 빠른 시작(Quick Start)

1. `START-CHECK.md` — Git/GitHub 기본 흐름 자가진단
2. `REFERENCE-STATUS.md`
3. `REFERENCE-BUILD.md`
4. `environment/MULTI-ACCOUNT-SIMULATION.md` — 5계정 MAC-V/WIN-V 학습 Simulation
5. `reference/team-repo/`
6. `docs/github-runtime-audit.md`
7. `BEGINNER-GUIDE.md`
8. `CHECKLIST.md`

`START-CHECK.md`는 공식 Gate가 아니라 부족한 Git/협업 개념을 미리 찾기 위한 안내입니다.

## 📑 목차

- [현재 상태](#현재-상태)
- [선행 학습](#선행-학습)
- [빠른 시작](#빠른-시작quick-start)
- [5계정 학습 Simulation](#5계정-학습-simulation)
- [핵심 원칙](#핵심-원칙)

## 5계정 학습 Simulation

B2-2 학습용으로 GitHub 계정은 총 5개를 준비하고, 동일한 5개 계정을 MAC-V와 WIN-V에서 각각 사용합니다.

기본 권장 경로:

```text
MAC-V: Runtime 1개 + Linux User codyssey01~05
WIN-V: Runtime 1개 + Linux User codyssey01~05
        ↓
MAC-V ↔ WIN-V Cross-platform Simulation
        ↓
MAC-V: codyssey01~05 VM/Instance 5개 확장
WIN-V: codyssey01~05 VM/Instance 5개 확장
```

GitHub 로그인은 `gh`(GitHub CLI)를 기본으로 사용하고, Linux User/VM별 GitHub Identity를 1:1로 고정합니다.

상세 기준은 [`environment/MULTI-ACCOUNT-SIMULATION.md`](environment/MULTI-ACCOUNT-SIMULATION.md)를 사용합니다.

> Simulation PASS/CLEAR는 실제 B2-2 Mission PASS/CLEAR가 아닙니다. 학습 Simulation 기록을 실제 팀 Evidence로 대체하지 않습니다.

## 핵심 원칙

B2-2는 Reference 문서의 존재보다 **실제 팀의 Issue/PR/Review/Conflict/Troubleshooting 기록**이 중요합니다.

```text
시작 전 지식 체크
→ Reference Team Skeleton
→ 실제 3~5인 팀
→ Issue / feature / PR / Review
→ conflict / troubleshooting
→ SUBMISSION actual links
→ local verify + GitHub server audit
→ Evaluation
→ CLEAR
```

`TODO_RUNTIME`을 임의 링크/가상 기록으로 채우지 않습니다. 실제 Runtime 이전에는 `✅ CLEAR`가 아닙니다.
