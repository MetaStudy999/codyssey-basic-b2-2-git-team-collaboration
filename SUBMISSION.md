# B2-2 Submission & Evidence Index

> This file is the single index for B2-2 collaboration evidence. `PENDING` means the event has not yet been verified. Do not replace placeholders with invented URLs.

## Repository / Workcell

- Repository: https://github.com/MetaStudy999/codyssey-basic-b2-2-git-team-collaboration
- Mission: `B2-2`
- Control Tower baseline: `0d1581b3e82366988f57e1d76da311c028b8e15e`
- Workcell Issue: https://github.com/MetaStudy999/codyssey-basic-b2-2-git-team-collaboration/issues/2
- Workcell draft PR: https://github.com/MetaStudy999/codyssey-basic-b2-2-git-team-collaboration/pull/3

## 1. Team and access

| Item | Status | Evidence |
|---|---|---|
| 3–5 real team members | `PENDING` | collaborator/team settings link or screenshot |
| collaboration permission accepted | `PENDING` | GitHub access/settings evidence |
| `main` Branch Protection / ruleset | `PENDING` | rule/ruleset link or screenshot |
| PR required before merge | `PENDING` | rule/ruleset evidence |
| >=1 approving review required | `PENDING` | rule/ruleset evidence |

Baseline observation: repository owner was the only collaborator and `main` reported `protected: false`.

## 2. Team member contribution matrix

Fill this table only from actual GitHub activity.

| Team member | Issue links | Merged PR 1 | Merged PR 2 | Review 1 (other PR) | Review 2 (other PR) | Own-PR feedback applied | Deliverable commit |
|---|---|---|---|---|---|---|---|
| `TBD-1` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-2` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-3` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-4` (if used) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |
| `TBD-5` (if used) | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` | `PENDING` |

### Existing repository activity that does not satisfy team minimums

- Historical PR #1 was authored by the repository owner, had no submitted reviews, and did not link a separate task Issue with `Closes/Fixes #n`; it does not prove the team-member minimums.
- Workcell Issue #2 / draft PR #3 prepare the repository. AI/owner preparation does not substitute for the required 3–5 person collaboration.

## 3. PR quality checklist

Each qualifying **team** PR must have:

- [ ] `Closes #n` or `Fixes #n`
- [ ] What
- [ ] Why
- [ ] How / verification
- [ ] at least one substantive review comment by another team member
- [ ] author/reviewer interaction
- [ ] required approval before merge

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

## 6. Team deliverable

Selected option: **team introduction**.

Each real participant must add a real `team/<github-id>.md` contribution through the collaboration workflow.

| Team member | File | Qualifying commit / PR | Status |
|---|---|---|---|
| `TBD-1` | `TBD` | `TBD` | `PENDING` |
| `TBD-2` | `TBD` | `TBD` | `PENDING` |
| `TBD-3` | `TBD` | `TBD` | `PENDING` |
| `TBD-4` (if used) | `TBD` | `TBD` | `PENDING` |
| `TBD-5` (if used) | `TBD` | `TBD` | `PENDING` |

## 7. Required documents / static scaffold

| Document / structure | Status |
|---|---|
| `MISSION-WORK-PACKET.md` | `IMPLEMENTED` on Workcell branch |
| `.github/ISSUE_TEMPLATE/work-item.md` | `IMPLEMENTED` |
| `.github/pull_request_template.md` | `IMPLEMENTED` |
| `docs/CONTRIBUTING.md` | structure `IMPLEMENTED`; team-divided authorship pending |
| `docs/conflict-resolution.md` | template `IMPLEMENTED`; runtime entries pending |
| `docs/troubleshooting-log.md` | template `IMPLEMENTED`; runtime entries pending |
| `docs/learning-check.md` | `IMPLEMENTED`; live explanation pending |
| `src/` | scaffold `IMPLEMENTED` |
| `team/` | scaffold `IMPLEMENTED`; member files pending |
| `SUBMISSION.md` | `IMPLEMENTED`; runtime links pending |
| `HANDOFF.md` | `IMPLEMENTED` as pre-runtime handoff |
| `mission-result.yaml` | `IMPLEMENTED`; overall verdict `NEEDS-RUNTIME` |

## 8. Git graph evidence

Run after the real team activity is complete:

```bash
git log --oneline --graph --decorate --all
```

- Status: `PENDING`
- Evidence file/screenshot/link: `TBD`

## 9. Current gate / severity

- G1 SOURCE: `PASS`
- G2 BUILD: `PASS`
- G3 TEST: `PASS`
- G4 REVIEW: `PASS`
- G5 RUNTIME: `NEEDS-RUNTIME`
- G6 EVIDENCE: `NEEDS-RUNTIME`
- G7 LEARN: `NEEDS-RUNTIME`
- G8 MERGE: `BLOCKED`
- `BLOCKER=3`
- `MAJOR=0`

B2-2 may be marked PASS only when the tables above are backed by actual GitHub/runtime evidence and the Mission reaches `BLOCKER=0`, `MAJOR=0`.
