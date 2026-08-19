#!/usr/bin/env bash
set -euo pipefail

USERS=(codyssey01 codyssey02 codyssey03 codyssey04 codyssey05)

usage() {
  cat <<'EOF'
Usage:
  sudo bash verify-all-identities.sh \
    <github-A> <github-B> <github-C> <github-D> <github-E>

각 Linux User에서 다음을 검증합니다.
- gh 실제 로그인
- 기대 GitHub username과 일치
- git user.name 설정 여부
- git user.email 설정 여부

Token/Password/Private Key 값은 출력하지 않습니다.
GH_TOKEN/GITHUB_TOKEN 환경변수는 검증 시 명시적으로 제거하여
각 Linux User의 저장된 gh 인증을 확인합니다.
EOF
}

(($# == 5)) || { usage; exit 2; }
[[ ${EUID} -eq 0 ]] || { printf '[FAIL] root 권한이 필요합니다. sudo bash ... 로 실행하세요.\n' >&2; exit 1; }

EXPECTED=("$@")
FAIL=0

pass() { printf '[PASS] %s\n' "$*"; }
fail() { printf '[FAIL] %s\n' "$*" >&2; FAIL=$((FAIL + 1)); }

printf '===== B2-2 MAC-V Five-Account Identity Verification =====\n'

for i in "${!USERS[@]}"; do
  user="${USERS[$i]}"
  expected="${EXPECTED[$i]}"
  printf '\n--- %s → expected GitHub %s ---\n' "$user" "$expected"

  if ! id "$user" >/dev/null 2>&1; then
    fail "$user missing"
    continue
  fi

  actual="$(sudo -H -u "$user" env -u GH_TOKEN -u GITHUB_TOKEN \
    gh api user --jq '.login' 2>/dev/null || true)"

  if [[ -z "$actual" ]]; then
    fail "$user: GitHub 인증을 확인할 수 없습니다"
  elif [[ "$actual" != "$expected" ]]; then
    fail "$user: GitHub mismatch expected=$expected actual=$actual"
  else
    pass "$user: GitHub login = $actual"
  fi

  git_name="$(sudo -H -u "$user" git config --global --get user.name 2>/dev/null || true)"
  git_email="$(sudo -H -u "$user" git config --global --get user.email 2>/dev/null || true)"

  if [[ -n "$git_name" ]]; then
    pass "$user: git user.name configured"
  else
    fail "$user: git user.name missing"
  fi

  if [[ -n "$git_email" ]]; then
    pass "$user: git user.email configured"
  else
    fail "$user: git user.email missing"
  fi
done

printf '\n===== Summary =====\n'
if ((FAIL == 0)); then
  printf '[PASS] Identity Gate 5/5\n'
  printf 'NOTE: 이 결과는 5계정 Identity Gate이며 실제 B2-2 Mission CLEAR를 의미하지 않습니다.\n'
  exit 0
fi

printf '[FAIL] %d identity issue(s)\n' "$FAIL"
exit 1
