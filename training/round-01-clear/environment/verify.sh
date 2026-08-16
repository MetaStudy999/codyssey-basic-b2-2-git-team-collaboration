#!/usr/bin/env bash
# B2-2 local verification helper.
# Reference mode: no args.
# Runtime mode: ./verify.sh --runtime <actual-team-repo-path>

set -u

PASS=0
FAIL=0
MODE="${1:-reference}"
TEAM_REPO="${2:-}"
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROUND_DIR=$(cd "$SCRIPT_DIR/.." && pwd)
REFERENCE="$ROUND_DIR/reference/team-repo"

pass() { echo "[PASS] $1"; PASS=$((PASS + 1)); }
fail() { echo "[FAIL] $1"; FAIL=$((FAIL + 1)); }

check_file() {
    [ -f "$1" ] && pass "file exists: $1" || fail "file missing: $1"
}

for file in \
  "$REFERENCE/README.md" \
  "$REFERENCE/SUBMISSION.md" \
  "$REFERENCE/.github/pull_request_template.md" \
  "$REFERENCE/.github/ISSUE_TEMPLATE/task.md" \
  "$REFERENCE/docs/CONTRIBUTING.md" \
  "$REFERENCE/docs/conflict-resolution.md" \
  "$REFERENCE/docs/troubleshooting-log.md" \
  "$REFERENCE/src/README.md" \
  "$ROUND_DIR/docs/requirements-mapping.md" \
  "$ROUND_DIR/docs/evaluation-qa.md" \
  "$ROUND_DIR/evidence/README.md"; do
    check_file "$file"
done

command -v git >/dev/null 2>&1 && pass "git command" || fail "git command missing"

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
    fi
fi

echo
printf 'Result: %d PASS / %d FAIL\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
