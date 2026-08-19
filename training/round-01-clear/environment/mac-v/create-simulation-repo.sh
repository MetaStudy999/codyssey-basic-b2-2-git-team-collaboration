#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$(cd "$SCRIPT_DIR/../../simulation/mac-v/repository-template" && pwd)"
REPO_NAME="${1:-codyssey-b2-2-sim-mac-v}"
WORKDIR="${HOME}/b2-2-team/simulation-admin"

log() { printf '[MAC-V create-sim-repo] %s\n' "$*"; }
fail() { printf '[MAC-V create-sim-repo][FAIL] %s\n' "$*" >&2; exit 1; }

usage() {
  cat <<'EOF'
Usage:
  bash create-simulation-repo.sh [repo-name]

Default repo name:
  codyssey-b2-2-sim-mac-v

Run this script as Linux user codyssey01 after:
- GitHub Account A gh authentication
- git user.name/user.email setup
- Identity Gate for codyssey01 PASS

Behavior:
- determines Account A login from gh
- refuses to reuse an existing remote repository with the same name
- refuses to delete/overwrite an existing local simulation-admin directory
- copies the training simulation repository template
- creates one initial local commit
- creates a PUBLIC GitHub repository from that local repository and pushes main

This script does NOT:
- invite Account B~E
- accept collaborator invitations
- configure branch protection/rulesets
- create Issues/PRs/Reviews
- claim Simulation PASS or B2-2 Mission CLEAR
EOF
}

[[ "$REPO_NAME" =~ ^[A-Za-z0-9._-]+$ ]] || { usage; fail "invalid repository name: $REPO_NAME"; }
[[ "$(whoami)" == "codyssey01" ]] || fail "codyssey01에서 실행해야 합니다. 현재: $(whoami)"
command -v gh >/dev/null 2>&1 || fail "gh not found"
command -v git >/dev/null 2>&1 || fail "git not found"
[[ -d "$TEMPLATE_DIR" ]] || fail "template directory missing: $TEMPLATE_DIR"

if [[ -n "${GH_TOKEN:-}" || -n "${GITHUB_TOKEN:-}" ]]; then
  log "ambient GH_TOKEN/GITHUB_TOKEN detected; stored gh identity validation will ignore them"
fi

LOGIN="$(env -u GH_TOKEN -u GITHUB_TOKEN gh api user --jq '.login' 2>/dev/null || true)"
[[ -n "$LOGIN" ]] || fail "GitHub Account A gh authentication unavailable"
log "GitHub Account A login: $LOGIN"

GIT_NAME="$(git config --global --get user.name 2>/dev/null || true)"
GIT_EMAIL="$(git config --global --get user.email 2>/dev/null || true)"
[[ -n "$GIT_NAME" ]] || fail "git user.name missing"
[[ -n "$GIT_EMAIL" ]] || fail "git user.email missing"
log "Git identity configured"

FULL_REPO="$LOGIN/$REPO_NAME"
if env -u GH_TOKEN -u GITHUB_TOKEN gh repo view "$FULL_REPO" >/dev/null 2>&1; then
  fail "remote repository already exists: $FULL_REPO. 자동 재사용/덮어쓰기를 하지 않습니다."
fi

if [[ -e "$WORKDIR" ]]; then
  fail "local path already exists: $WORKDIR. 자동 삭제하지 않습니다."
fi

mkdir -p "$(dirname "$WORKDIR")"
mkdir "$WORKDIR"
cp -R "$TEMPLATE_DIR"/. "$WORKDIR"/

cd "$WORKDIR"
git init -b main
git add .
git commit -m "chore: initialize MAC-V training simulation"

log "creating public GitHub repository: $FULL_REPO"
env -u GH_TOKEN -u GITHUB_TOKEN gh repo create "$FULL_REPO" \
  --public \
  --description "Codyssey B2-2 MAC-V five-account training simulation — not official evidence" \
  --source=. \
  --remote=origin \
  --push

log "repository created"
env -u GH_TOKEN -u GITHUB_TOKEN gh repo view "$FULL_REPO" \
  --json nameWithOwner,url,visibility,defaultBranchRef \
  --jq '{nameWithOwner,url,visibility,defaultBranch:(.defaultBranchRef.name // "")}'

cat <<EOF

[PASS] Simulation Repository seed created
Repository: $FULL_REPO
Local admin clone: $WORKDIR

다음 단계:
1. Account B~E collaborator 초대
2. 초대 수락 확인
3. main 보호 정책 설정/확인
4. prepare-simulation-clones.sh 로 5개 독립 clone 준비
5. TASK-MATRIX.md에 따라 실제 Issue/PR/Review 수행

주의:
이 PASS는 Repository seed 생성 성공이며 Simulation PASS나 B2-2 Mission CLEAR가 아닙니다.
EOF
