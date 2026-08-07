# B2-2 Mission Work Packet

## 1. Identity

- Mission: `B2-2` — 친구 3~5명과 함께 프로그램 만드는 법 연습하기
- Target repository: `MetaStudy999/codyssey-basic-b2-2-git-team-collaboration`
- Working branch: `mission/b2-2-workcell`
- Control Tower: `MetaStudy999/codyssey-basic` (**READ ONLY**)
- Frozen Control Tower baseline: `0d1581b3e82366988f57e1d76da311c028b8e15e`
- Target repository baseline before this Workcell: `845ea2e47bc2b49864893db8ed3dd34208c0ef44`
- Workcell Issue: `#2`
- Workcell PR: `#3` (draft)
- Dependency: `NONE`

## 2. Control Tower Baseline / Drift

Active Wave `20260808-01` maps B2-2 to this repository and starter packet `docs/00-governance/work-packets/b2-2.md`. The starter packet blob SHA `35d02c4465e602ca48cb1367dd4184a0ad881bd4` matches the frozen baseline tree checked by this Workcell.

The Wave manifest and launcher are intentionally outside the frozen Governance baseline. No mission-impacting Governance drift was found. The Control Tower was not modified.

One path drift was found in the starter packet description: it names the representative Mission index as `b2-2-git-team-collaboration.md`, while the frozen repository actually contains `docs/02-domains/02-python-git/b2-2-git-collaboration.md`. The actual frozen file was used; this does not change Mission requirements.

## 3. Source Inventory

| Source | Path | State | Notes |
|---|---|---|---|
| Mission PDF | `b2-2-mission.pdf` | `UNREADABLE` in current PDF viewer | File exists (514,104 bytes). PDF visual parity could not be independently checked. |
| Mission Markdown | `b2-2-mission.md` | `VALID` | Substantive requirements; states it preserves the 10-page PDF content. |
| Evaluation Markdown | `b2-2-evaluation.md` | `VALID` | Four substantive evaluation sections. |
| Mission index | Control Tower `docs/02-domains/02-python-git/b2-2-git-collaboration.md` | `VALID` | Confirms title, required status, repository, and collaboration objective. |
| Source registry | Control Tower `docs/00-governance/source-registry.md` | `VALID` | Registers `b2-2-mission.pdf` as the B2-2 Mission PDF. |

### Source Decision

- Source Mode: `FULL SOURCE`
- Source Confidence: `MEDIUM`
- Source Gap: original PDF visual/content parity is not independently verified in the current tool environment.
- Rule applied: no requirement was invented to fill that gap.

## 4. Mission Contract

The confirmed outcome is one real 3–5 person team repository demonstrating GitHub Flow through actual Issues, work branches, commits, Pull Requests, reviews, merges, conflict resolution, troubleshooting, documentation, and traceable evidence.

Required deliverables include:

1. Team GitHub repository URL.
2. `SUBMISSION.md`.
3. `docs/CONTRIBUTING.md`.
4. `docs/conflict-resolution.md`.
5. `docs/troubleshooting-log.md`.
6. Git history evidence (`git log --oneline --graph --all` text or screenshot).
7. One simple team deliverable. This repository selects the **team introduction** option under `team/`.

## 5. Requirement Traceability

| ID | Confirmed requirement | Current status |
|---|---|---|
| REQ-001 | Real team of 3–5 people with collaboration access | `NEEDS-RUNTIME` — only owner is currently a collaborator |
| REQ-002 | Protect `main`; block direct push; PR-only merge; >=1 approval | `BLOCKED` — GitHub reports `main` as not protected |
| REQ-003 | GitHub Flow and branch naming rules documented | `IMPLEMENTED`; real team usage pending |
| REQ-004 | Each work item starts as an Issue and PR links it with `Closes/Fixes #n` | `IMPLEMENTED` as workflow/template; real team usage pending |
| REQ-005 | Meaningful commit-message convention documented | `IMPLEMENTED` |
| REQ-006 | Every team member has >=2 merged PRs | `NEEDS-RUNTIME` |
| REQ-007 | Every team member has >=2 reviews on others' PRs | `NEEDS-RUNTIME` |
| REQ-008 | Every team member applies review feedback on own PR >=1 time | `NEEDS-RUNTIME` |
| REQ-009 | PR body consistently contains Issue link + What/Why/How | `IMPLEMENTED` as template; real team usage pending |
| REQ-010 | Substantive review comment + author/reviewer interaction | `NEEDS-RUNTIME` |
| REQ-011 | >=2 conflict resolutions including >=1 non-trivial conflict | `NEEDS-RUNTIME` |
| REQ-012 | Real amend/reset/revert/stash scenarios; every member participates in >=1 | `NEEDS-RUNTIME` |
| REQ-013 | `CONTRIBUTING.md` required content and team-divided authorship | structure `IMPLEMENTED`; team authorship `NEEDS-RUNTIME` |
| REQ-014 | Required repository structure (`README`, `docs/`, `src/`, `team/`) | `IMPLEMENTED` as scaffold |
| REQ-015 | Team-introduction deliverable; each member contributes >=1 commit | scaffold `IMPLEMENTED`; member contributions `NEEDS-RUNTIME` |
| REQ-016 | No unsafe shared-history rewrite / force push without agreement | policy `IMPLEMENTED`; runtime compliance pending |

## 6. Evaluation Mapping

### Evaluation 1 — Results and collaboration records

Static documents are prepared. Team membership/access, Branch Protection, team PR/review counts, feedback application, conflicts, troubleshooting, and final evidence require real GitHub activity and remain Human Runtime.

### Evaluation 2 — Implementation and process explanation

The collaboration guide and log formats define branch granularity, PR What/Why/How, substantive review quality, conflict flow, and reproducible troubleshooting fields. Live explanation remains part of Human Runtime / learning verification.

### Evaluation 3 — Git collaboration concepts

`docs/learning-check.md` covers deployable `main`, PR + approval rationale, Issue↔PR traceability, `revert` vs `reset`, conflict markers, and non-trivial conflict reasoning.

### Evaluation 4 — Situational response and advanced Git

The guide covers emergency hotfix flow, handling meaningless shared commit messages without unsafe rewriting, repeated-conflict prevention, and rebase safety boundaries.

## 7. Repository Baseline

Observed before Workcell changes:

- default branch: `main`
- `main` protection: `false`
- collaborators: only `MetaStudy999`
- branches: `main`, `docs/add-b2-2-evaluation-criteria`
- Pull Requests: one merged owner-authored PR (`#1`)
- reviews on PR #1: none
- no separate feature-work Issues before Workcell Issue #2
- required collaboration documents and `SUBMISSION.md`: absent

Historical PR #1 is not counted as evidence that team-member minimums are met because it has no other-member review and no separate linked work Issue.

## 8. Mission-specific TOC

```text
B2-2
├── Source / Evaluation Discovery
├── Team / Repository Setup
├── Branch Protection
├── GitHub Flow
├── Issues / Branches / Pull Requests
├── Code Review / Feedback Application
├── Conflict Lab
├── Troubleshooting Lab
├── Collaboration Docs
├── Team Deliverable
├── SUBMISSION Index
├── Git History Evidence
├── Learning Verification
└── Handoff
```

## 9. Scope / Non-scope

### Workcell scope

- Build the collaboration operating scaffold.
- Create traceability templates and truthful evidence ledgers.
- Prepare learning verification.
- Create Issue #2 and draft PR #3 for this preparatory work.

### Human Runtime scope

- Invite 2–4 additional real collaborators and confirm accepted access.
- Configure `main` protection/ruleset with PR-only merge and >=1 approval.
- Perform real per-member Issues, branches, PRs, reviews, review-feedback application, conflicts, and troubleshooting.
- Add real team-introduction files/commits.
- Capture final Git graph and Evidence links.

### Prohibited

- Fabricating collaborators, reviews, approvals, conflicts, commands, or team contributions.
- Counting AI/owner scaffold work as another team member's activity.
- Modifying the Control Tower from this Workcell.

## 10. Agent Routing

- Orchestrator / Builder: ChatGPT using the connected GitHub repository tools.
- Automated Harness: repository inventory, GitHub state inspection, tree/diff checks.
- Self Review: one pass over PR #3 diff and evidence truthfulness.
- Independent Review: one separate evaluation-criteria pass after Self Review; it is a Workcell quality review, **not** a GitHub team-member review and must not count toward Mission review quotas.
- Runtime Authority: Human team.

## 11. Test Plan and G3 Result

Static checks performed:

1. Required source/work packet/docs/templates exist on the Workcell branch — `PASS`.
2. `SUBMISSION.md` has explicit team, PR, review, feedback, conflict, troubleshooting, and Git-graph slots — `PASS`.
3. PR template requires Issue linkage + What/Why/How — `PASS`.
4. Collaboration guide documents branch, commit, PR, review, conflict, shared-history, and hotfix rules — `PASS`.
5. Conflict and troubleshooting ledgers keep unexecuted events `PENDING` instead of fabricating results — `PASS`.
6. Required `README`, `docs/`, `src/`, `team/` scaffold exists — `PASS`.

These are **static Workcell tests**, not proof that the team collaboration Mission has passed.

## 12. Review Result

### Self Review — completed once

Finding: the initial Work Packet gate checklist still showed pre-build statuses after G2/G3. That document-state drift was corrected. No fabricated collaboration evidence or Control Tower writes were found.

### Independent criteria review — completed once

A fresh pass against the official Evaluation found the static scaffold sufficient for execution, but identified three mission-level blockers that cannot be satisfied by this single-account Workcell:

1. `BLOCKER-01` — real 3–5 person collaboration/access is absent.
2. `BLOCKER-02` — `main` Branch Protection / approval requirement is absent and no protection-write action is available in the connected tool surface.
3. `BLOCKER-03` — required team activity/evidence (member PRs/reviews/feedback, conflicts, troubleshooting, member deliverable commits, final Git graph) is absent.

Static review severity after correction: `MAJOR=0`.

## 13. Runtime Plan

1. Add 2–4 real collaborators.
2. Protect `main`: require PR, prevent normal direct push, require >=1 approval.
3. Create one Issue per task.
4. Use task branches (`feature/*`, with documented variants for docs/fixes).
5. Open PRs with `Closes/Fixes #n` + What/Why/How.
6. Each member completes >=2 merged PRs and >=2 reviews on others' PRs.
7. Each member applies/replies to review feedback on own PR >=1 time.
8. Complete >=2 real conflicts, including one non-trivial conflict.
9. Execute amend/reset/revert/stash, distributing participation so every member contributes to >=1 scenario.
10. Each member commits a real `team/<github-id>.md` contribution.
11. Generate Git graph evidence and fill `SUBMISSION.md` with real URLs/SHAs.

## 14. Evidence Plan

- collaborator/team settings evidence
- Branch Protection/ruleset evidence
- Issue and PR URLs
- review submissions/comments and feedback-application commit/reply
- conflict PR/commit + completed conflict log entries
- troubleshooting commits/log entries
- team deliverable commits
- populated `SUBMISSION.md`
- `git log --oneline --graph --decorate --all` output or screenshot

## 15. Dependency / Drift Check

- Official dependency: `NONE`.
- No other Basic Mission repository is required to execute B2-2.
- Starter-packet Mission-index filename drift was resolved by reading the actual frozen file and does not affect requirements.
- Any new official Source triggers Source Discovery + requirement diff, not an unrelated full restart.

## 16. G1–G8 Checklist

| Gate | Status | Result |
|---|---|---|
| G1 SOURCE | `PASS` | Mission MD + Evaluation valid; PDF parity retained as explicit Gap; Mode FULL SOURCE / Confidence MEDIUM |
| G2 BUILD | `PASS` | safe static collaboration harness implemented |
| G3 TEST | `PASS` | static structure / traceability / truthfulness checks passed |
| G4 REVIEW | `PASS` | Self Review 1 + separate criteria review 1 completed; static MAJOR=0 |
| G5 RUNTIME | `NEEDS-RUNTIME` | real team/account/settings/activity required |
| G6 EVIDENCE | `NEEDS-RUNTIME` | required GitHub team evidence not yet present |
| G7 LEARN | `NEEDS-RUNTIME` | learning guide exists; live explanation + evidence demonstration pending |
| G8 MERGE | `BLOCKED` | draft PR #3 must not be merged as Mission completion while blockers remain |

Current mission severity: `BLOCKER=3`, `MAJOR=0`.

## 17. STOP Rule

The Workcell stops at Human Runtime rather than fabricating missing collaboration. B2-2 can be declared PASS and PR #3 (or its runtime-completed successor) merged as Mission completion only after confirmed requirements and evidence are satisfied with `BLOCKER=0`, `MAJOR=0`.

## 18. Handoff Contract

`HANDOFF.md` and `mission-result.yaml` record the exact draft PR, branch/head SHA, Source Mode/Gap, G1–G8 state, static tests/reviews, blockers, runtime checklist, and evidence status. The representative Control Tower remains untouched until a later Serial Integration step validates the completed Mission handoff.
