#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-}"
shift || true

usage() {
  cat <<'EOF'
Usage:
  bash verify-simulation-repo.sh \
    <OWNER/REPO> <github-A> <github-B> <github-C> <github-D> <github-E>

Read-only verification:
- repository metadata
- default branch = main
- Account A~E repository permission lookup
- main branch protection/rules availability check

This script does not mutate the repository.
EOF
}

[[ -n "$REPO" && "$REPO" == */* && $# == 5 ]] || { usage; exit 2; }
command -v gh >/dev/null 2>&1 || { printf '[FAIL] gh not found\n' >&2; exit 1; }

ACCOUNTS=("$@")
FAIL=0

pass() { printf '[PASS] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*" >&2; FAIL=$((FAIL + 1)); }
warn() { printf '[WARN] %s\n' "$*"; }

printf '===== Simulation Repository Verification =====\n'
printf 'Repository: %s\n\n' "$REPO"

META="$(env -u GH_TOKEN -u GITHUB_TOKEN gh repo view "$REPO" --json nameWithOwner,url,visibility,defaultBranchRef 2>/dev/null || true)"
if [[ -z "$META" ]]; then
  fail "repository not found or inaccessible"
else
  printf '%s\n' "$META"
  DEFAULT_BRANCH="$(printf '%s' "$META" | jq -r '.defaultBranchRef.name // ""')"
  if [[ "$DEFAULT_BRANCH" == "main" ]]; then
    pass "default branch = main"
  else
    fail "default branch is not main: ${DEFAULT_BRANCH:-unknown}"
  fi
fi

printf '\n===== Account Permissions =====\n'
for account in "${ACCOUNTS[@]}"; do
  permission="$(env -u GH_TOKEN -u GITHUB_TOKEN gh api "repos/$REPO/collaborators/$account/permission" --jq '.permission' 2>/dev/null || true)"
  if [[ -z "$permission" ]]; then
    fail "$account permission unavailable — invitation may be pending or account may lack access"
    continue
  fi

  case "$permission" in
    admin|maintain|write|push)
      pass "$account permission = $permission"
      ;;
    *)
      fail "$account permission insufficient for collaboration: $permission"
      ;;
  esac
done

printf '\n===== main Protection =====\n'
if env -u GH_TOKEN -u GITHUB_TOKEN gh api "repos/$REPO/branches/main/protection" >/dev/null 2>&1; then
  pass "main branch protection endpoint is configured/readable"
else
  warn "main protection not confirmed. Configure/verify repository rules before collaboration training."
  FAIL=$((FAIL + 1))
fi

printf '\n===== Summary =====\n'
if ((FAIL == 0)); then
  printf '[PASS] Simulation Repository Gate ready\n'
  printf 'NOTE: this is repository readiness only, not Simulation PASS and not B2-2 Mission CLEAR.\n'
  exit 0
fi

printf '[FAIL] %d repository readiness issue(s)\n' "$FAIL" >&2
exit 1
