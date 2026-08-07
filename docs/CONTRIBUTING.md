# B2-2 Collaboration Guide

This repository uses GitHub Flow. `main` represents the team-agreed working state, so feature work is isolated and merged only through reviewed Pull Requests.

## 1. Branch naming

Use one branch per Issue/work item.

```text
feature/<issue-number>-<short-topic>
docs/<issue-number>-<short-topic>
fix/<issue-number>-<short-topic>
```

Examples:

```text
feature/12-string-utils
docs/15-review-guide
fix/18-empty-input
```

Do not reuse a completed branch for unrelated work.

## 2. Commit messages

Preferred format:

```text
feat: <subject>
fix: <subject>
docs: <subject>
refactor: <subject>
test: <subject>
chore: <subject>
```

A message must reveal what changed or why. Avoid messages such as `update`, `fix`, `temp`, `wip`, `final`, `bug fix`, or `edit file` when used without meaningful context.

## 3. Issue → Branch → PR flow

1. Create an Issue describing one concrete task.
2. Create a branch from current `main`.
3. Implement the task in small meaningful commits.
4. Push the branch and open a Pull Request.
5. Add `Closes #<issue-number>` or `Fixes #<issue-number>`.
6. Complete What / Why / How in the PR body.
7. Request review from another team member.
8. Apply or discuss review feedback.
9. Receive at least one approval when branch protection is enabled.
10. Merge through GitHub; do not directly push the feature result to `main`.

## 4. Pull Request minimum content

Every PR must contain:

- linked Issue (`Closes #n` or `Fixes #n`)
- **What**: what changed
- **Why**: why it was needed
- **How**: how it was tested or verified
- relevant evidence or screenshots when the task is procedural

## 5. Code review minimum quality

A qualifying review is more than `LGTM`, `좋아요`, or an approval without explanation.

At least one substantive comment should reference a concrete file, line, behavior, decision, risk, alternative, or test. Useful review forms include:

- question about a specific implementation choice
- risk or edge-case identification
- alternative approach with rationale
- request for clearer naming/documentation
- test or reproduction suggestion

The author must respond to review feedback at least once through a reply, code/document change, or follow-up commit. `SUBMISSION.md` should link to the evidence.

## 6. Conflict response flow

When a conflict occurs:

1. **Share** — record which branches/files are conflicting and notify the affected teammate.
2. **Understand** — inspect both intended changes before deleting conflict markers.
3. **Resolve** — edit the file so the final content preserves the correct combined intent.
4. **Verify** — run the relevant check or inspect the resulting document/code.
5. **Commit** — use a meaningful conflict-resolution commit message.
6. **Record** — add the situation, procedure, result, caution, and evidence link to `docs/conflict-resolution.md`.

Do not resolve by blindly choosing `ours` or `theirs` unless the team has verified that choice.

## 7. Shared history safety

- Do not force-push `main`.
- Do not rewrite shared branch history without team agreement.
- Prefer `git revert` for commits already shared/pushed.
- Use `reset` only for local/private history when the team has not depended on it.
- Interactive rebase is optional and should stay on a private feature branch unless the team explicitly coordinates it.

## 8. Hotfix flow

For an urgent fix on `main`:

1. Create an Issue describing the incident/fix.
2. Branch from latest `main` as `fix/<issue>-<topic>`.
3. Apply the smallest safe fix and verify it.
4. Open a PR with `Closes #n`, What/Why/How.
5. Request expedited but real review/approval.
6. Merge through the protected branch path.
7. Re-check `main` and document any follow-up work.

## 9. Poor commit messages already pushed

Do not rewrite a shared branch casually. If the commits are already shared, preserve history and improve traceability through the PR description, Issue context, and a follow-up commit where needed. Reword/squash only on a private feature branch before other people depend on it, and coordinate any force-push explicitly.

## 10. Repeated conflicts: prevention

If the same file/area conflicts repeatedly:

- reduce task/branch size
- divide ownership by file/module or smaller work units
- merge smaller PRs more frequently
- communicate before touching the same hunk
- move shared constants/interfaces to stable boundaries
- rebase/merge latest `main` into the feature branch only with the team's agreed workflow

## 11. Branch Protection target

Human Runtime must configure `main` so that:

- changes require a Pull Request
- direct pushes are prevented for normal contributors
- at least 1 approving review is required

The exact GitHub rule/ruleset screen is runtime evidence and must not be inferred from this document.
