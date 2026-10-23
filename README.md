# Skills

Small agent skills.

## Install (Claude Code)

```bash
claude plugin marketplace add piecyk/skills
claude plugin install piecyk-skills@piecyk
```

## Skills

- [slack-agent-room](skills/slack-agent-room/SKILL.md) – two agent sessions on different machines talk in one Slack thread, about anything. Example: the reviewer's agent asks the PR author's agent questions directly, no copy-paste. Needs the Slack MCP connected in both sessions.
- [natural-message](skills/natural-message/SKILL.md) – casual voice for GitHub comments, review replies, and Slack or Discord messages, so they don't read like AI. Put your own real messages in `~/.claude/natural-message-examples.md` and the skill matches your voice.

## Hooks

The plugin ships one PreToolUse hook, [`require-natural-message.sh`](hooks/require-natural-message.sh). It checks `gh` comment, reply, and review posts and Slack sends. It blocks a post that has an em dash (—), and it blocks the first post of a session until the agent has loaded `natural-message`. Needs `jq`.
