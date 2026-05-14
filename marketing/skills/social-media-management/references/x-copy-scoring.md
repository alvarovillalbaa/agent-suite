# X Copy Scoring

A scoring system for every line in a launch script or post before anything gets published.
The Weapons Check runs before filming, not after. Both dimensions must hit 10/10.

---

## The Two-Dimension Weapons Check

Every line gets scored independently on two dimensions:

### Dimension 1 — Invention Novelty (1–10)
**Does it make the product feel like a genuine breakthrough?**

- 10: Makes the product sound like something that has never existed before
- 7–9: Interesting but familiar — could be said about a competitor
- 4–6: Generic product-category language
- 1–3: Could apply to any product in any category

### Dimension 2 — Copy Intensity (1–10)
**Does it make someone feel something — not just understand something?**

- 10: Visceral reaction — reader feels something immediately
- 7–9: Engaging but not emotionally charged
- 4–6: Informative but flat
- 1–3: No emotional response; purely informational

**Rule:** Both must be 10/10. A novel idea with flat copy fails. Sharp copy about a boring feature fails.

### Prompt
```
Score this line on two dimensions:
- Invention Novelty (1–10): Does it make the product feel like a genuine breakthrough?
- Copy Intensity (1–10): Does it make someone feel something — not just understand something?

If either is below 10, rewrite it and explain what was weak.
```

---

## Weak → Strong Rewrites

The transformation is always the same: replace vague with visceral, features with feelings, announcements with punches.

| Weak | Strong |
|------|--------|
| "Introducing our new AI platform" | "We built the world's first AI that makes your competitors obsolete overnight" |
| "Our tool helps you grow faster" | "The exact system that took 4 startups from zero to 1M+ views" |
| "Better customer support" | "Support that actually solves your problem — first contact, every time" |
| "AI website builder that works in seconds" | "Replace your 9-5 income" |
| "Excited to announce..." | [Delete the line entirely] |

---

## 100-Point Content Score

Start at 100. Deduct for violations. Ship when score is 90+.

| Threshold | Action |
|-----------|--------|
| 90–100 | Ship it — human-sounding, clean |
| 70–89 | Minor fixes needed |
| 50–69 | Significant rewrite required |
| 0–49 | Complete rewrite |

---

## The 24 AI Slop Patterns

Check every line against these before scoring. Each violation deducts points.

### Banned Constructions
- "This is not X, it's Y" — define by what it IS, never by negation
- "Despite [challenges], [company] continues to..." — formulaic resilience framing
- Forced rule-of-three in any position it doesn't naturally arise
- Negative parallelisms ("not only X but also Y")

### Forbidden Vocabulary
Every use deducts points. Delete on sight:

| Tier 1 (critical) | Tier 2 (avoid) |
|-------------------|----------------|
| delve | leverage |
| tapestry | multifaceted |
| paradigm | pivotal |
| ecosystem | realm |
| synergy | robust |
| transformative | seamless |
| holistic | testament |
| innovative | utilize |
| groundbreaking | unlock |
| game-changer | elevate |
| crucial | deep dive |
| excited to share | thrilled to announce |

### Structural Slop Patterns
- **Significance inflation** — describing an ordinary feature as if it's a historical event
- **Vague expert attribution** — "researchers say", "studies show" with no citation
- **Excessive em dashes** — more than one per sentence signals AI authorship
- **Mechanical boldface** — bolding things that aren't actually more important
- **Filler openers** — "In today's fast-paced world...", "Now more than ever..."
- **Excessive hedging** — "I think", "perhaps", "it seems", "kind of", "sort of"
- **Generic praise sentences** — "This is a great question" / "What a fascinating topic"
- **Corporate conclusion syndrome** — "In conclusion...", "To summarize..."
- **Enumeration overuse** — Bulleting everything, even things that shouldn't be bullets

### Voice Killers
- No body-text emoji (emoji in CTAs acceptable)
- No "excited to share" or variants
- No first-person passive ("It was decided that...")
- No false balance ("On one hand... on the other hand..." for every point)

---

## Content Quality Dimensions

For full post/script scoring, use these weighted dimensions:

| Dimension | Weight | What it measures |
|-----------|--------|-----------------|
| Voice similarity | 35% | Sounds like a real person / founder, not a template |
| Specificity | 25% | Real numbers, real examples, real context |
| AI slop penalty | 20% | 24-pattern check above |
| Length appropriateness | 10% | Right length for the format and platform |
| Engagement potential | 10% | Would someone share, save, or reply? |

---

## Expert Panel Approach

For high-stakes scripts, run a recursive expert panel before finalizing:

1. Assemble 7–10 domain expert personas tailored to the content
2. Always include: AI Writing Detector (1.5x weight) + Brand Voice Match
3. Each expert scores the draft and identifies the top 3 weaknesses
4. Revise addressing the weaknesses; repeat
5. Continue until aggregate score hits 90+ or 3 rounds exhausted
6. Ship the best version with notes if 3 rounds don't reach 90+

The AI Writing Detector expert is weighted 1.5x in the aggregate — human-sounding copy is the highest-priority gate.

---

## ASCII Diagram Requirement (for long-form posts)

Every long-form X post must include at least one ASCII diagram:
- Under 40 characters wide
- Must parse in under 3 seconds
- Types: system architecture, before/after, flow diagram, metrics using block chars (█ ▓ ░)

---

## Never Fabricate

Use only real data — actual business metrics, specific incidents, real decisions with documented reasoning.
"Never fabricate metrics. Use real numbers or don't use numbers."
