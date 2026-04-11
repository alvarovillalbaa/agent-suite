# Documentation Types Reference

Complete taxonomy of documentation types, when to use each, who reads it, where it lives, and how long it stays relevant.

---

## Tier 1: Inline Documentation (Highest Proximity)

Inline docs live inside the source code itself. They are the highest-priority documentation because they degrade alongside the code and are impossible to miss.

### Docstrings / JSDoc / TSDoc

**What it is:** Structured comment blocks directly on a function, class, method, or module.

**When to write:** Always, on every public-facing function, class, method, or module. Required for library code. Required for API endpoints. Required for any logic that isn't self-evident from its name and type signature.

**Audience:** Engineers reading the code directly, IDEs showing hover-docs, auto-generated API reference sites.

**Format (Python):**
```python
def process_candidate(candidate_id: str, options: dict | None = None) -> dict:
    """
    Process a candidate through the recruitment pipeline.

    Triggers background enrichment, validation, and notification dispatch.
    Does NOT immediately update the database — changes are queued.

    Args:
        candidate_id: UUID string of the candidate record.
        options: Optional overrides. Supported keys:
            - skip_enrichment (bool): Skip background enrichment step.
            - notify (bool): Send notification on completion. Default True.

    Returns:
        dict with keys: status, queued_at, task_id

    Raises:
        CandidateNotFoundError: If candidate_id doesn't exist.
        ValidationError: If candidate data fails pipeline validation.
    """
```

**Format (TypeScript):**
```typescript
/**
 * Formats a candidate's full name for display.
 *
 * Returns "First Last" or falls back to email prefix if name fields are empty.
 * Never returns an empty string — always has a displayable fallback.
 *
 * @param candidate - Candidate object from the API.
 * @returns Formatted display name string.
 */
export function formatCandidateName(candidate: Candidate): string
```

**Format (React component):**
```typescript
/**
 * CandidateCard — compact display card for a single candidate.
 *
 * Used in list views and pipeline boards. Does not handle its own
 * data fetching — caller is responsible for passing a populated candidate.
 *
 * @example
 * <CandidateCard candidate={candidate} onSelect={handleSelect} compact />
 */
interface CandidateCardProps {
  /** The candidate to display. Must be populated (not a stub). */
  candidate: Candidate;
  /** Called when the card is clicked or activated via keyboard. */
  onSelect?: (candidate: Candidate) => void;
  /** Renders a condensed single-line layout. Default: false. */
  compact?: boolean;
}
```

### Inline Comments

**What it is:** Single-line or short block comments within function bodies.

**When to write:** Only when the logic isn't self-evident from variable names and types. The bar is: "would a competent engineer pause here and wonder why?"

**When NOT to write:**
- Restating what the code does (`# increment counter`)
- Obvious algorithmic steps (`# loop through items`)
- Type information already in annotations
- High-level descriptions better suited to docstrings

**Good examples:**
```python
# Retry with exponential backoff — Stripe API returns 429 on burst traffic
# RFC 3339 format required — AWS SDK rejects ISO 8601 with timezone offset
# Use raw SQL here — Django ORM cannot express window functions in this version
# Intentionally not catching ValueError — caller is expected to validate input upstream
```

**Bad examples:**
```python
# Get the user
user = get_user(user_id)
# Return the result
return result
```

### Type Annotations

**What they are:** Static type declarations in typed languages (Python type hints, TypeScript types, Java/Go types).

**When to use:** Always. Type annotations are documentation that gets checked automatically. In dynamically typed languages like Python, they are especially valuable.

**Priority:** Type annotations over prose comments for parameter/return documentation.

---

## Tier 2: Service-Level Documentation

Service docs live at the root of each service or module directory. They document the service as a whole, not individual functions.

### README.md

**Purpose:** Entry point for anyone encountering this service for the first time.

**Audience:** Any engineer, including those unfamiliar with this service.

**Freshness:** Update whenever the service's purpose, API, or key patterns change.

**Required sections:**
1. **What it does** (1–2 sentences, not how — what)
2. **When to use it** (and when NOT to use it — alternatives)
3. **Key concepts** (2–5 bullets covering the mental model)
4. **Quick start** (minimal working example)
5. **Links** to ARCHITECTURE.md, TESTS.md, and any related services

**Optional sections:** Prerequisites, Configuration, Known limitations, Version history

### ARCHITECTURE.md

**Purpose:** Internal technical design of the service — how it actually works, data flows, design decisions, and dependencies.

**Audience:** Engineers actively working on or debugging this service.

**Freshness:** Update when the internal design changes significantly.

**Required sections:**
1. **Overview diagram** (even ASCII art is fine) showing main components
2. **Data flow** — how data enters, transforms, and exits
3. **Key design decisions** — the non-obvious choices and why they were made
4. **Dependencies** — what this service depends on and why
5. **Extension points** — where/how to add new functionality

### TESTS.md

**Purpose:** Everything needed to understand the test suite for this service.

**Audience:** Engineers adding features or fixing bugs who need to run or extend tests.

**Required sections:**
1. **How to run** the tests (exact commands)
2. **Test structure** — what lives where and why
3. **Testing patterns** — mocking strategy, factory usage, fixtures
4. **Coverage expectations** — what's covered and what's intentionally not
5. **Integration test notes** — any external dependencies, how to mock them

### SETUP.md

**Purpose:** Non-obvious setup, configuration, or initialization steps.

**When to create:** When `pip install` / `npm install` alone isn't sufficient to get the service running.

**Required:** Step-by-step that a new engineer can follow exactly, with expected outputs at each step.

### FAQ.md

**Purpose:** Common questions, gotchas, and troubleshooting entries.

**When to create:** Once 3+ questions about the same service have been asked and answered.

**Format:** Q&A pairs. Short questions, concise answers. Link to deeper resources.

### Root Instruction Docs

These are documentation, not miscellaneous meta files. Treat them as first-class repo docs and review them whenever operating rules, delivery expectations, or design guidance change.
They are valid targets for ongoing hardening by `auto-improve`, just like README or runbook files.

| File | Purpose |
|---|---|
| `AGENTS.md` | Repo operating instructions for agents and contributors |
| `PLAN.md` | Current execution plan and ordering |
| `SPEC.md` | Scope, requirements, constraints, acceptance criteria |
| `SOUL.md` | Product intent, voice, and qualitative direction |
| `PRINCIPLES.md` | Invariants and non-negotiable rules |
| `DESIGN.md` | Design-system, architecture, UX, or interaction guidance |

### Runbooks

**Purpose:** Step-by-step operational procedures for workflows where order, verification, rollback, or escalation matter.

**When to write:** When a task crosses tools, services, environments, or approvals and should be repeatable by a different engineer or agent.

**Where it lives:**
- `runbooks/<workflow>.md` for repo-wide or multi-folder workflows
- `RUNBOOK.md` inside a folder for subsystem-local procedures

Prefer `runbooks/` for shared workflows that span multiple folders. Keep `docs/` for references, audits, specs, and narrative artifacts rather than operational step lists.

**Minimum sections:**
1. Purpose
2. Preconditions
3. Inputs
4. Procedure
5. Verification
6. Rollback / recovery
7. Escalation / related docs

---

## Tier 3: Project-Level Documentation

Project docs are repo-wide and live in the `docs/` directory.

### Memory Logs (`docs/memories/logs/YYYY/MM-DD/`)

**Purpose:** Chronological log of what changed and why — the engineering team's shared memory.

**Audience:** Team engineers, future debugging sessions, the agent reviewing context.

**Freshness:** Written in real-time after each change. Never retroactively backdated.

**Characteristics:** Extremely brief (2 lines max per entry), factual, past tense.

See: `references/continuous-docs.md` for full format guide.

### Memory Lessons (`docs/memories/lessons/YYYY/MM-DD/`)

**Purpose:** Reusable insights that should change future behavior — verified discoveries from real work.

**Audience:** Engineers and agents encountering the same situation later.

**Freshness:** Written once when the insight is verified. Updated if the lesson is later disproved.

See: `references/continuous-docs.md` for format guide.

### Memory Facts (`docs/memories/facts/YYYY/MM-DD/`)

**Purpose:** Stable facts about the team, company, or project not derivable from code.

**Audience:** Agents and engineers who would make wrong assumptions without this fact.

**Freshness:** Updated when the fact changes. Removed when no longer true.

### Memory Procedures (`docs/memories/procedures/YYYY/MM-DD/`)

**Purpose:** Repeatable workflows — the right way to do something after discovery.

**Audience:** Anyone performing the procedure again in the future.

**Freshness:** Update the "last verified" date each time the procedure is successfully followed.

### Memory Fixes (`docs/memories/fixes/YYYY/MM-DD/`)

**Purpose:** Solutions to non-obvious errors or bugs likely to recur.

**Audience:** Engineers (or agents) hitting the same error.

**Freshness:** Written once. Update if the fix stops working or a better solution is found.

### Audits (`docs/audits/YYYY/MM-DD/`)

**Purpose:** Structured investigation or analysis artifacts — audits, ADRs, post-mortems, findings, performance analyses.

**Audience:** Engineering leads, the team, future engineers investigating similar problems.

**Freshness:** One-off. Created once, rarely updated (updates are noted with edit timestamps).

See: `references/one-off-docs.md` for structure guide.

### Plans (`docs/plans/YYYY/MM-DD/`)

**Purpose:** Source of truth for planned features, migrations, or architectural changes.

**Audience:** The team executing the plan, reviewers, future engineers understanding why something was built a certain way.

**Freshness:** Updated as the plan evolves during execution. Archived after completion.

### Specs (`docs/specs/YYYY/MM-DD/`)

**Purpose:** Feature requirements, API contracts, and behavior specifications before implementation.

**Audience:** Implementors, reviewers, QA.

**Freshness:** Written before implementation begins. Updated if requirements change.

### Cookbook (`docs/cookbook/`)

**Purpose:** How-to guides for common engineering patterns and tasks within this repo.

**Audience:** Engineers new to a pattern, or engineers implementing something they haven't done here before.

**Freshness:** Updated when the pattern changes. Flat structure, no timestamps.

---

## Tier 3b: In-Folder Documentation

In-folder docs orient readers to a directory — what it contains, how it's organized, and how to navigate it. They apply at every directory level, not just service roots.
Outside `docs/`, this is the default folder contract.

### Core

Default set to consider first in every meaningful folder:

| File | Purpose | Create when |
|------|---------|-------------|
| `README.md` | Overview and navigation | Any directory a reader might enter without context |
| `ARCHITECTURE.md` | Technical deep-dive — structure, data flows, design decisions | Non-obvious internal organization |
| `TESTS.md` | Testing patterns, how to run, what's covered | Any directory with a meaningful test surface |

### Conditional

Add when the folder genuinely needs them:

| File | Purpose | Create when |
|------|---------|-------------|
| `SETUP.md` | Config, install, env — non-obvious setup steps | Installation alone isn't sufficient |
| `RUNBOOK.md` | Folder-local operational workflow | The folder has a repeatable procedure with verification or rollback |
| `CHANGELOG.md` | Version history | Versioned service, library, or package |
| `SECURITY.md` | Security boundaries, review notes, secrets handling | The folder has sensitive surfaces or special security rules |

### Rare

Use only when the domain merits them:

| File | Purpose | Create when |
|------|---------|-------------|
| `OVERVIEW.md` | High-level concepts before diving into details | Concepts deserve their own orientation beyond README |
| `FAQ.md` | Common questions and troubleshooting | 3+ repeated questions exist |
| `DECISIONS.md` | Folder-local design decisions | Decisions should be kept close to the folder, not as standalone ADRs |
| `DEPENDENCIES.md` | Dependency map, contracts, upgrade notes | Dependency behavior is non-obvious or risky |

**Applies at every level:**
- `docs/README.md` — navigation index for the docs folder
- `docs/memories/README.md` — what memory artifacts are and how to write them
- `docs/memories/logs/README.md` — log format, rules, finding the latest file
- `services/auth/README.md` — auth service overview
- `services/auth/handlers/README.md` — handlers sub-module
- `src/components/README.md` — component library overview

**`README.md` is always the highest priority.** It's the entry point for any directory. Leaf directories (date-stamped day folders like `2026/03-21/`) do not need in-folder docs.

---

## Tier 4: External Documentation

External docs live outside the repository — wikis, Notion pages, Confluence spaces, customer-facing sites.

### When to use external docs:

- Documentation that non-engineers need to edit
- Customer-facing product documentation
- Organization-wide policies (not repo-specific)
- Collaborative decision records that need rich formatting and comments

### Sync risk:

External docs drift from the code faster than in-repo docs. Mitigate by:
- Linking from the code/repo to the external doc (not the reverse)
- Adding a "last verified" timestamp to external docs
- Treating code as the source of truth when there's conflict

---

## Documentation Anti-Patterns

| Anti-pattern | Problem | Fix |
|---|---|---|
| Doc lives in chat/Slack | Discoverable only with perfect search | Write it to the repo |
| README 500+ lines | No one reads past line 50 | Split into README + ARCHITECTURE |
| Commented-out code | "We might need this" — almost never true | Delete it; git history has it |
| "See code for details" | Circular non-documentation | Document the non-obvious parts |
| Outdated example | Teaches wrong patterns | Either update or delete |
| Jargon without definition | Excludes new team members | Define terms on first use |
| Giant monolithic doc | Hard to scan, impossible to update piecemeal | Split by audience and topic |
| No "why" — only "what" | Future engineers can't evaluate whether to change it | Always document the reasoning |

---

## Choosing Between Doc Types: Decision Tree

```
New information to document?
│
├─ Is it about a specific function/method/class?
│   └─ Inline docstring or comment
│
├─ Is it about how a service works as a whole?
│   ├─ External behavior → README.md
│   └─ Internal design → ARCHITECTURE.md
│
├─ Is it what changed today?
│   └─ Memory log (docs/memories/logs/YYYY/MM-DD/)
│
├─ Is it a lesson learned from real work?
│   └─ Memory lesson (docs/memories/lessons/YYYY/MM-DD/)
│
├─ Is it a stable fact about the team/project/company?
│   └─ Memory fact (docs/memories/facts/YYYY/MM-DD/)
│
├─ Is it the right way to do something?
│   └─ Memory procedure (docs/memories/procedures/YYYY/MM-DD/)
│
├─ Is it a non-obvious error solution?
│   └─ Memory fix (docs/memories/fixes/YYYY/MM-DD/)
│
├─ Is it a decision with non-obvious trade-offs?
│   └─ ADR in docs/audits/YYYY/MM-DD/
│
├─ Is it a structured investigation or analysis?
│   └─ Technical report in docs/audits/YYYY/MM-DD/
│
├─ Is it a production incident?
│   └─ Post-mortem in docs/audits/YYYY/MM-DD/
│
├─ Is it a feature spec or API contract?
│   └─ Spec doc in docs/specs/YYYY/MM-DD/
│
├─ Is it a repo-wide operating rule, execution plan, product principle, or design rule?
│   └─ `AGENTS.md`, `PLAN.md`, `SPEC.md`, `SOUL.md`, `PRINCIPLES.md`, or `DESIGN.md`
│
├─ Is it a repeatable operational workflow with verification and rollback?
│   └─ `runbooks/<workflow>.md` or local `RUNBOOK.md`
│
├─ Is it a plan or migration?
│   └─ Plan doc in docs/plans/YYYY/MM-DD/
│
├─ Is it a versioned release history?
│   └─ CHANGELOG.md at the service or package root (not in docs/)
│
├─ Is it navigation/orientation for a directory?
│   └─ README.md (or ARCHITECTURE.md / OVERVIEW.md) in that directory
│
└─ Is it a reusable how-to?
    └─ Cookbook entry in docs/cookbook/
```
