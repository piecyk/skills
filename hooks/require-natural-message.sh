#!/usr/bin/env bash
# PreToolUse(Bash|Slack send): for text that others read, deny em dashes, and deny posting until
# this session loaded the natural-message skill.
# Covers gh pr/issue comments, gh pr review bodies, gh api comment/reply/review writes, and Slack sends.
set -uo pipefail

input="$(cat)"
tool="$(jq -r '.tool_name // empty' <<<"$input")"

deny() {
  jq -n --arg r "$1" '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: $r}}'
  exit 0
}

if [ "$tool" = "Bash" ]; then
  cmd="$(jq -r '.tool_input.command // empty' <<<"$input")"
  posts=false
  grep -Eq 'gh +(pr|issue) +comment' <<<"$cmd" && posts=true
  grep -Eq 'gh +pr +review' <<<"$cmd" && grep -Eq -- '(^| )(-b|--body|--body-file|-F)( |=)' <<<"$cmd" && posts=true
  if grep -Eq 'gh +api' <<<"$cmd" &&
    grep -Eq '/comments|/replies|/reviews|addPullRequestReview|addComment' <<<"$cmd" &&
    grep -Eq -- '-X *(POST|PATCH)|--method *(POST|PATCH)|-[fF] +body=|--input|mutation' <<<"$cmd"; then
    posts=true
  fi
  $posts || exit 0
  text="$cmd"
  # Body files passed by literal path; paths built from shell variables are not resolved.
  while read -r f; do
    [ -f "$f" ] && text+=$'\n'"$(cat "$f")"
  done < <(grep -oE -- '(--body-file|--input|-F) +[^ ;|&]+|body=@[^ ;|&]+' <<<"$cmd" | sed -E 's/^(--body-file|--input|-F) +//; s/^body=@//; s/^@//' | tr -d "'\"")
else
  text="$(jq -r '.tool_input.message // .tool_input.text // empty' <<<"$input")"
fi

grep -q '—' <<<"$text" && deny "This text has an em dash (—). Use a comma or a period instead, then run the call again."

transcript="$(jq -r '.transcript_path // empty' <<<"$input")"
[ -f "$transcript" ] && grep -Eq '"skill":"piecyk-skills:natural-message"|<command-name>/?piecyk-skills:natural-message' "$transcript" && exit 0

deny "This posts text that other people read. Load the piecyk-skills:natural-message skill with the Skill tool, rewrite the text in that voice, then run the call again."
