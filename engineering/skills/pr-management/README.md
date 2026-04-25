# PR Management

Pull request management skill for designing or improving review systems, merge policies, SLAs, triage lanes, conflict handling, and workflow health at team scale.

## Use this for

- review-queue design
- branch and merge policy decisions
- ownership, reviewer assignment, and gating rules
- measuring and improving PR throughput without lowering quality
- scaling PR triage and landing flow for larger engineering teams
- handling straightforward merge conflicts without interactive back-and-forth

## Install

```bash
npx -y skills add ./engineering/skills/pr-management
mkdir -p ~/.codex/skills
cp -R engineering/skills/pr-management ~/.codex/skills/
```

Codex `$skill-installer` path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/engineering/skills/pr-management
```

## Notes

The current spec now covers two layers:

- operating-model design for PR systems
- active-queue execution for triage, review, CI, and merge-conflict handling

It now includes:

- a `continue` / `close` / `escalate` triage model influenced by OpenClaw's PR-triage flow
- a concrete non-interactive merge-conflict lane with validation and file-type guidance
- stronger defaults for teams in the 50-200 engineer range where queue mechanics and branch friction become system problems
