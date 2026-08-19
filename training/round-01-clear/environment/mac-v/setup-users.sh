#!/usr/bin/env bash
set -euo pipefail

USERS=(codyssey01 codyssey02 codyssey03 codyssey04 codyssey05)

log() { printf '[MAC-V setup-users] %s\n' "$*"; }
fail() { printf '[MAC-V setup-users][FAIL] %s\n' "$*" >&2; exit 1; }

if [[ ${EUID} -ne 0 ]]; then
  fail "root 권한이 필요합니다. sudo bash $0 로 실행하세요."
fi

if [[ ! -r /etc/os-release ]]; then
  fail "/etc/os-release 를 읽을 수 없습니다."
fi

# shellcheck disable=SC1091
source /etc/os-release
[[ "${ID:-}" == "ubuntu" && "${VERSION_ID:-}" == "24.04" ]] \
  || fail "Ubuntu 24.04에서만 실행합니다. 현재: ${ID:-unknown} ${VERSION_ID:-unknown}"

for user in "${USERS[@]}"; do
  if id "$user" >/dev/null 2>&1; then
    log "$user 이미 존재 — SKIP"
  else
    log "$user 생성"
    adduser --disabled-password --gecos "" "$user"
  fi

  home="/home/$user"
  [[ -d "$home" ]] || fail "$user HOME이 없습니다: $home"

  # 공용 PC 시뮬레이션: 사용자 간 HOME 열람을 기본적으로 차단한다.
  chown "$user:$user" "$home"
  chmod 700 "$home"

  install -d -m 700 -o "$user" -g "$user" "$home/.config"
  install -d -m 700 -o "$user" -g "$user" "$home/b2-2-team"

  # B2-2는 관리자 권한 훈련이 아니므로 학습 사용자를 sudo 그룹에 자동 추가하지 않는다.
  if id -nG "$user" | tr ' ' '\n' | grep -qx sudo; then
    log "WARN: $user 가 sudo 그룹에 포함되어 있습니다. 자동 제거하지 않습니다. 수동 확인하세요."
  fi

done

log "생성 결과"
for user in "${USERS[@]}"; do
  printf '%-12s uid=%s home=%s\n' "$user" "$(id -u "$user")" "$(getent passwd "$user" | cut -d: -f6)"
done

log "PASS — codyssey01~05 준비 완료"
