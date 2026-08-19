#!/usr/bin/env bash
set -euo pipefail

EXPECTED_ID="ubuntu"
EXPECTED_VERSION="24.04"

log() { printf '[MAC-V setup-base] %s\n' "$*"; }
fail() { printf '[MAC-V setup-base][FAIL] %s\n' "$*" >&2; exit 1; }

if [[ ${EUID} -ne 0 ]]; then
  fail "root 권한이 필요합니다. sudo bash $0 로 실행하세요."
fi

if [[ ! -r /etc/os-release ]]; then
  fail "/etc/os-release 를 읽을 수 없습니다."
fi

# shellcheck disable=SC1091
source /etc/os-release

[[ "${ID:-}" == "${EXPECTED_ID}" ]] || fail "Ubuntu가 아닙니다: ID=${ID:-unknown}"
[[ "${VERSION_ID:-}" == "${EXPECTED_VERSION}" ]] || fail "Ubuntu 24.04가 아닙니다: VERSION_ID=${VERSION_ID:-unknown}"

log "Ubuntu ${VERSION_ID} 확인 PASS"

# CHECK BEFORE INSTALL: 필요한 명령이 없을 때만 패키지 설치를 수행한다.
missing=()
for cmd in git wget ca-certificates; do
  if [[ "$cmd" == "ca-certificates" ]]; then
    dpkg -s ca-certificates >/dev/null 2>&1 || missing+=(ca-certificates)
  elif ! command -v "$cmd" >/dev/null 2>&1; then
    missing+=("$cmd")
  fi
done

if ((${#missing[@]} > 0)); then
  log "필수 공통 패키지 설치: ${missing[*]}"
  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y "${missing[@]}"
else
  log "필수 공통 패키지 이미 준비됨 — SKIP"
fi

if command -v gh >/dev/null 2>&1; then
  log "GitHub CLI 이미 설치됨 — SKIP"
else
  log "GitHub CLI 공식 APT repository를 추가하여 gh 설치"

  if ! command -v wget >/dev/null 2>&1; then
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget
  fi

  install -d -m 755 /etc/apt/keyrings
  install -d -m 755 /etc/apt/sources.list.d

  tmp_key="$(mktemp)"
  trap 'rm -f "$tmp_key"' EXIT
  wget -nv -O"$tmp_key" https://cli.github.com/packages/githubcli-archive-keyring.gpg
  cat "$tmp_key" > /etc/apt/keyrings/githubcli-archive-keyring.gpg
  chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

  printf 'deb [arch=%s signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\n' "$(dpkg --print-architecture)" \
    > /etc/apt/sources.list.d/github-cli.list

  apt-get update
  DEBIAN_FRONTEND=noninteractive apt-get install -y gh
fi

log "설치 결과"
git --version
gh --version | head -n 1

log "PASS — 공통 도구 준비 완료"
