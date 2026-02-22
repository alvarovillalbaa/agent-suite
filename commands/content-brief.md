---
name: content-brief
description: Create a content or campaign brief and optionally kick off drafting (briefings skill + content-manager flow).
argument-hint: "[topic or campaign name]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skill: **briefings** — `skills/briefings/SKILL.md` first; then optionally **content-manager** or blog-articles, linkedin-articles, x-articles, content-syndication.

1. **Gather scope** – Ask the user for topic/campaign, audience, key messages, and desired formats (blog, LinkedIn, X, etc.) if not in the argument.
2. **Brief** – Load `skills/briefings/SKILL.md` and produce a content or campaign brief (objective, audience, messages, format, timeline, success criteria).
3. **Confirm** – Show the brief and ask if the user wants to proceed to draft (blog, LinkedIn, X) or stop here.
4. **If drafting** – Use the **content-manager** agent’s workflow: invoke blog-articles, linkedin-articles, x-articles, or content-syndication as needed. Deliver drafts per channel.
5. **Deliver** – Output the brief and, if requested, the draft(s) and a short checklist for approval/publish.
