---
name: briefings
description: Create content briefs, campaign briefs, and editorial plans (objectives, audience, key messages, format, timeline). Use when the user wants to plan content, align stakeholders, or produce a brief before drafting.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file inputs for brand/context.
---

# Briefings Skill

Produce structured briefs for content, campaigns, or editorial plans so teams can draft and execute with clear objectives and constraints.

## Purpose

- **Content briefs:** objective, audience, key messages, format (blog, video, social, etc.), tone, word count or duration, CTA.
- **Campaign briefs:** goal, channels, timeline, assets, success metrics, owner.
- **Editorial plans:** themes, cadence, content types, and assignments over a period.

## Inputs

- Goal or campaign name; target audience; key messages or differentiators.
- Optional: brand voice doc, competitor references, past performance notes, timeline.

## Outputs

- Single brief (markdown or structured sections) with: objective, audience, messages, format, timeline, success criteria, next steps.
- Optional: checklist for approval and handoff to writers or content-manager agent.

## When to use

- User asks for a content brief, campaign brief, or editorial plan.
- User wants to “brief” a piece of content before creating it.
- Content-manager agent invokes this skill to plan before drafting with blog-articles, linkedin-articles, etc.

## Using Supporting Resources

See `references.md` and `references/` (e.g. `references/content-brief-structure.md`) for brief structure and optional context.

## Validation checklist

- Objective is measurable or observable.
- Audience is specific (role, segment, or persona).
- At least one key message and one format/channel.
- Next step or owner stated.
