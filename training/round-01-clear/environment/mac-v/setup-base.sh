#!/usr/bin/env bash
set -euo pipefail

EXPECTED_ID="ubuntu"
EXPECTED_VERSION="24.04"

log() { printf '[MAC-V setup-base] %s\n' "$*"; }
fail() { printf '[MAC-V setup-base][FAIL] %s\n' "$*" >&2; exit 1; }

if [[ ! -r /etc/os-release ]]; then
  fail "/etc/os-release 를 읽을 수 없습니다."
fi

# shellcheck disable=SC1091
source /etc/os-release
[[ "${ID:-}" == "${EXPECTED_ID}" ]] || fail "Ubuntu가 아닙니다: ID=${ID:-unknown}"
[[ "${VERSION_ID:-}" == "${EXPECTED_VERSION}" ]] || fail "Ubuntu 24.04가 아닙니다: VERSION_ID=${VERSION_ID:-unknown}"

log "Ubuntu ${VERSION_ID} 확인 PASS"

# Control Tower가 공통 Ubuntu Developer Bootstrap의 단일 기준(Source of Truth)이다.
# sudo로 호출된 경우에도 원래 사용자의 HOME을 기준으로 Control Tower를 찾는다.
if [[ -n "${SUDO_USER:-}" && "${SUDO_USER}" != "root" ]]; then
  INVOKER_HOME="$(getent passwd "${SUDO_USER}" | cut -d: -f6)"
else
  INVOKER_HOME="${HOME}"
fi

CONTROL_TOWER="${CONTROL_TOWER:-${INVOKER_HOME}/codyssey/codyssey-basic}"
BOOTSTRAP="${CONTROL_TOWER}/environments/ubuntu/bootstrap.sh"

if [[ ! -f "${BOOTSTRAP}" ]]; then
  cat >&2 <<EOF
[MAC-V setup-base][FAIL] Control Tower bootstrap을 찾을 수 없습니다.
예상 경로: ${BOOTSTRAP}

먼저 Ubuntu 내부에 Control Tower를 준비하세요.
  mkdir -p "${INVOKER_HOME}/codyssey"
  cd "${INVOKER_HOME}/codyssey"
  git clone https://github.com/MetaStudy999/codyssey-basic.git

다른 경로를 사용한다면 CONTROL_TOWER 환경변수로 지정할 수 있습니다.
EOF
  exit 1
fi

log "Control Tower Bootstrap 확인: ${BOOTSTRAP}"

# CHECK BEFORE INSTALL
if bash "${BOOTSTRAP}" --check; then
  log "공통 Ubuntu Developer Bootstrap 이미 준비됨 — 설치 SKIP"
else
  log "공통 필수 항목 누락 확인 — Control Tower 기준으로 필요한 항목만 설치"
  bash "${BOOTSTRAP}" --install
  bash "${BOOTSTRAP}" --check
fi

log "설치/검증 결과"
git --version
gh --version | head -n 1

log "PASS — Control Tower 공통 Bootstrap 기준 충족"
