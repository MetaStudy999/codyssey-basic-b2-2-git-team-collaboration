# B2-2 Learning Check

Use this after the real collaboration exercise. The learner should be able to answer without reading a script and point to repository evidence where appropriate.

## 1. What is a branch?

A Git branch is a movable reference that points to a commit. Creating a feature branch gives a separate name/reference for a line of work without copying the whole repository.

## 2. Why GitHub Flow?

A short-lived branch isolates one work item while `main` stays in the team-agreed working state. A Pull Request provides a visible checkpoint for discussion, review, verification, and traceability before merge.

## 3. Why not push directly to `main`?

PR + approval adds a quality checkpoint, assigns visible responsibility, preserves discussion, and creates a durable record connecting the change to its Issue and review.

## 4. Why link Issue and PR?

Issue↔PR links connect intent, discussion, implementation, and completion. Keywords such as `Closes #n` can also automate Issue closure after merge.

## 5. What do conflict markers mean?

```text
<<<<<<<
=======
>>>>>>>
```

They delimit competing versions of a conflicted region. The resolver must understand both changes and create the correct final content; deleting markers alone is not a valid resolution strategy.

## 6. `reset` vs `revert`

- `reset` moves a local reference such as the current branch and is appropriate for private/local history when used carefully.
- `revert` creates a new commit that inverses an existing commit, preserving shared history; this is generally safer for a commit already pushed and used by others.

## 7. `stash`

`git stash` temporarily stores uncommitted changes so the working tree can switch context. `git stash pop` reapplies the saved changes and can itself produce conflicts.

## 8. `commit --amend`

`git commit --amend` replaces the current tip commit and therefore changes its commit SHA. It is useful before sharing the commit, but rewriting already shared history requires coordination.

## 9. Urgent hotfix

Create an Issue, branch from current `main`, make the smallest fix, verify it, open a PR with What/Why/How and Issue linkage, obtain the required review/approval, merge, then verify `main`.

## 10. Repeated conflicts

Investigate ownership overlap, oversized work items, long-lived branches, shared-file hotspots, and communication gaps. Prevent recurrence by making smaller PRs, clarifying ownership/boundaries, integrating frequently, and coordinating before editing the same hunk.

## Runtime evidence prompts

- Show one PR where review feedback changed the author's work.
- Show one non-trivial conflict and explain the decision made during resolution.
- Show why a completed `revert` was safer than rewriting shared history.
- Show the Git graph and trace one Issue → branch → PR → review → merge path.
