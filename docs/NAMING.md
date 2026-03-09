# Naming Conventions

These rules keep skills, agents, and commands consistent and discoverable.

## Skills

- Use short hyphen-case names.
- Keep one primary job per skill.
- Prefer durable domain nouns or verb-noun names.
- Avoid overlapping synonyms across skills.

Examples:

- `blog-articles`
- `prospect-research`
- `code-slides`
- `quality-assurance`

## Agents

- Use concise domain nouns ending in `-manager` where that improves clarity.
- Agents orchestrate multiple skills and commands; they do not replace skills.
- Keep each agent focused on one workflow family.

Examples:

- `content-manager`
- `financial-manager`
- `sales-manager`
- `social-media-manager`
- `visual-manager`
- `swe`

## Commands

- Commands should represent a narrow end-to-end automation or a stable slice of a larger workflow.
- Prefer action-oriented names that describe the outcome.
- Avoid vague mega-commands when the real work splits into distinct outputs.

Examples:

- `blog-draft`
- `social-pack`
- `investor-messaging`
- `materials-audit`
- `pipeline-diagnostics`
- `repo-review`
