#!/usr/bin/env bash
set -euo pipefail

EXPECTED_LOGIN="${1:-}"

pass() { printf '[PASS] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*" >&2; exit 1; }

if [[ -z "$EXPECTED_LOGIN" ]]; then
  printf 'Usage: bash %s <expected-github-login>\n' "$0" >&2
  exit 2
fi

CURRENT_USER="$(whoami)"
[[ "$CURRENT_USER" =~ ^codyssey0[1-5]$ ]] \
  || fail "현재 Linux user가 codyssey01~05가 아닙니다: $CURRENT_USER"
pass "Linux user = $CURRENT_USER"

command -v gh >/dev/null 2>&1 || fail "gh not installed"
command -v git >/dev/null 2>&1 || fail "git not installed"

ACTUAL_LOGIN="$(gh api user --jq '.login' 2>/dev/null)" \
  || fail "GitHub 인증을 확인할 수 없습니다. gh auth login을 먼저 수행하세요."

[[ "$ACTUAL_LOGIN" == "$EXPECTED_LOGIN" ]] \
  || fail "GitHub login mismatch: expected=$EXPECTED_LOGIN actual=$ACTUAL_LOGIN"
pass "GitHub login = $ACTUAL_LOGIN"

GIT_NAME="$(git config --global --get user.name || true)"
GIT_EMAIL="$(git config --global --get user.email || true)"

[[ -n "$GIT_NAME" ]] || fail "git user.name is empty"
[[ -n "$GIT_EMAIL" ]] || fail "git user.email is empty"

pass "Git user.name configured: $GIT_NAME"
pass "Git user.email configured"

printf '\nIdentity Gate PASS\n'
printf 'Linux user : %s\n' "$CURRENT_USER"
printf 'GitHub     : %s\n' "$ACTUAL_LOGIN"
printf 'Git name   : %s\n' "$GIT_NAME"
printf 'Git email  : configured (value intentionally not repeated)\n'
