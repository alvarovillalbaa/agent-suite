---
name: fundraise
description: Run the fundraising skill to produce investor messaging, materials upgrade report, process diagnostics, and speed-up plan from decks, models, and CRM data.
argument-hint: "[deck/model/CRM context]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skill: **fundraising** — `skills/fundraising/SKILL.md`. Turns fundraising data into investor-ready outputs.

1. **Gather inputs** – Ask the user for or locate: pitch deck, financial model, data room summary, or CRM/pipeline snapshot (PDF, PPTX, XLSX, CSV, or text). If the user passed context in the argument, use it.
2. **Read the skill** – Load `skills/fundraising/SKILL.md` and follow its output template (Investor messaging, Materials upgrade, Process diagnostics, Speed-up plan, Quick wins & risks).
3. **Process** – Parse or summarize provided assets; score Material Readiness and Process Efficiency where possible; cite sources inline.
4. **Deliver** – Produce the five sections per the skill’s template. End with the reflection question. If data is missing, note gaps and suggest what to add.

Offer to iterate (e.g. “add a slide,” “refine narrative”) if the user wants to refine one section.
