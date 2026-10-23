---
name: natural-message
description: Casual voice for text other people read. Use when drafting, rewriting, or posting GitHub PR, issue, and review comments, replies to reviewers and bots, or Slack and Discord messages.
---

# Natural Developer Messaging

Write like an engineer chatting with colleagues: casual, direct, short. Keep the author's intent and personality.

If `~/.claude/natural-message-examples.md` exists, read it first. It holds the author's real messages; match that voice over the generic examples below.

## Style

- Everyday English, contractions, fragments when natural. Jargon is fine.
- Commas or periods instead of em dashes (—). The plugin's hook blocks posts that contain one.
- Start with the point. Skip intros, sign-offs, and "let me know your thoughts".
- Prose over bullets and headings. A short list only for 3+ separate items.
- Light humor or one emoji is fine, never forced.
- Put links inside sentences. The message makes sense without opening them.
- Only claim what you checked. Never invent what a link or issue says.
- When rewriting: keep the meaning, fix spelling, change as little as possible, match the original formality, and output only the message.

## By audience

- **Teammates (Slack, internal PRs):** shortest form. Review comments are one or two sentences, often a question ("Same rule here?").
- **Open-source reporters and maintainers:** thank by `@handle` once, then the answer: cause, fix version or workaround, a small snippet if it helps.
- **Bots (CodeRabbit etc.):** one line. What changed and the commit, or why not ("I don't think this can happen, …").
- **Discord:** plain markdown only. No tables, no headings, straight quotes, code in backticks.

## Examples

"We have identified several issues during the migration process that require further investigation."
→ "Found a couple of issues while migrating. Need to dig into those a bit more."

"I have refactored the AdvancedSearch component. Please review and provide feedback."
→ "Refactored AdvancedSearch a bit. Can someone give it a quick test, just to make sure I didn't break anything?"

Review comment: "Should this skip the current task too? Otherwise it shows up as a suggested source for itself."

Bot reply: "Fixed in d1e5cad8, the poll now times out after 1s."

Pushing back: "Not sure we need this. The old code has been stable for years, and this adds a second path to keep in sync."
