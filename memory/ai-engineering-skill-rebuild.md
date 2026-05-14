---
name: ai-engineering-skill-rebuild
description: Rebuilt the ai-engineering skill around 7 AI engineering topics grounded in cloush-server implementation and agents-fs knowledge
metadata:
  type: project
---

Rebuilt `engineering/skills/ai-engineering/` from a data-engineering-heavy skill to a proper AI engineering hub covering: system prompt architecture, tool call design, memory/learning systems, evals/fine-tuning, context engineering, multi-agent coordination, and prompt engineering.

**Why:** The skill was called "ai-engineering" but was 80% data pipeline content (ETL, streaming, warehouses, CV). The 7 core topics — system prompt engineering, tool call descriptions, memory + learning, multi-agent, prompt engineering, context engineering, evals, fine-tuning — had no production-grounded reference material.

**How to apply:** When working on the ai-engineering skill, all new references should be grounded in actual cloush-server implementation patterns (ToolSpec/ToolCategory from `services/ai/agents/tools/spec.py`, EvalItemContract from `services/ai/evals/contracts.py`, PersistenceScope from `services/learning/memory/agent_context.py`, etc.).

## Files Added/Changed

- `SKILL.md` — Full rewrite: proper routing hub for 9 topic areas
- `README.md` — Updated to reflect new references and templates
- `references/system-prompt-architecture.md` — NEW: 8-block anatomy, SPL, guardrails, Instruction Forwarding
- `references/tool-call-design.md` — NEW: Intern Test, ToolCategory taxonomy, confirmation/persistence policies
- `references/memory-and-learning-system.md` — NEW: memory tiers, compaction, reflection loop, fine-tuning pipeline
- `references/evals-system.md` — NEW: EvalItemContract/Set/Gate cascade, CI integration, dataset management
- `references/context-engineering.md` — NEW: context types, tagger architecture, compaction strategies, RAG assembly
- `references/agentic-system-design.md` — Extended with sections 7-9: A2A, orchestration patterns, agent lifecycle
- `templates/system-prompt-template.md` — NEW: copy-paste skeleton with checklist
- `templates/eval-case-template.md` — NEW: eval contract + golden dataset + grader prompt templates
