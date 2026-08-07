# B2-2 Submission & Evidence Index

> This file is the single index for B2-2 collaboration evidence. `PENDING` means the event has not yet been verified. Do not replace placeholders with invented URLs.

## Repository

- Repository: https://github.com/MetaStudy999/codyssey-basic-b2-2-git-team-collaboration
- Mission: `B2-2`
- Control Tower baseline: `0d1581b3e82366988f57e1d76da311c028b8e15e`

## 1. Team and access

| Item | Status | Evidence |
|---|---|---|
| 3–5 real team members | `PENDING` | collaborator/team settings link or screenshot |
| collaboration permission accepted | `PENDING` | GitHub access/settings evidence |
| `main` Branch Protection / ruleset | `PENDING` | rule/ruleset link or screenshot |
| PR required before merge | `PENDING` | rule/ruleset evidence |
| >=1 approving review required | `PENDING` | rule/ruleset evidence |

Current baseline observation before runtime: repository owner was the only collaborator and `main` reported `protected: false`.

## 2. Team member contribution matrix

Fill this table only from actual GitHub activity.

| Team member | Issue links | Merged PR 1 | Merged PR 2 | Review 1 (other PR) | Review 2 (other PR) | Own-PR feedback applied | Deliverable commit |
|---|---|---|---|---|---|---|---|
| `TBD-1` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-2` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-3` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-4` (if used) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-5` (if used) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |

### Existing historical repository activity

The pre-Workcell repository contained PR #1 (`docs: B2-2 평가 문항 추가`) by the repository owner. It had no submitted reviews and did not link a separate task Issue with `Closes #n`; therefore it is **not** counted here as proof that the team-member minimums are satisfied.

Workcell preparation is tracked in Issue #2 and the `mission/b2-2-workcell` branch. AI/owner preparation activity does not substitute for the required 3–5 person team collaboration.

## 3. PR quality checklist

Each qualifying team PR should have:

- [ ] `Closes #n` or `Fixes #n`
- [ ] What
- [ ] Why
- [ ] How / verification
- [ ] at least one substantive review comment
- [ ] author/reviewer interaction
- [ ] approval before merge

## 4. Conflict evidence

| Required conflict | Status | Participants | Issue/PR | Commit/evidence | Log entry |
|---|---|---|---|---|---|
| Conflict 1 | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/conflict-resolution.md` |
| Conflict 2 — non-trivial | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/conflict-resolution.md` |

Non-trivial means same-hunk divergent edits or a move/rename/delete-versus-modify merge/rebase problem.

## 5. Troubleshooting evidence

| Scenario | Status | Participant(s) | Branch / Issue / PR | Evidence | Log entry |
|---|---|---|---|---|---|
| `git commit --amend` | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/troubleshooting-log.md` |
| `git reset --soft HEAD~1` | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/troubleshooting-log.md` |
| `git revert` | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/troubleshooting-log.md` |
| `git stash` / `git stash pop` | `PENDING` | `TBD` | `TBD` | `TBD` | `docs/troubleshooting-log.md` |

## 6. Required documents

| Document | Status |
|---|---|
| `MISSION-WORK-PACKET.md` | `IMPLEMENTED` on Workcell branch |
| `docs/CONTRIBUTING.md` | `IMPLEMENTED` on Workcell branch |
| `docs/conflict-resolution.md` | `IMPLEMENTED` template; runtime entries pending |
| `docs/troubleshooting-log.md` | `IMPLEMENTED` template; runtime entries pending |
| `SUBMISSION.md` | `IMPLEMENTED` index; runtime links pending |
| `HANDOFF.md` | `PENDING` until Workcell review is recorded |
| `mission-result.yaml` | `PENDING` until Workcell review is recorded |

## 7. Git graph evidence

Run after the real team activity is complete:

```bash
git log --oneline --graph --decorate --all
```

- Status: `PENDING`
- Evidence file/screenshot/link: `TBD`

## 8. Final gate

B2-2 may be marked PASS only when the tables above are backed by actual GitHub/runtime evidence, all required criteria are satisfied, and `BLOCKER=0`, `MAJOR=0`.
