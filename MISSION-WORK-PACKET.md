# B2-2 Mission Work Packet

## 1. Identity

- Mission: `B2-2` — 친구 3~5명과 함께 프로그램 만드는 법 연습하기
- Target repository: `MetaStudy999/codyssey-basic-b2-2-git-team-collaboration`
- Working branch: `mission/b2-2-workcell`
- Control Tower: `MetaStudy999/codyssey-basic` (**READ ONLY**)
- Frozen Control Tower baseline: `0d1581b3e82366988f57e1d76da311c028b8e15e`
- Target repository baseline before this Workcell: `845ea2e47bc2b49864893db8ed3dd34208c0ef44`
- Workcell issue: `#2`
- Dependency: `NONE`

## 2. Control Tower baseline / drift

Active Wave `20260808-01` identifies this repository and the starter packet `docs/00-governance/work-packets/b2-2.md`. The starter packet blob SHA is `35d02c4465e602ca48cb1367dd4184a0ad881bd4`, matching the frozen baseline tree checked by this Workcell.

The Wave manifest and Workcell launcher are intentionally outside the frozen governance baseline. No mission-impacting Governance drift was found in the baseline files used by this Workcell. The Control Tower remains read-only.

## 3. Source Inventory

| Source | Path | State | Notes |
|---|---|---|---|
| Mission PDF | `b2-2-mission.pdf` | `UNREADABLE` in current PDF viewer | File exists (514,104 bytes). Direct PDF renderer fetch failed, so visual parity was not asserted. |
| Mission Markdown | `b2-2-mission.md` | `VALID` | Contains substantive mission requirements and states it preserves the 10-page PDF content. |
| Evaluation Markdown | `b2-2-evaluation.md` | `VALID` | Contains four evaluation sections and concrete pass criteria. |
| Mission index | Control Tower `docs/02-domains/02-python-git/b2-2-git-collaboration.md` | `VALID` | Confirms repository, mission title, required status, and collaboration objective. |
| Source registry | Control Tower `docs/00-governance/source-registry.md` | `VALID` | Registers `b2-2-mission.pdf` as the B2-2 mission PDF. |

### Source Mode

- Mode: `FULL SOURCE`
- Confidence: `MEDIUM`
- Gap: original PDF visual/content parity is not independently verified in the current tool environment.
- Rule: no requirement is invented to fill the PDF verification gap.

## 4. Mission Contract

Confirmed mission outcome: one team repository operated by a real 3–5 person team, demonstrating GitHub Flow through actual Issues, feature branches, Pull Requests, reviews, merges, conflicts, troubleshooting events, documentation, and traceable evidence.

### Required outputs

1. Team repository URL.
2. `SUBMISSION.md` evidence index.
3. `docs/CONTRIBUTING.md`.
4. `docs/conflict-resolution.md`.
5. `docs/troubleshooting-log.md`.
6. Git history evidence (`git log --oneline --graph --all` text or screenshot).
7. One simple team deliverable: utility functions, team introduction, or team learning notes.

## 5. Requirement Traceability

| ID | Confirmed requirement | Primary source | Current status |
|---|---|---|---|
| REQ-001 | Real team of 3–5 people in one repository with collaboration access | Mission §4.1 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-002 | Protect `main`; no direct push; PR-only merge; at least one approval | Mission §4.1 / Evaluation 1 | `BLOCKED` — `main` currently reports `protected: false` |
| REQ-003 | GitHub Flow with `feature/*`; naming rule documented | Mission §4.2 | `IMPLEMENTED` by collaboration guide; real usage pending |
| REQ-004 | Each work item begins as an Issue and PR contains `Closes #n`/`Fixes #n` | Mission §4.3 / Evaluation 1 | `IMPLEMENTED` for Workcell scaffold; team usage pending |
| REQ-005 | Commit message convention documented; meaningless messages prohibited | Mission §4.4 | `IMPLEMENTED` |
| REQ-006 | Every team member has at least 2 merged PRs | Mission §4.5 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-007 | Every team member writes at least 2 reviews on others' PRs | Mission §4.5 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-008 | Every team member applies review feedback on own PR at least once | Mission §4.5 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-009 | PR body consistently records What / Why / How and issue link | Mission §4.5 / Evaluation 2 | `IMPLEMENTED` via template; team usage pending |
| REQ-010 | Each PR has substantive review feedback and author/reviewer interaction | Mission §4.6 | `NEEDS-RUNTIME` |
| REQ-011 | At least 2 conflict resolutions; at least 1 non-trivial conflict | Mission §4.7 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-012 | Execute and document amend/reset/revert/stash; every member participates in at least one scenario | Mission §4.8 / Evaluation 1 | `NEEDS-RUNTIME` |
| REQ-013 | Collaboration rules documented in `docs/CONTRIBUTING.md` | Mission §4.9 | `IMPLEMENTED` |
| REQ-014 | Choose simple team deliverable; every member contributes at least one commit | Mission §4.10 | `NEEDS-RUNTIME` |
| REQ-015 | Shared branches are not force-pushed/rebased without agreement | Mission §7 | `IMPLEMENTED` as policy; runtime compliance pending |

## 6. Evaluation Mapping

### Evaluation 1 — Result and collaboration records

Static documentation can be prepared by the Workcell, but collaborator membership, branch protection, team PR/review counts, feedback application, conflicts, and troubleshooting must be verified from real GitHub activity.

### Evaluation 2 — Implementation/collaboration explanation

`docs/CONTRIBUTING.md`, `docs/conflict-resolution.md`, and `docs/troubleshooting-log.md` provide the operating rules and reproducible log fields required to explain branch granularity, PR structure, review quality, conflict flow, and troubleshooting reproducibility.

### Evaluation 3 — Git collaboration concepts

The learning checklist in this packet and collaboration guide covers deployable `main`, PR+approval rationale, Issue↔PR traceability, `revert` versus `reset`, and conflict markers.

### Evaluation 4 — Situational response / advanced Git

The guide records hotfix flow, handling poor commit messages without rewriting shared history, repeated-conflict prevention, and rebase safety boundaries.

## 7. Repository Baseline

Observed before Workcell changes:

- Default branch: `main`
- `main` protected: `false`
- Collaborators: only repository owner `MetaStudy999`
- Branches: `main`, `docs/add-b2-2-evaluation-criteria`
- Pull Requests: one merged PR (`#1`), created by the owner
- Reviews on PR #1: none
- Separate Issues supporting feature work: none before Workcell issue #2
- Required collaboration documents: absent
- `SUBMISSION.md`: absent
- Git/team output folders: absent

## 8. Mission-specific TOC

```text
B2-2
├── Source / Evaluation Discovery
├── Team / Repository Setup
├── Branch Protection
├── GitHub Flow
├── Issues / Feature Branches / Pull Requests
├── Code Review / Feedback Application
├── Conflict Lab
├── Troubleshooting Lab
├── Collaboration Docs
├── SUBMISSION Index
├── Git History Evidence
├── Learning Verification
└── Handoff
```

## 9. Scope / Non-scope

### Workcell scope

- Build repository operating rules and traceability structure.
- Create templates and evidence ledgers.
- Preserve truthful distinction between static preparation and real collaboration events.

### Human Runtime scope

- Invite 2–4 real collaborators and confirm accepted access.
- Configure `main` Branch Protection / ruleset requiring PR and >=1 approval.
- Perform team Issues, PRs, reviews, feedback application, conflicts, and troubleshooting.
- Capture final Git graph and URLs.

### Prohibited

- Fabricating team accounts, approvals, reviews, conflicts, or Git events.
- Treating AI-authored documents as team-member activity.
- Modifying the Control Tower from this Workcell.

## 10. Agent Routing

- Orchestrator / Builder: ChatGPT using the GitHub connector.
- Automated harness: repository inventory + GitHub API state inspection + Markdown structural checks.
- Self Review: one evidence/traceability pass after file creation.
- Independent Review: requested as a logically separate criteria pass; no separate external reviewer model is available in this connector session, so it must not be represented as a GitHub team review.
- Runtime Authority: Human team.

## 11. Test Plan

1. Confirm required files exist on the Workcell branch.
2. Confirm `SUBMISSION.md` contains explicit team-member, PR, review, conflict, troubleshooting, and Git graph evidence slots.
3. Confirm PR template requires Issue link + What/Why/How.
4. Confirm collaboration guide documents branch, commit, PR, review, and conflict rules.
5. Confirm conflict/troubleshooting logs distinguish `PENDING` from completed evidence.
6. Re-query GitHub branches, collaborators, PRs/reviews after runtime work.

## 12. Runtime Plan

Human team must execute, in order:

1. Add enough collaborators to form a 3–5 person team.
2. Protect `main` with PR-only merge and >=1 approval.
3. Create per-task Issues.
4. Work on `feature/*` branches.
5. Open PRs with `Closes #n`, What/Why/How.
6. Review other members' PRs with substantive comments.
7. Apply at least one review comment on each member's own PR.
8. Complete at least two conflict labs, including one non-trivial conflict.
9. Complete amend/reset/revert/stash labs, distributing participation across all members.
10. Generate Git graph evidence and update `SUBMISSION.md`.

## 13. Evidence Plan

- Collaborator/member list or settings evidence.
- Branch protection/ruleset evidence.
- Issue and PR URLs.
- Review URLs/submissions and feedback-application commit/reply.
- Conflict PR/commit + `docs/conflict-resolution.md` entry.
- Troubleshooting commit/log + `docs/troubleshooting-log.md` entry.
- `SUBMISSION.md` cross-index.
- `git log --oneline --graph --all` output/screenshot.

## 14. Dependency / Drift Check

- Official dependency: `NONE`.
- No other mission repository is required for B2-2 build.
- Any later official Source change triggers Source Discovery + requirement diff only; do not restart unrelated gates.

## 15. G1–G8 Checklist

- G1 SOURCE: `PASS_WITH_GAP` — Mission MD + Evaluation valid; PDF visual parity unverified.
- G2 BUILD: `IN_PROGRESS` — static collaboration harness can be built.
- G3 TEST: `PENDING`.
- G4 REVIEW: `PENDING`.
- G5 RUNTIME: `NEEDS-RUNTIME`.
- G6 EVIDENCE: `NEEDS-RUNTIME`.
- G7 LEARN: `PENDING`.
- G8 MERGE: `PENDING`.

## 16. STOP Rule

Stop only when all confirmed requirements, tests, runtime checks, and required evidence are satisfied with `BLOCKER=0` and `MAJOR=0`. Static scaffold completion alone is not B2-2 PASS.

## 17. Handoff Contract

`HANDOFF.md` and `mission-result.yaml` must report actual repository state, remaining Human Runtime work, final commit/PR when known, Source Mode, gate states, blockers/majors, tests, evidence, and risks. They must not claim the team collaboration mission is complete until GitHub activity proves it.
