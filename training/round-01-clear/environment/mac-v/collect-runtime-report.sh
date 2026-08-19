#!/usr/bin/env bash
set -euo pipefail

MACHINE="${B2_2_MAC_V_MACHINE:-codyssey}"
USERS=(codyssey01 codyssey02 codyssey03 codyssey04 codyssey05)

pass() { printf '[PASS] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*" >&2; FAIL=$((FAIL + 1)); }
info() { printf '[INFO] %s\n' "$*"; }

[[ "$(uname -s)" == "Darwin" ]] || { printf '[FAIL] macOS Host에서 실행하세요.\n' >&2; exit 1; }
command -v orb >/dev/null 2>&1 || { printf '[FAIL] orb not found\n' >&2; exit 1; }

FAIL=0

printf '===== B2-2 MAC-V Sanitized Runtime Report =====\n'
printf 'Generated locally; no token/password/private-key values should be printed.\n\n'

printf '===== HOST =====\n'
info "macOS: $(sw_vers -productVersion 2>/dev/null || echo unknown)"
if orb status >/dev/null 2>&1; then
  pass "OrbStack running"
else
  fail "OrbStack status failed"
fi

printf '\n===== MACHINE =====\n'
if ! orb -m "$MACHINE" sh -lc 'true' >/dev/null 2>&1; then
  fail "$MACHINE unavailable"
else
  pass "$MACHINE reachable"
  os_id="$(orb -m "$MACHINE" sh -lc '. /etc/os-release; printf "%s" "$ID"' 2>/dev/null || true)"
  os_ver="$(orb -m "$MACHINE" sh -lc '. /etc/os-release; printf "%s" "$VERSION_ID"' 2>/dev/null || true)"
  arch="$(orb -m "$MACHINE" uname -m 2>/dev/null || true)"
  info "Guest OS: ${os_id:-unknown} ${os_ver:-unknown}"
  info "Guest architecture: ${arch:-unknown}"
  if [[ "$os_id" == "ubuntu" && "$os_ver" == "24.04" ]]; then
    pass "Ubuntu 24.04"
  else
    fail "expected Ubuntu 24.04"
  fi
fi

printf '\n===== COMMON TOOLS =====\n'
if orb -m "$MACHINE" sh -lc 'command -v git >/dev/null && command -v gh >/dev/null' >/dev/null 2>&1; then
  pass "git + gh available"
  info "$(orb -m "$MACHINE" git --version 2>/dev/null || true)"
  info "$(orb -m "$MACHINE" gh --version 2>/dev/null | head -n 1 || true)"
else
  fail "git or gh missing"
fi

printf '\n===== USERS / IDENTITIES =====\n'
for user in "${USERS[@]}"; do
  printf '\n--- %s ---\n' "$user"

  if ! orb -m "$MACHINE" sh -lc "id '$user' >/dev/null 2>&1"; then
    fail "$user missing"
    continue
  fi
  pass "$user exists"

  home="$(orb -m "$MACHINE" sh -lc "getent passwd '$user' | cut -d: -f6" 2>/dev/null || true)"
  info "HOME: ${home:-unknown}"

  login="$(orb -m "$MACHINE" -u "$user" sh -lc "env -u GH_TOKEN -u GITHUB_TOKEN gh api user --jq '.login' 2>/dev/null || true" 2>/dev/null || true)"
  if [[ -n "$login" ]]; then
    pass "GitHub login: $login"
  else
    fail "$user GitHub authentication unavailable"
  fi

  git_name_set="$(orb -m "$MACHINE" -u "$user" sh -lc 'test -n "$(git config --global --get user.name 2>/dev/null || true)" && echo yes || echo no' 2>/dev/null || echo no)"
  git_email_set="$(orb -m "$MACHINE" -u "$user" sh -lc 'test -n "$(git config --global --get user.email 2>/dev/null || true)" && echo yes || echo no' 2>/dev/null || echo no)"

  [[ "$git_name_set" == "yes" ]] && pass "git user.name configured" || fail "$user git user.name missing"
  [[ "$git_email_set" == "yes" ]] && pass "git user.email configured" || fail "$user git user.email missing"

  clone_state="$(orb -m "$MACHINE" -u "$user" sh -lc 'if [ -d "$HOME/b2-2-team/simulation/.git" ]; then echo present; else echo absent; fi' 2>/dev/null || echo absent)"
  if [[ "$clone_state" == "present" ]]; then
    pass "simulation clone present"
    dirty="$(orb -m "$MACHINE" -u "$user" sh -lc 'git -C "$HOME/b2-2-team/simulation" status --porcelain | wc -l' 2>/dev/null || echo unknown)"
    info "simulation working-tree changes: $dirty"
  else
    info "simulation clone: not prepared yet"
  fi
done

printf '\n===== SUMMARY =====\n'
if ((FAIL == 0)); then
  printf '[PASS] MAC-V report has 0 detected CORE/identity issues\n'
  printf 'NOTE: this report does not prove Issue/PR/Review Simulation completion or B2-2 Mission CLEAR.\n'
  exit 0
fi

printf '[FAIL] %d detected issue(s)\n' "$FAIL" >&2
exit 1
