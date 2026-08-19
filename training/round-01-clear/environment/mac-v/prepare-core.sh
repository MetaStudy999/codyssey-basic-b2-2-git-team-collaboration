#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../../../.." && pwd)"

log() { printf '[MAC-V prepare-core] %s\n' "$*"; }
fail() { printf '[MAC-V prepare-core][FAIL] %s\n' "$*" >&2; exit 1; }

[[ -r /etc/os-release ]] || fail "/etc/os-release 를 읽을 수 없습니다."
# shellcheck disable=SC1091
source /etc/os-release
[[ "${ID:-}" == "ubuntu" && "${VERSION_ID:-}" == "24.04" ]] \
  || fail "Ubuntu 24.04 내부에서 실행해야 합니다. 현재: ${ID:-unknown} ${VERSION_ID:-unknown}"

[[ -d "$REPO_ROOT/.git" ]] || fail "B2-2 Repository root를 찾지 못했습니다: $REPO_ROOT"

log "Repository root: $REPO_ROOT"
log "Ubuntu 24.04 확인 PASS"
log "Architecture: $(uname -m)"

log "1/3 Control Tower 공통 Bootstrap 확인/필요 시 최소 설치"
bash "$SCRIPT_DIR/setup-base.sh"

log "2/3 Linux User codyssey01~05 준비"
sudo bash "$SCRIPT_DIR/setup-users.sh"

log "3/3 MAC-V base/user structure 검증"
sudo bash "$SCRIPT_DIR/verify.sh"

cat <<'EOF'

[MAC-V prepare-core][PASS] CORE 시스템 준비 완료

이 PASS가 증명하는 것:
- Ubuntu 24.04
- Control Tower 공통 Bootstrap
- codyssey01~05 Linux User/HOME/Workspace 구조

아직 증명하지 않은 것:
- GitHub Account A~E gh 인증
- Git Commit Identity 5/5
- Repository clone 5/5
- Issue/PR/Review Simulation
- 실제 B2-2 Mission Evidence

다음 단계는 각 Linux User에서 gh 인증과 Identity Gate입니다.
EOF
