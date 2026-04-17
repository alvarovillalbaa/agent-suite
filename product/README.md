# Product

Product workflows for strategy, discovery, prioritization, planning, UX copy, CRO, and delivery framing.

## What lives here

- Skills: `product-development`
- Commands: `grill-me`

Use this plugin when the question is not "how do we code this?" but "what should we build, why, and how should we frame it?"

## Install

Install the whole plugin with `skills`:

```bash
npx -y skills add ./product
```

Install the skill into Codex manually:

```bash
mkdir -p ~/.codex/skills
cp -R product/skills/product-development ~/.codex/skills/
```

Use Codex `$skill-installer` against the plugin path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/product
```

## Skill

- [`product-development`](./skills/product-development/README.md): PRDs, discovery, prioritization, product strategy, CRO, UX copy, and agile planning
