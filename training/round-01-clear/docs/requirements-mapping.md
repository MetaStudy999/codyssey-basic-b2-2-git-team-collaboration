# B2-2 R01 — Requirement / Verification / Evidence Mapping

B2-2는 **실제 GitHub 협업 기록**이 평가 핵심입니다. Reference 문서 존재만으로 Runtime 요구를 충족했다고 표시하지 않습니다.

| ID | Requirement | Reference Preparation | Runtime Verification | Evidence |
|---|---|---|---|---|
| R01 | 3~5인 팀 + 팀 저장소 1개 | Team skeleton | Collaborator/Org 확인 | repo/team 화면 |
| R02 | main Branch Protection | `CONTRIBUTING.md` 정책 | GitHub rules/protection 확인 | 설정 캡처/출력 |
| R03 | main 직접 push 금지 / PR only / approval 1+ | 정책/가이드 | 실제 merge history | protection + PR |
| R04 | GitHub Flow main/feature | branch naming 규칙 | branches/PR history | git graph/PR |
| R05 | Issue → PR `Closes #n` | Issue/PR templates | 각 실제 PR 본문 | Issue/PR links |
| R06 | commit convention | CONTRIBUTING | actual git log | commit history |
| R07 | 전원 merged PR 2+ | SUBMISSION template | member별 PR count | PR links |
| R08 | 전원 타인 review 2+ | review quality rules | review count/content | Review links |
| R09 | 전원 본인 PR feedback 반영 1+ | PR flow | comment→reply/commit | PR conversation |
| R10 | PR What/Why/How | PR template | 실제 PR 본문 | PR links |
| R11 | 실질 Review + 상호작용 | review rules | line/file based comment + response | review thread |
| R12 | conflict 2+ | conflict scenarios | 실제 해결 기록 | docs + PR/commit |
| R13 | non-trivial conflict 1+ | same-hunk / rename-modify 설계 | 실제 conflict | conflict doc/evidence |
| R14 | amend | troubleshooting scenario A | actual command/history | log + commit |
| R15 | reset --soft | scenario B | actual local before/after | log |
| R16 | revert | scenario C | actual revert commit | commit/PR |
| R17 | stash/pop | scenario D | actual stash before/after | command log |
| R18 | 팀원별 troubleshooting 참여 1+ | log template | names/roles | doc links |
| R19 | CONTRIBUTING | reference doc | actual team doc | file |
| R20 | conflict-resolution | reference doc | actual 2+ records | file |
| R21 | troubleshooting-log | reference doc | actual 4 scenarios | file |
| R22 | simple deliverable + member commit 1+ | src guidance | actual member commits | commit links |
| R23 | SUBMISSION index | template | all actual links | SUBMISSION.md |
| R24 | git graph evidence | guide | `git log --oneline --graph --all` | text/screenshot |
| R25 | Git concepts/exceptions | Evaluation Q&A | user explanation | evaluator check |

## 핵심 원칙

실제 PR/Review/Conflict를 자동 생성해서 수량만 맞추는 것은 R01 학습 목적과 맞지 않습니다. Phase C에서 팀원들이 직접 Issue/Branch/PR/Review/Conflict를 경험하고 링크를 `SUBMISSION.md`에 연결합니다.
