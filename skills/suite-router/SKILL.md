---
name: suite-router
description: Map user intent to the right agent-suite command, agent, or skill. Use when the user's goal is unclear or when suggesting the next step (content, slides, video, fundraising, finance, sales, outreach, research, competitors, social).
version: 1.0.0
license: MIT
compatibility: Instruction-only. No tools required.
---

# Suite Router

## Overview

Maps user intent to the most relevant **command**, **agent**, or **skill** in agent-suite so the user (or the assistant) can choose the right entry point. Use this when classifying intent or suggesting “what to run next.”

## When to Use

- User says something ambiguous (e.g. “I need help with our raise” or “we need more content”).
- After a deliverable, to suggest the next command or agent.
- When UserPromptSubmit or another hook needs a single place for intent → suggestion mapping.

## Intent → Command / Agent / Skill

| User intent | Recommended command | Agent | Single skill (if one workflow only) |
|-------------|---------------------|-------|------------------------------------|
| **Content** (brief, blog, LinkedIn, X, syndication) | `/agent-suite:content-brief` | content-manager | briefings, blog-articles, linkedin-articles, x-articles, content-syndication |
| **Slides** (presentation, deck, pitch) | `/agent-suite:slides` | — | code-slides |
| **Video** (programmatic, Remotion) | `/agent-suite:video` | — | video-generation |
| **Fundraising** (investor messaging, materials, process) | `/agent-suite:fundraise` | financial-manager | fundraising |
| **Finance** (reconciliation, modeling, fundraise) | `/agent-suite:fundraise` or — | financial-manager | accounting-reconciliation, financial-modeling, fundraising |
| **Sales** (research, outreach, competitors) | `/agent-suite:outreach` | sales-manager | prospect-research, message-outreach, competitors |
| **Outreach** (prospect brief, LinkedIn DMs, messages) | `/agent-suite:outreach` | sales-manager | message-outreach, prospect-research, linkedin-engagement |
| **Research** (industry, market, prospects) | — | sales-manager or content-manager | industry-discovery, prospect-research, briefings |
| **Competitors** (intel, feature releases) | — | sales-manager | competitors |
| **Social media** (LinkedIn/X content + engagement) | `/agent-suite:content-brief` or — | social-media-manager | linkedin-articles, linkedin-engagement, x-articles, content-syndication |

## How to Use

1. Classify the user’s intent into one row (or the closest match).
2. Suggest **one** of: the recommended command (e.g. `/agent-suite:fundraise`), the agent (e.g. “Invoke **financial-manager**”), or the skill by name (e.g. “Use the **fundraising** skill”) depending on whether the user wants a single flow (command/skill) or a multi-step workflow (agent).
3. Do not duplicate skill logic; point the user or the run to the target skill’s `skills/<name>/SKILL.md` or to the agent.

## Next Steps

After routing, the user (or assistant) should run the suggested command, invoke the agent, or load the skill and follow its instructions.
