# Git Troubleshooting Log

> B2-2 requires four real scenarios: `amend`, `reset --soft`, `revert`, and `stash/stash pop`. Each team member must participate in at least one scenario record. Keep all entries `PENDING` until actually executed.

## Entry format

Every completed entry must record:

- participant(s) and role
- date/time
- branch and related Issue/PR
- starting situation
- exact commands/procedure
- before/after commit or working-tree state
- result and verification
- caution / when not to use it
- evidence link or commit SHA

## 1. `git commit --amend` — PENDING

**Goal:** correct the most recent local commit message before it becomes shared history.

Suggested lab:

```bash
git log -1 --oneline
git commit --amend -m "docs: clarify collaboration guide"
git log -1 --oneline
```

- Status: `PENDING`
- Participant: `TBD`
- Situation: `TBD`
- Procedure/result: `TBD`
- Caution: rewriting a commit changes its SHA; coordinate before rewriting shared history.
- Evidence: `TBD`

## 2. `git reset --soft HEAD~1` — PENDING

**Goal:** remove a local commit while keeping its changes staged.

Suggested lab on a private feature branch:

```bash
git log -2 --oneline
git reset --soft HEAD~1
git status
git diff --cached
```

- Status: `PENDING`
- Participant: `TBD`
- Situation: `TBD`
- Procedure/result: `TBD`
- Caution: do not use this to rewrite shared `main` history.
- Evidence: `TBD`

## 3. `git revert` — PENDING

**Goal:** undo an already shared/pushed commit by creating a new inverse commit.

Suggested lab:

```bash
git log --oneline
git revert <commit-sha>
git log -2 --oneline
```

- Status: `PENDING`
- Participant: `TBD`
- Situation: `TBD`
- Procedure/result: `TBD`
- Caution: verify the target commit and resulting behavior before merging the revert.
- Evidence: `TBD`

## 4. `git stash` / `git stash pop` — PENDING

**Goal:** temporarily store uncommitted work, switch context, then restore it.

Suggested lab:

```bash
git status
git stash push -m "b2-2 stash lab"
git stash list
git switch <other-branch>
git switch <original-branch>
git stash pop
git status
```

- Status: `PENDING`
- Participant: `TBD`
- Situation: `TBD`
- Procedure/result: `TBD`
- Caution: `stash pop` can itself cause conflicts; inspect the result before continuing.
- Evidence: `TBD`

## Participation matrix

| Team member | amend | reset | revert | stash | At least one completed? |
|---|---:|---:|---:|---:|---:|
| `TBD-1` |  |  |  |  | `PENDING` |
| `TBD-2` |  |  |  |  | `PENDING` |
| `TBD-3` |  |  |  |  | `PENDING` |
| `TBD-4` (if used) |  |  |  |  | `PENDING` |
| `TBD-5` (if used) |  |  |  |  | `PENDING` |
