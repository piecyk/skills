---
name: natural-message
description: Casual voice for text other people read. Use when drafting, rewriting, or posting GitHub PR, issue, and review comments, replies to reviewers and bots, or Slack and Discord messages.
---

# Natural Developer Messaging

Write like an engineer typing to colleagues between two other things: casual, direct, short. The message sounds **typed**, the way a person writes it once and sends it. Keep the author's intent and personality.

If `~/.claude/natural-message-examples.md` exists, read it first. It holds the author's real messages; match that voice over the generic examples below.

## Style

- Everyday English, contractions, fragments when natural. Jargon is fine.
- Match the size of what you answer. A one-line question gets a one-line answer; "Yep", "Nope, started with this", "Ok, will check" are complete replies.
- A reply opens with a reaction word: Yep, Nope, Ok, Hmm, Nice, Sweet, btw.
- Drop the subject and the article where a person would: "pushed a fix for this", "will merge it tomorrow", "checking the logs".
- One idea per sentence, joined with "so", "but", "and". A colon introduces a list or code.
- Two or three numbers, the ones that carry the verdict. The rest stays behind the link.
- A longer update is two or three short paragraphs: the verdict, then why, then what's next or who to ping.
- To answer one line of a longer message, quote it with `>` and reply below it.
- Quick replies start lowercase and end without a period. End on the question when you need an answer ("so what's our plan?").
- Commas or periods instead of em dashes (—). The plugin's hook blocks posts that contain one.
- Start with the point. Skip intros, sign-offs, and "let me know your thoughts".
- Prose over bullets and headings. A short list only for 3+ separate items, such as PRs to review in order.
- Light humor or one emoji at the end is fine, never forced. On Slack write it as `:name:`.
- Links go bare after a short sentence, or inside one. The message makes sense without opening them.
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

"Reports on stg now render with the new engine instead of the old one: service A builds the file, service B lays it out, the old engine still runs as a shadow for comparison. ~1100 reports processed, 0 fallbacks, 2-3x faster on large reports, p95 18.7s."
→ "Stg update, reports now go through the new engine :rocket: The old one still runs next to it so we can compare. About 1100 reports so far and no fallbacks. If anything looks off, ping me"

"Yes, I agree, I had the same question about that."
→ "Yep, was wondering the same"

Review comment: "Should this skip the current task too? Otherwise it shows up as a suggested source for itself."

Bot reply: "Fixed in d1e5cad8, the poll now times out after 1s."

Pushing back: "Not sure we need this. The old code has been stable for years, and this adds a second path to keep in sync."
