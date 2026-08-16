#!/usr/bin/env bash
# B2-2 local verification helper.
# Reference mode: no args.
# Runtime local-repo mode: ./verify.sh --runtime <actual-team-repo-path>
# GitHub server metadata must additionally follow docs/github-runtime-audit.md.

set -u

PASS=0
FAIL=0
MODE="${1:-reference}"
TEAM_REPO="${2:-}"
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROUND_DIR=$(cd "$SCRIPT_DIR/.." && pwd)
REFERENCE="$ROUND_DIR/reference/team-repo"
REPO_ROOT=$(cd "$SCRIPT_DIR/../../.." && pwd)

pass() { echo "[PASS] $1"; PASS=$((PASS + 1)); }
fail() { echo "[FAIL] $1"; FAIL=$((FAIL + 1)); }

check_file() {
    [ -f "$1" ] && pass "file exists: ${1#$REPO_ROOT/}" || fail "file missing: ${1#$REPO_ROOT/}"
}

check_contains() {
    local file="$1" pattern="$2" label="$3"
    grep -Eq "$pattern" "$file" 2>/dev/null && pass "$label" || fail "$label"
}

REFERENCE_FILES=(
  "$REFERENCE/README.md"
  "$REFERENCE/SUBMISSION.md"
  "$REFERENCE/.github/pull_request_template.md"
  "$REFERENCE/.github/ISSUE_TEMPLATE/task.md"
  "$REFERENCE/docs/CONTRIBUTING.md"
  "$REFERENCE/docs/conflict-resolution.md"
  "$REFERENCE/docs/troubleshooting-log.md"
  "$REFERENCE/src/README.md"
  "$ROUND_DIR/BEGINNER-GUIDE.md"
  "$ROUND_DIR/CHECKLIST.md"
  "$ROUND_DIR/REFERENCE-BUILD.md"
  "$ROUND_DIR/docs/requirements-mapping.md"
  "$ROUND_DIR/docs/evaluation-qa.md"
  "$ROUND_DIR/docs/github-runtime-audit.md"
  "$ROUND_DIR/evidence/README.md"
)

for file in "${REFERENCE_FILES[@]}"; do
    check_file "$file"
done

command -v git >/dev/null 2>&1 && pass "git command" || fail "git command missing"

# Reference policy coverage.
CONTRIB="$REFERENCE/docs/CONTRIBUTING.md"
for token in 'feature/' 'Closes #' 'What' 'Why' 'How' 'LGTM' 'git revert' 'reset --soft' 'force push'; do
    grep -q -- "$token" "$CONTRIB" \
        && pass "CONTRIBUTING covers: $token" \
        || fail "CONTRIBUTING missing: $token"
done

PR_TEMPLATE="$REFERENCE/.github/pull_request_template.md"
for token in 'Closes #' 'What' 'Why' 'How'; do
    grep -q -- "$token" "$PR_TEMPLATE" \
        && pass "PR template covers: $token" \
        || fail "PR template missing: $token"
done

# Required scenario templates must exist before team Runtime.
CONFLICT="$REFERENCE/docs/conflict-resolution.md"
check_contains "$CONFLICT" 'same[- ]hunk|같은.*hunk|인접' "conflict template covers same-hunk/non-trivial case"
check_contains "$CONFLICT" 'rename|이름 변경|삭제' "conflict template covers rename/delete-modify case"

TROUBLE="$REFERENCE/docs/troubleshooting-log.md"
for token in 'commit --amend' 'reset --soft' 'git revert' 'git stash' '상황' '참여'; do
    grep -q -- "$token" "$TROUBLE" \
        && pass "troubleshooting template covers: $token" \
        || fail "troubleshooting template missing: $token"
done

SUBMISSION="$REFERENCE/SUBMISSION.md"
for token in 'PR 1' 'PR 2' 'Review 1' 'Review 2' 'Own PR feedback applied' 'Conflict #1' 'Conflict #2' 'amend' 'reset --soft' 'revert' 'stash/pop'; do
    grep -q -- "$token" "$SUBMISSION" \
        && pass "SUBMISSION covers: $token" \
        || fail "SUBMISSION missing: $token"
done

# Phase A template must preserve placeholders rather than fake actual team data.
if grep -q 'TODO_RUNTIME' "$SUBMISSION"; then
    pass "Reference SUBMISSION keeps Runtime placeholders"
else
    fail "Reference SUBMISSION lost Runtime placeholders"
fi

if command -v git >/dev/null 2>&1 && git -C "$REPO_ROOT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    TRACKED=$(git -C "$REPO_ROOT" ls-files 'training/round-01-clear/**' \
      | grep -E '(^|/)(\.env($|\.)|.*\.(key|pem)$|secrets/)' || true)
    [ -z "$TRACKED" ] && pass "no tracked Secret-pattern files" || fail "tracked Secret-pattern files detected"
fi

if [ "$MODE" = "--runtime" ] || [ "$MODE" = "runtime" ]; then
    if [ -z "$TEAM_REPO" ] || [ ! -d "$TEAM_REPO/.git" ]; then
        fail "actual team git repository path required"
    else
        for file in \
          "$TEAM_REPO/README.md" \
          "$TEAM_REPO/SUBMISSION.md" \
          "$TEAM_REPO/docs/CONTRIBUTING.md" \
          "$TEAM_REPO/docs/conflict-resolution.md" \
          "$TEAM_REPO/docs/troubleshooting-log.md"; do
            check_file "$file"
        done

        if grep -Rqs 'TODO_RUNTIME' \
          "$TEAM_REPO/SUBMISSION.md" \
          "$TEAM_REPO/docs/conflict-resolution.md" \
          "$TEAM_REPO/docs/troubleshooting-log.md" 2>/dev/null; then
            fail "TODO_RUNTIME placeholders remain in actual team evidence docs"
        else
            pass "no TODO_RUNTIME placeholders in actual evidence docs"
        fi

        GIT_LOG=$(git -C "$TEAM_REPO" log --oneline --graph --all 2>/dev/null || true)
        [ -n "$GIT_LOG" ] && pass "git history graph available" || fail "git history graph unavailable"

        if git -C "$TEAM_REPO" branch --all 2>/dev/null | grep -Eq 'feature/'; then
            pass "feature branch history/reference found"
        else
            fail "feature branch history/reference not found"
        fi

        # Detect obviously meaningless commit subjects. Human review is still
        # needed for ambiguous subjects.
        BAD_COMMITS=$(git -C "$TEAM_REPO" log --format='%h%x09%s' 2>/dev/null \
          | awk -F '\t' 'tolower($2) ~ /^(update|fix|temp|wip|final|bug fix|edit file)$/ {print}')
        if [ -z "$BAD_COMMITS" ]; then
            pass "no exact prohibited commit subjects detected"
        else
            fail "prohibited/meaningless commit subjects detected"
            printf '%s\n' "$BAD_COMMITS" | sed 's/^/       /'
        fi

        # Local docs must include at least two conflict records and all four
        # troubleshooting scenario headings after placeholders are replaced.
        check_contains "$TEAM_REPO/docs/conflict-resolution.md" 'Conflict.*1|충돌.*1' "actual conflict record 1 marker"
        check_contains "$TEAM_REPO/docs/conflict-resolution.md" 'Conflict.*2|충돌.*2' "actual conflict record 2 marker"
        for token in 'amend' 'reset' 'revert' 'stash'; do
            grep -qi "$token" "$TEAM_REPO/docs/troubleshooting-log.md" \
              && pass "actual troubleshooting mentions: $token" \
              || fail "actual troubleshooting missing: $token"
        done
    fi
fi

echo
if [ "$MODE" = "--runtime" ] || [ "$MODE" = "runtime" ]; then
    echo "[INFO] GitHub-hosted PR/Review/Issue/Branch Protection counts require docs/github-runtime-audit.md checks."
fi
printf 'Result: %d PASS / %d FAIL\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
