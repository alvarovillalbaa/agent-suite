---
name: help
description: List agent-suite agents and commands with a one-line summary of when to use each.
argument-hint: ""
allowed-tools: [Read]
---

List the following for the user in a clear, scannable format.

**Agents (orchestrators)**  
- **content-manager** – Content planning, blog, LinkedIn, X, syndication (briefings, blog-articles, content-syndication, x-articles, linkedin-articles).  
- **financial-manager** – Reconciliation, modeling, fundraising (accounting-reconciliation, financial-modeling, fundraising).  
- **sales-manager** – Prospect research, outreach, competitor intel (prospect-research, message-outreach, competitors).  
- **social-media-manager** – LinkedIn and X content and engagement (linkedin-articles, linkedin-engagement, x-articles, content-syndication).

**Commands**  
- **video** – Generate programmatic video (Remotion) from a brief.  
- **slides** – Create HTML slide deck from topic/brief.  
- **fundraise** – Investor messaging, materials upgrade, process diagnostics from deck/model/CRM.  
- **content-brief** – Create content/campaign brief; optionally draft blog/LinkedIn/X.  
- **outreach** – Prospect/account research brief and optional LinkedIn engagement drafts.  
- **help** – This list.

**Routing:** For ambiguous intents, use the **suite-router** skill (`skills/suite-router/SKILL.md`) to map to the right command or agent.

Suggest: “Invoke an agent by name for multi-step workflows, or use a command for a single skill flow.”
