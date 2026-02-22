---
name: slides
description: Create an animation-rich HTML slide deck from scratch or from a brief using the slides-deck-generation skill.
argument-hint: "[topic or title]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skill: **slides-deck-generation** — `skills/slides-deck-generation/SKILL.md`. Creates a zero-dependency, viewport-fitting HTML presentation.

1. **Gather scope** – Ask the user for topic, title, number of slides, and preferred style (or suggest from STYLE_PRESETS.md) if not in the argument.
2. **Read the skill** – Load `skills/slides-deck-generation/SKILL.md` and respect **viewport fitting** and content limits (no scrolling within slides).
3. **Plan** – Optionally produce a short deck plan (slide titles and content density) using the skill’s templates.
4. **Implement** – Generate a single HTML file (or linked assets) with inline CSS/JS; use the mandatory base CSS from the skill for viewport fitting.
5. **Deliver** – Output the slide deck file and how to open it in a browser.

If the user only gave a topic, ask for title and approximate slide count before generating.
