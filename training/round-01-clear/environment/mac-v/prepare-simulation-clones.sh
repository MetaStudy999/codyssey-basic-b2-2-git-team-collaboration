#!/usr/bin/env bash
set -euo pipefail

USERS=(codyssey01 codyssey02 codyssey03 codyssey04 codyssey05)
REPO="${1:-}"
TARGET_NAME="${B2_2_SIM_TARGET:-simulation}"

usage() {
  cat <<'EOF'
Usage:
  sudo bash prepare-simulation-clones.sh <OWNER/REPO>

Example:
  sudo bash prepare-simulation-clones.sh example-owner/codyssey-b2-2-sim-mac-v

Requirements:
- codyssey01~05 already exist
- each user has gh authentication
- each account can access the Simulation Repository
- each user has Git identity configured

Behavior:
- clones into /home/<user>/b2-2-team/simulation
- existing clone is never deleted
- local changes cause STOP for that user
- only fast-forward pull is allowed
- GH_TOKEN/GITHUB_TOKEN inherited from the root/admin shell are removed

This script does NOT create a GitHub repository, issue, PR, branch, or review.
EOF
}

[[ -n "$REPO" && "$REPO" == */* ]] || { usage; exit 2; }
[[ ${EUID} -eq 0 ]] || { printf '[FAIL] sudo/root 권한이 필요합니다.\n' >&2; exit 1; }

fail=0

for user in "${USERS[@]}"; do
  printf '\n===== %s =====\n' "$user"

  if ! id "$user" >/dev/null 2>&1; then
    printf '[FAIL] %s missing\n' "$user" >&2
    fail=$((fail + 1))
    continue
  fi

  home="$(getent passwd "$user" | cut -d: -f6)"
  base="$home/b2-2-team"
  target="$base/$TARGET_NAME"

  install -d -m 700 -o "$user" -g "$user" "$base"

  login="$(sudo -H -u "$user" env -u GH_TOKEN -u GITHUB_TOKEN gh api user --jq '.login' 2>/dev/null || true)"
  if [[ -z "$login" ]]; then
    printf '[FAIL] %s: gh authentication unavailable\n' "$user" >&2
    fail=$((fail + 1))
    continue
  fi
  printf '[PASS] GitHub login: %s\n' "$login"

  git_name="$(sudo -H -u "$user" git config --global --get user.name 2>/dev/null || true)"
  git_email="$(sudo -H -u "$user" git config --global --get user.email 2>/dev/null || true)"
  if [[ -z "$git_name" || -z "$git_email" ]]; then
    printf '[FAIL] %s: git user.name/user.email incomplete\n' "$user" >&2
    fail=$((fail + 1))
    continue
  fi

  if [[ -d "$target/.git" ]]; then
    printf '[INFO] existing clone found: %s\n' "$target"

    status="$(sudo -H -u "$user" git -C "$target" status --porcelain)"
    if [[ -n "$status" ]]; then
      printf '[FAIL] %s: local changes exist; not pulling\n' "$user" >&2
      fail=$((fail + 1))
      continue
    fi

    origin="$(sudo -H -u "$user" git -C "$target" remote get-url origin 2>/dev/null || true)"
    if [[ "$origin" != *"$REPO"* ]]; then
      printf '[FAIL] %s: origin mismatch: %s\n' "$user" "$origin" >&2
      fail=$((fail + 1))
      continue
    fi

    sudo -H -u "$user" env -u GH_TOKEN -u GITHUB_TOKEN \
      git -C "$target" pull --ff-only
    printf '[PASS] %s updated with --ff-only\n' "$user"
  elif [[ -e "$target" ]]; then
    printf '[FAIL] %s exists but is not a Git repository: %s\n' "$user" "$target" >&2
    fail=$((fail + 1))
    continue
  else
    printf '[INFO] cloning %s → %s\n' "$REPO" "$target"
    sudo -H -u "$user" env -u GH_TOKEN -u GITHUB_TOKEN \
      gh repo clone "$REPO" "$target"
    printf '[PASS] %s clone complete\n' "$user"
  fi

done

printf '\n===== Summary =====\n'
if ((fail == 0)); then
  printf '[PASS] Simulation Repository clone 5/5 ready\n'
  printf 'NOTE: clone readiness is not Simulation PASS and not B2-2 Mission CLEAR.\n'
  exit 0
fi

printf '[FAIL] %d user(s) need attention\n' "$fail" >&2
exit 1
