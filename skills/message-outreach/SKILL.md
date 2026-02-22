---
name: message-outreach
description: Convert raw person- or account-level data into a single, skimmable research brief for the sales team with Account, Persona, and ongoing research. Use when the user has prospect/account data and needs an actionable brief with ICP/ICA scoring.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file/JSON inputs.
---

# Message & Outreach Research Brief Skill

Convert any pile of raw person‑ or account‑level data into a single, skimmable brief the sales team can act on immediately.

## Output template

### Previous research
(Short background paragraph orienting a newcomer in <100 words.)

### Account
- 1‑sentence elevator pitch of the company.
- Fit vs. *Ideal Customer Account* scorecard (0‑10 each): Geography · Tech Stack Maturity · AI Adoption · Growth Stage · Decision Agility.
- Red‑flag signals (if any) and quick verdict: *Qualify / Nurture / Disqualify.*

### Persona
- Role, seniority tier (A/B/C), economic power, and buying‑center position.
- 3 bullets on pains/goals (e.g. tied to productivity or AI adoption).
- Engagement cues: public posts, events, mutual connections.

### Ongoing research
- Timestamped discoveries (YYYY‑MM‑DD) — newest first.
- Link or note source in‑line.

End with one forward‑looking question in italics.

## Guidelines

**Data ingestion:** Accept JSON, CSV, or raw text. Normalize dates to ISO (YYYY‑MM‑DD) and currencies (e.g. €). Validate required fields: account name, contact name, contact role. If missing, annotate as `N/A` and log under “Follow‑Up Research.” Reject unsupported formats with a clear error message.

**Evidence:** Cite every fact inline (e.g. `[LinkedIn:2025-07-20]`, `[SalesNotes:RN-42]`). For conflicting data, list variants with dates and choose the most recent with justification. Mark inferences `(inferred)` with brief logic.

**Scoring (0–10):** Geography, Tech Maturity, AI Adoption, Growth Stage, Decision Agility. Aggregate Fit = round(mean). Document bands (e.g. ARR, procurement cycle) per user context.

**Output:** Section order fixed; each section ≤200 words; bullets only; no extra sections.

**Tone:** Professional, concise, active voice. Metrics over adjectives. Every pain → specific next step; highlight one “killer insight” in bold.

## When to use

- User provides prospect/account data and wants a research brief.
- User needs ICP/ICA-style scoring and qualification verdict.
- User wants engagement cues and next-step recommendations.
