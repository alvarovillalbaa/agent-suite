---
name: suite-router
description: Map user intent to the right workflow, agent, or skill. Use when the user's goal is unclear or when suggesting the next step for content, slides, visualization, video, engineering, fundraising, finance, sales, outreach, research, competitor analysis, or social work.
version: 1.0.0
license: MIT
compatibility: Instruction-only. No tools required.
---

# Suite Router

## Overview

Maps user intent to the most relevant **workflow**, **command**, **agent**, or **skill** so the user or assistant can choose the right entry point. Use this when classifying intent or suggesting what to run next.

## When to Use

- User says something ambiguous (e.g. “I need help with our raise” or “we need more content”).
- After a deliverable, to suggest the next agent or skill.
- When UserPromptSubmit or another hook needs a single place for intent → suggestion mapping.

## Intent → Agent / Skill

| User intent | Preferred agent | Single skill (if one workflow only) |
|-------------|-----------------|-------------------------------------|
| **Content** (blog, LinkedIn, X, syndication) | `content-manager` | `blog-articles`, `linkedin-articles`, `x-articles`, `content-syndication` |
| **Slides** (presentation, deck, pitch) | `visual-manager` | `code-slides` |
| **Visualization** (diagram, review page, dashboard, recap) | `visual-manager` | `visualizer` |
| **Video** (programmatic, Remotion) | — | `video-generation` |
| **Engineering** (implementation, review, docs, QA) | `swe` | `agentic-development`, `quality-assurance`, `code-documentation` |
| **Fundraising** (investor messaging, materials, process) | `financial-manager` | `fundraising` |
| **Finance** (reconciliation, modeling, fundraising) | `financial-manager` | `accounting-reconciliation`, `financial-modeling`, `fundraising` |
| **Sales** (research, outreach, competitor analysis) | `sales-manager` | `prospect-research`, `message-outreach`, `competitors` |
| **Outreach** (prospect brief, LinkedIn DMs, messages) | `sales-manager` | `message-outreach`, `prospect-research`, `linkedin-engagement`, `email-inbox-management` |
| **Research** (market, prospects, account context) | `sales-manager` or `content-manager` | `prospect-research` |
| **Competitor analysis** (intel, feature releases) | `sales-manager` | `competitors` |
| **Social media** (LinkedIn/X content + engagement) | `social-media-manager` | `linkedin-articles`, `linkedin-engagement`, `x-articles`, `x-engagement`, `content-syndication` |

## Common Command Entry Points

- **Content**: `content-brief`, `blog-draft`, `social-pack`
- **Sales and research**: `account-brief`, `outreach`, `competitor-scan`, `inbox-triage`
- **Social engagement**: `linkedin-engage`, `x-engage`
- **Finance and fundraising**: `reconcile-books`, `model-scenarios`, `investor-messaging`, `materials-audit`, `pipeline-diagnostics`
- **Visuals**: `visualize`, `slides`, `video`
- **Engineering**: `repo-review`, `docs-pass`, `learning-sync`

## How to Use

1. Classify the user’s intent into one row (or the closest match).
2. Suggest the most specific stable entry point first:
   - command for a narrow end-to-end automation
   - agent for a multi-step workflow
   - skill for a direct capability
3. Do not duplicate skill logic; point the user or the run to the target skill's `SKILL.md` or invoke the corresponding agent if available.

## Next Steps

After routing, the user or assistant should run the suggested command, invoke the suggested agent, or load the suggested skill and follow its instructions.
