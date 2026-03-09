---
name: inbox-triage
description: Triage inbound email threads, summarize next actions, and draft replies using the email-inbox-management skill.
argument-hint: "[thread, inbox batch, or reply goal]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skill: **email-inbox-management** — `skills/email-inbox-management/SKILL.md`.

1. **Gather the inbox context** – Ask for email content, thread summaries, sender context, and the goal for the inbox pass.
2. **Triage the messages** – Categorize them into reply now, delegate, follow up later, reference, or archive.
3. **Draft replies where needed** – Produce concise drafts for the messages that matter.
4. **Highlight risk and urgency** – Make deadlines, blockers, and escalation cases explicit.
5. **Deliver** – Output the triage list, reply drafts, and any repeatable inbox rules the user should keep.
