---
name: linkedin-engagement
description: Draft LinkedIn comments, DMs, connection requests, and follow-up sequences that add value and stay on-brand. Use when the user wants to engage on LinkedIn, respond to posts, start conversations, nurture relationships, or support professional outreach.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional context from prospect-research, message-outreach, or existing content drafts.
---

# LinkedIn Engagement

Draft LinkedIn comments and messages that feel credible, specific, and useful rather than templated.

## Use Cases

- Comment on posts with insight, a question, or an experience that advances the discussion.
- Write connection requests and first-touch DMs.
- Build short follow-up sequences after a comment, event, or accepted connection.
- Support founder, sales, recruiting, or community-led engagement.

## Inputs

- Target post, profile, or account summary.
- Relationship context: cold, warm, peer, prospect, candidate, customer, or partner.
- Objective: visibility, conversation, meeting, referral, partnership, or nurture.
- Optional guardrails: tone, no-pitch first touch, max length, CTA type.

## Outputs

- Comment or message ready to paste.
- Optional variants for soft, direct, or warmer approaches.
- A short note on why the draft fits the context.

## Drafting Rules

- Personalize using their role, post, company context, or stated opinion.
- Prefer one concrete observation over broad praise.
- Keep comments tight and easy to reply to.
- Keep DMs to one ask or one value add.
- Do not pitch aggressively in the first message unless the user explicitly asks for that style.

## Quality Checklist

- References something real from the post, profile, or relationship context.
- Adds value: insight, question, resource, or relevant perspective.
- Reads like a person, not a growth hack template.
- Ends with a clear but lightweight next step when messaging privately.

## Related Skills

- If the user needs account or persona context first, start with `prospect-research`.
- If the LinkedIn DM is part of a broader outbound motion, use `message-outreach`.
- If the user wants to turn a long-form idea into LinkedIn-native content before engaging, use `linkedin-articles`.
- If the ask is really X-native conversation, switch to `x-engagement`.
