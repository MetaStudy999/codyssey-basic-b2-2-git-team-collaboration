# Conflict Resolution Log

> Only record conflicts that actually occurred in Git/GitHub. Do not backfill fictional events. B2-2 requires at least two real conflict resolutions, including at least one non-trivial conflict.

## Required fields

Each entry must include:

- date/time
- participants
- Issue / PR / branch
- files and conflicting hunk or operation
- conflict type
- situation / cause
- exact resolution procedure
- verification result
- caution / lesson
- commit or PR evidence link

## Conflict 1 — PENDING

- Status: `PENDING`
- Type: to be recorded after a real conflict
- Participants: `TBD`
- Issue / PR: `TBD`
- Branches: `TBD`
- Files: `TBD`
- Situation / cause: `TBD`
- Procedure: `TBD`
- Verification: `TBD`
- Result: `TBD`
- Caution / lesson: `TBD`
- Evidence: `TBD`

## Conflict 2 — PENDING (must be non-trivial)

A qualifying non-trivial conflict must use at least one of these patterns:

1. Two branches change the same hunk/adjacent lines differently.
2. One branch moves/renames/deletes a file while another branch modifies that file, producing a merge/rebase issue.

- Status: `PENDING`
- Type: `NON_TRIVIAL_REQUIRED`
- Participants: `TBD`
- Issue / PR: `TBD`
- Branches: `TBD`
- Files / operation: `TBD`
- Situation / cause: `TBD`
- Conflict markers or Git message observed: `TBD`
- Decision criteria: `TBD`
- Procedure: `TBD`
- Verification: `TBD`
- Result: `TBD`
- Caution / lesson: `TBD`
- Evidence: `TBD`

## Conflict marker reminder

```text
<<<<<<< current-side
content from one side
=======
content from the other side
>>>>>>> incoming-side
```

The markers separate the competing changes. A correct resolution is a deliberate final version, not merely deleting the marker lines.
