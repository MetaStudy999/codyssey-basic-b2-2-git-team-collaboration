# B2-2 MAC-V — Execution Record Template

> **TRAINING SIMULATION — NOT OFFICIAL B2-2 EVIDENCE**

이 문서는 학교 공용 Mac에서 실제 MAC-V 실행 결과를 정리하기 위한 템플릿입니다.

실제 값을 확인하지 못한 항목은 `PASS`로 쓰지 않습니다.

## 1. Runtime Context

```text
Executed At       : YYYY-MM-DD HH:MM KST
Host              : 학교 공용 Mac
Virtualization    : OrbStack
Machine           : codyssey
Linux Runtime     : Ubuntu 24.04
Architecture      : TODO_ACTUAL
B2-2 Commit       : TODO_ACTUAL
Control Tower SHA : TODO_ACTUAL
```

## 2. Host / CORE

```text
OrbStack status                  : TODO_ACTUAL
codyssey exists                  : TODO_ACTUAL
Ubuntu 24.04                     : TODO_ACTUAL
Control Tower bootstrap          : TODO_ACTUAL
codyssey01~05                    : TODO_ACTUAL
HOME / Workspace verification    : TODO_ACTUAL
```

관련 실행:

```text
mac-v-orchestrate.sh --prepare
또는
host-preflight.sh + prepare-core.sh
```

## 3. Five-account Identity Gate

| Linux User | Expected GitHub | Actual GitHub | Git identity | Result |
|---|---|---|---|---|
| `codyssey01` | TODO | TODO | TODO | TODO |
| `codyssey02` | TODO | TODO | TODO | TODO |
| `codyssey03` | TODO | TODO | TODO | TODO |
| `codyssey04` | TODO | TODO | TODO | TODO |
| `codyssey05` | TODO | TODO | TODO | TODO |

Token/Password/2FA/Private Key 실제 값은 기록하지 않습니다.

## 4. Simulation Repository

```text
Repository : TODO_ACTUAL
Visibility : TODO_ACTUAL
main rule  : TODO_ACTUAL
Account A~E access : TODO_ACTUAL
```

5개 clone:

```text
codyssey01 : TODO_ACTUAL
codyssey02 : TODO_ACTUAL
codyssey03 : TODO_ACTUAL
codyssey04 : TODO_ACTUAL
codyssey05 : TODO_ACTUAL
```

## 5. Collaboration Counts

| Account | Merged PR | Substantive Review | Feedback applied | Code contribution |
|---|---:|---:|---:|---|
| A | TODO | TODO | TODO | TODO |
| B | TODO | TODO | TODO | TODO |
| C | TODO | TODO | TODO | TODO |
| D | TODO | TODO | TODO | TODO |
| E | TODO | TODO | TODO | TODO |

목표:

```text
Merged PR          2+ per account
Review             2+ per account
Feedback applied   1+ per account
Code contribution  1+ per account
```

## 6. Conflict / Troubleshooting

```text
Conflict #1            : TODO_ACTUAL
Conflict #2            : TODO_ACTUAL
Non-trivial conflict   : TODO_ACTUAL
amend                  : TODO_ACTUAL
reset --soft           : TODO_ACTUAL
revert                 : TODO_ACTUAL
stash / stash pop      : TODO_ACTUAL
5-account participation: TODO_ACTUAL
```

## 7. Simulation Evidence

```text
SUBMISSION.md          : TODO_ACTUAL
Git graph              : TODO_ACTUAL
GitHub count audit     : TODO_ACTUAL
Secret exposure check : TODO_ACTUAL
```

Repository 내부 참고 위치:

```text
training/round-01-clear/evidence/simulation/mac-v/
```

## 8. Closeout

학교 공용 PC이므로 실제 종료 시 확인합니다.

```text
All changes pushed       : TODO_ACTUAL
Five gh sessions logout  : TODO_ACTUAL
Browser GitHub logout    : TODO_ACTUAL
Secret/token residue     : TODO_ACTUAL
OrbStack stop if needed  : TODO_ACTUAL
```

## 9. Final MAC-V Simulation 판정

```text
Host / CORE              : TODO_ACTUAL
Identity Gate 5/5        : TODO_ACTUAL
Clone 5/5                : TODO_ACTUAL
GitHub Flow training     : TODO_ACTUAL
Conflict                 : TODO_ACTUAL
Troubleshooting          : TODO_ACTUAL
Simulation Evidence      : TODO_ACTUAL
Closeout                 : TODO_ACTUAL

MAC-V Simulation Result  : NOT RUN / PENDING / PASS / FAIL
```

> `MAC-V Simulation PASS ≠ B2-2 Mission CLEAR`
