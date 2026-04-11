---
name: grill-me
description: Relentlessly interview the user about a plan or design, walking every branch of the decision tree one question at a time until reaching full shared understanding.
argument-hint: "[plan file, feature description, or design to stress-test]"
allowed-tools: [Read, Grep, Glob, Bash, AskUserQuestion]
---

Use skill: **review** — `skills/review/SKILL.md` in **GRILL-ME MODE**.

1. **Load context** — Read any plan file or design document the user points to. Scan CLAUDE.md, TODOS.md, and relevant code before asking the first question.
2. **Activate GRILL-ME MODE** — Follow the GRILL-ME protocol in the review skill exactly: one question at a time, always with a recommended answer, exploring the codebase before asking.
3. **Walk every branch** — Don't stop until every decision branch in the plan is resolved and you have complete shared understanding.
4. **Deliver a Decision Summary** — At the end, output a concise record of every decision made during the interview.
