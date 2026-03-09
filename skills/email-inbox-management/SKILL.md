---
name: email-inbox-management
description: Manage email triage, inbox workflows, reply drafting, follow-ups, and escalation handling. Use when the user wants help processing an inbox, categorizing messages, drafting replies, or turning email threads into an actionable queue.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional pasted email threads, rules, or CRM context.
---

# Email Inbox Management

Turn a messy inbox into a prioritized action queue with clear drafts, follow-ups, and lightweight operating rules.

## Use Cases

- Triage a batch of emails into categories such as reply now, delegate, follow up later, archive, or spam.
- Draft replies that match the requested tone, relationship, and urgency.
- Summarize long threads into current status, blockers, and next action.
- Build lightweight inbox workflows such as labels, priority rules, and response SLAs.

## Inputs

- Email content or summaries.
- Relationship context: customer, lead, partner, internal, recruiter, personal.
- Goal: clear inbox, respond faster, protect time, avoid misses, or improve consistency.
- Optional constraints: tone, forbidden phrases, escalation rules, working hours, SLA targets.

If context is missing, ask only for what changes the reply or triage outcome.

## Outputs

- A triage table or bullet list with category, priority, owner, and next action.
- Reply drafts ready to send, with optional shorter and firmer variants.
- Thread summaries for long conversations.
- Optional inbox rules or labeling logic if the user wants a repeatable workflow.

## Triage Framework

Sort each email into one of these buckets:

1. Reply now
2. Delegate
3. Follow up later
4. Reference only
5. Archive or spam

For each message, capture:

- Why it matters
- Deadline or implied urgency
- Recommended action
- Risk if ignored

## Drafting Rules

- Match the sender relationship and stakes.
- Keep replies concise unless the user explicitly wants detailed reasoning.
- Confirm decisions, owners, dates, and asks clearly.
- Do not invent facts, commitments, or deadlines not supported by the thread.
- If the thread is sensitive, propose a safer reply plus any clarifying questions.

## Workflow Rules

- Prefer clear categories over too many labels.
- Escalate messages involving money, legal risk, reputation risk, or executive visibility.
- Group similar low-value emails into batch processing recommendations.
- When useful, propose canned response patterns for repeated cases.

## Related Skills

- If a conversation turns into outbound follow-up or sales messaging, hand off to `message-outreach`.
- If the user needs prospect or account context before replying, use `prospect-research`.
