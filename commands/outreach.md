---
name: outreach
description: Run prospect/account research and outreach messaging using message-outreach and prospect-research skills.
argument-hint: "[prospect/account or research goal]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skills: **message-outreach** (`skills/message-outreach/SKILL.md`), **prospect-research** (`skills/prospect-research/SKILL.md`); optionally **linkedin-engagement** for comment/DM drafts.

1. **Gather inputs** – Ask the user for prospect/account data (URLs, JSON, CSV, notes) or research goal. If the user passed a name or context in the argument, use it.
2. **Choose skill** – If user has raw data and wants a **skimmable brief with ICP/ICA scoring**, use **message-outreach** (`skills/message-outreach/SKILL.md`). If user has URLs/content and wants a **full GTM brief** (Account, Persona, Next best motion) and can provide scorecards, use **prospect-research** (`skills/prospect-research/SKILL.md`).
3. **Run research** – Load the skill and produce the brief per its template. Cite sources inline; do not invent scorecard math if using prospect-research with provided scorecards.
4. **Optional engagement** – If the user wants **LinkedIn comments or DMs**, load **linkedin-engagement** and draft 1–2 variants using the brief’s engagement cues.
5. **Deliver** – Output the brief and any message drafts. Suggest next step (e.g. multi-thread, send sequence).
