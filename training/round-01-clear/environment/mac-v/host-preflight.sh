#!/usr/bin/env bash
set -euo pipefail

MODE="${1:---check}"
MACHINE="${B2_2_MAC_V_MACHINE:-codyssey}"
IMAGE="${B2_2_MAC_V_IMAGE:-ubuntu:noble}"

log() { printf '[MAC-V host] %s\n' "$*"; }
fail() { printf '[MAC-V host][FAIL] %s\n' "$*" >&2; exit 1; }

usage() {
  cat <<'EOF'
Usage:
  bash host-preflight.sh --check
  bash host-preflight.sh --prepare

--check
  OrbStack와 codyssey machine의 현재 상태만 확인합니다.
  machine이 없으면 FAIL로 종료하며 생성하지 않습니다.

--prepare
  먼저 현재 상태를 확인합니다.
  codyssey가 없을 때만 ubuntu:noble로 생성합니다.
  기존 codyssey가 Ubuntu 24.04가 아니면 삭제/덮어쓰기 없이 STOP합니다.

환경변수:
  B2_2_MAC_V_MACHINE  기본값: codyssey
  B2_2_MAC_V_IMAGE    기본값: ubuntu:noble

이 스크립트는 machine을 삭제하지 않습니다.
EOF
}

[[ "$MODE" == "--check" || "$MODE" == "--prepare" ]] || { usage; exit 2; }

[[ "$(uname -s)" == "Darwin" ]] || fail "macOS Host에서 실행해야 합니다. 현재: $(uname -s)"
command -v orb >/dev/null 2>&1 || fail "OrbStack CLI 'orb'를 찾을 수 없습니다."

log "OrbStack 상태 확인"
orb status

log "현재 OrbStack machine 목록"
orb list || true

machine_exists=0
if orb -m "$MACHINE" sh -lc 'true' >/dev/null 2>&1; then
  machine_exists=1
fi

if ((machine_exists == 0)); then
  if [[ "$MODE" == "--check" ]]; then
    fail "$MACHINE machine이 없습니다. --prepare에서만 새 machine 생성을 허용합니다."
  fi

  log "$MACHINE machine 없음 — ${IMAGE}로 신규 생성"
  orb create "$IMAGE" "$MACHINE"
else
  log "$MACHINE machine 존재 — 재사용"
fi

os_release="$(orb -m "$MACHINE" sh -lc 'cat /etc/os-release')" 
printf '%s\n' "$os_release"

id_value="$(printf '%s\n' "$os_release" | awk -F= '$1=="ID" {gsub(/"/,"",$2); print $2}')"
version_value="$(printf '%s\n' "$os_release" | awk -F= '$1=="VERSION_ID" {gsub(/"/,"",$2); print $2}')"

[[ "$id_value" == "ubuntu" ]] || fail "$MACHINE 이 Ubuntu가 아닙니다: ID=${id_value:-unknown}"
[[ "$version_value" == "24.04" ]] || fail "$MACHINE 이 Ubuntu 24.04가 아닙니다: VERSION_ID=${version_value:-unknown}. 자동 삭제/덮어쓰기를 하지 않습니다."

arch="$(orb -m "$MACHINE" uname -m)"
log "Ubuntu 24.04 PASS"
log "Guest architecture: $arch"
log "PASS — Host/OrbStack preflight 완료"
printf '\n다음 단계:\n  orb -m %s\n' "$MACHINE"
