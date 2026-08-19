#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-}"
shift || true
USERS=("$@")

usage() {
  cat <<'EOF'
Usage:
  bash audit-github-counts.sh <OWNER/REPO> <github-A> <github-B> <github-C> <github-D> <github-E>

Read-only checks:
- merged PR count by author
- unique PRs reviewed by each reviewer
- merged PR body presence of Closes/Fixes keyword summary

This script does NOT judge review quality, feedback application quality,
conflict authenticity, troubleshooting authenticity, or Mission CLEAR.
EOF
}

[[ -n "$REPO" && "$REPO" == */* && ${#USERS[@]} -eq 5 ]] || { usage; exit 2; }
command -v gh >/dev/null 2>&1 || { echo '[FAIL] gh not installed' >&2; exit 1; }
command -v jq >/dev/null 2>&1 || { echo '[FAIL] jq not installed' >&2; exit 1; }

# Avoid accidental use of an ambient token from another identity.
unset GH_TOKEN GITHUB_TOKEN

gh auth status --hostname github.com >/dev/null

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

PRS_JSON="$TMP_DIR/prs.json"
REVIEW_PAIRS="$TMP_DIR/review-pairs.txt"
: > "$REVIEW_PAIRS"

gh pr list --repo "$REPO" --state merged --limit 100 \
  --json number,author,url,body,title > "$PRS_JSON"

printf '===== B2-2 MAC-V Simulation GitHub Count Audit =====\n'
printf 'Repository: %s\n' "$REPO"
printf 'Merged PR total: %s\n\n' "$(jq 'length' "$PRS_JSON")"

printf '--- Merged PR counts by author ---\n'
for user in "${USERS[@]}"; do
  count="$(jq --arg u "$user" '[.[] | select(.author.login == $u)] | length' "$PRS_JSON")"
  printf '%-24s %s\n' "$user" "$count"
done

printf '\n--- Issue closing keyword in merged PR body ---\n'
with_close="$(jq '[.[] | select((.body // "") | test("(?i)(closes|fixes)\\s+#[0-9]+"))] | length' "$PRS_JSON")"
printf 'Merged PRs with Closes/Fixes #n: %s / %s\n' "$with_close" "$(jq 'length' "$PRS_JSON")"

printf '\n--- Collecting review submissions ---\n'
while IFS=$'\t' read -r number author; do
  [[ -n "$number" ]] || continue
  gh api --paginate "repos/$REPO/pulls/$number/reviews?per_page=100" \
    --jq '.[] | [.user.login, .state] | @tsv' 2>/dev/null \
    | while IFS=$'\t' read -r reviewer state; do
        [[ -n "$reviewer" ]] || continue
        [[ "$reviewer" != "$author" ]] || continue
        case "$state" in
          APPROVED|CHANGES_REQUESTED|COMMENTED)
            printf '%s\t%s\n' "$reviewer" "$number" >> "$REVIEW_PAIRS"
            ;;
        esac
      done
done < <(jq -r '.[] | [.number, .author.login] | @tsv' "$PRS_JSON")

sort -u "$REVIEW_PAIRS" -o "$REVIEW_PAIRS"

printf '\n--- Unique PRs reviewed by reviewer ---\n'
for user in "${USERS[@]}"; do
  count="$(awk -F '\t' -v u="$user" '$1==u {c++} END {print c+0}' "$REVIEW_PAIRS")"
  printf '%-24s %s\n' "$user" "$count"
done

printf '\n===== Interpretation =====\n'
printf 'Target for this Simulation: merged PR 2+ and reviewed PR 2+ per account.\n'
printf 'Manual verification is still required for:\n'
printf '- substantive review quality\n'
printf '- author feedback application\n'
printf '- conflict 2+ / non-trivial 1+\n'
printf '- amend/reset-soft/revert/stash-pop actual execution\n'
printf '- all-account participation\n'
printf '- branch protection / rules\n'
printf '- Simulation SUBMISSION links\n'
printf '\nThis read-only audit is not B2-2 Mission CLEAR evidence.\n'
