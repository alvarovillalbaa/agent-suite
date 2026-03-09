---
name: account-brief
description: Produce a focused account or prospect research brief using prospect-research or message-outreach, without drafting full outreach sequences.
argument-hint: "[account, prospect, URL, or research goal]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skills: **prospect-research** and **message-outreach**.

1. **Gather inputs** – Ask for URLs, notes, CRM data, or the account and persona to focus on.
2. **Choose the brief type** – Use `message-outreach` for a fast scored brief, or `prospect-research` for a full GTM brief.
3. **Build the brief** – Produce the research artifact with evidence, fit, and recommended next motion.
4. **Keep it research-first** – Do not expand into a full outreach sequence unless the user asks.
5. **Deliver** – Output the brief and suggest `outreach` if the user wants messaging next.
