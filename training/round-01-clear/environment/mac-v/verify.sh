#!/usr/bin/env bash
set -u

USERS=(codyssey01 codyssey02 codyssey03 codyssey04 codyssey05)
FAIL=0

pass() { printf '[PASS] %s\n' "$*"; }
warn() { printf '[WARN] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*"; FAIL=$((FAIL + 1)); }

printf '===== B2-2 MAC-V Runtime Verification =====\n'

if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  source /etc/os-release
  if [[ "${ID:-}" == "ubuntu" && "${VERSION_ID:-}" == "24.04" ]]; then
    pass "Ubuntu 24.04"
  else
    fail "Expected Ubuntu 24.04, got ${ID:-unknown} ${VERSION_ID:-unknown}"
  fi
else
  fail "/etc/os-release unavailable"
fi

printf 'Architecture: %s\n' "$(uname -m 2>/dev/null || echo unknown)"

if command -v git >/dev/null 2>&1; then
  pass "$(git --version)"
else
  fail "git not installed"
fi

if command -v gh >/dev/null 2>&1; then
  pass "$(gh --version | head -n 1)"
else
  fail "gh not installed"
fi

for user in "${USERS[@]}"; do
  printf '\n--- %s ---\n' "$user"

  if ! id "$user" >/dev/null 2>&1; then
    fail "$user missing"
    continue
  fi
  pass "$user exists"

  home="$(getent passwd "$user" | cut -d: -f6)"
  if [[ "$home" == "/home/$user" && -d "$home" ]]; then
    pass "$user HOME = $home"
  else
    fail "$user HOME mismatch: ${home:-missing}"
    continue
  fi

  owner="$(stat -c '%U:%G' "$home" 2>/dev/null || true)"
  mode="$(stat -c '%a' "$home" 2>/dev/null || true)"

  [[ "$owner" == "$user:$user" ]] && pass "$user HOME owner $owner" || fail "$user HOME owner $owner"
  [[ "$mode" == "700" ]] && pass "$user HOME mode 700" || warn "$user HOME mode is $mode (recommended 700)"

  workspace="$home/b2-2-team"
  if [[ -d "$workspace" ]]; then
    ws_owner="$(stat -c '%U:%G' "$workspace" 2>/dev/null || true)"
    [[ "$ws_owner" == "$user:$user" ]] && pass "$user workspace owner $ws_owner" || fail "$user workspace owner $ws_owner"
  else
    fail "$user workspace missing: $workspace"
  fi

  if id -nG "$user" | tr ' ' '\n' | grep -qx sudo; then
    warn "$user is in sudo group — B2-2 CORE does not require this"
  else
    pass "$user not in sudo group"
  fi

done

printf '\n===== Summary =====\n'
if ((FAIL == 0)); then
  printf '[PASS] 0 FAIL — MAC-V base/user structure ready\n'
  printf 'NOTE: GitHub gh authentication and Git identity are per-user runtime checks and are not proven by this script.\n'
  exit 0
else
  printf '[FAIL] %d failure(s)\n' "$FAIL"
  exit 1
fi
