# Continuous Documentation Reference

Continuous docs are written and maintained as part of the regular development flow. They don't require planning or approval — they're habits, not projects.

---

## Development Logs (`docs/memories/logs/`)

### Purpose

The development log is the engineering team's shared memory. It answers: "what changed today, and why?" — a question that becomes critically important during incident debugging, code archaeology, and onboarding.

### Finding the Right File

**Rule: Always append to the latest existing date file. Never create new files unless today's date doesn't exist yet.**

File path convention: `docs/memories/logs/YYYY/MM-DD/<filename>.md`

```bash
# Find the latest log directory
YEAR=$(ls docs/memories/logs/ | sort | tail -1)
DAY=$(ls docs/memories/logs/$YEAR/ | sort | tail -1)
# → docs/memories/logs/2026/03-21/

# Append a log entry to the latest file in that directory
echo "- Fixed failing OAuth tests by mocking token exchange properly" >> docs/memories/logs/$YEAR/$DAY/dev.md
```

If today's date directory doesn't exist, create `docs/memories/logs/YYYY/MM-DD/dev.md`.

### Format

One bullet per logical change. 2 lines maximum. Past tense. Active voice.

```
- [What changed] — [Why it changed or what problem it solved]
```

**Examples (good):**
```
- Fixed OAuth token refresh by adding missing redirect URI validation — was causing silent login failures on mobile
- Refactored candidate serializer to use RetrievalLevelMixin — removed ad-hoc to_representation override
- Added retry logic to MCP handshake — Anthropic endpoint returns 503 on cold start
- Bumped OpenAI SDK to 1.35.0 — required for structured output support in streaming mode
- Removed deprecated JobSkillLink model — migrated all FK references to ObjectItem pattern
```

**Examples (bad):**
```
- Did some refactoring
- Fixed a bug
- Updated code per review
- WIP
```

### When to Write

Write a log entry for:
- Any code change that makes it to the repo (even small ones)
- Config or environment changes
- Infrastructure changes
- Documentation changes that change behavior
- Dependency updates
- Migrations

Do NOT write log entries for:
- Commits that were immediately reverted
- Formatting-only changes (linting passes)
- WIP commits that are squashed before merge

### Tone

Technical, not narrative. Write it for your future debugging self, not for a blog post. Be specific — version numbers, function names, error messages — these make entries searchable.

---

## Versioned Release Notes

For services or libraries that have versioned releases, document version history in a `CHANGELOG.md` at the service or package root — not in `docs/`. This keeps the changelog co-located with what it describes.

```
services/auth/
├── CHANGELOG.md    ← version history for the auth service
```

When using semver, structure entries as: breaking changes (document migration path in `docs/plans/`), new features, and bug fixes.

---

## API Documentation

### REST APIs

Every API endpoint needs documentation covering:

1. **HTTP method and path**
2. **Purpose** (what the endpoint does, not how)
3. **Authentication requirements**
4. **Request body schema** (field names, types, required/optional, constraints)
5. **Query parameters** (if applicable)
6. **Response schema** for each status code
7. **Error codes** the endpoint can return

**Docstring format (Django/DRF example):**
```python
class CandidateViewSet(viewsets.ModelViewSet):
    """
    CRUD operations for candidate profiles.

    Authentication: JWT required on all actions.
    Permissions: Company-scoped — users can only access candidates in their company.

    Endpoints:
        GET    /api/candidate/          - List candidates (paginated, filterable)
        POST   /api/candidate/          - Create new candidate
        GET    /api/candidate/{id}/     - Retrieve single candidate
        PUT    /api/candidate/{id}/     - Full update
        PATCH  /api/candidate/{id}/     - Partial update
        DELETE /api/candidate/{id}/     - Soft delete (sets is_deleted=True)

    Filters (GET /api/candidate/):
        - status: active|inactive|archived
        - job_id: UUID — filter by assigned job
        - search: text search across name, email

    Response levels (pass ?level=basic|detailed|full):
        - basic: id, name, email, status
        - detailed: + skills, experience, education (default)
        - full: + audit trail, internal notes
    """
```

**OpenAPI annotations (FastAPI/DRF-spectacular):**
```python
@extend_schema(
    summary="List candidates",
    description="Returns paginated list of candidates scoped to the authenticated company.",
    parameters=[
        OpenApiParameter("status", description="Filter by status", enum=["active", "inactive", "archived"]),
        OpenApiParameter("level", description="Response detail level", enum=["basic", "detailed", "full"]),
    ],
    responses={200: CandidateSerializer(many=True), 403: ErrorSerializer},
)
def list(self, request, *args, **kwargs):
    ...
```

### GraphQL APIs

For GraphQL schemas, document:
- Each type with a description field
- Each field with its purpose and any constraints
- Each query/mutation with arguments, return type, and auth requirements

```graphql
"""
A candidate in the recruitment pipeline.
Scoped to the authenticated user's company.
"""
type Candidate {
  id: ID!
  """Full name as provided during application."""
  name: String!
  """Email address — used as login identifier."""
  email: String!
  """Current pipeline stage."""
  status: CandidateStatus!
}
```

### WebSocket / Event-Driven APIs

For WebSocket or event-driven systems, document:
- Event names and when they fire
- Payload schema for each event
- Error events and recovery behavior
- Connection lifecycle (connect, authenticate, reconnect, disconnect)

---

## Inline Code Documentation Cadence

### When to Update Existing Docs

Update inline docs when:
- The function's behavior changes (even slightly)
- A parameter is added, removed, or its meaning changes
- The return value shape changes
- A new exception can be raised

Update service docs when:
- The service's public API changes
- Key architectural patterns change
- A new testing approach is introduced

### Staleness Detection

Stale documentation is worse than missing documentation — it actively misleads.

Signs a doc is stale:
- Example code doesn't work when copy-pasted
- Described parameters don't exist in the function signature
- Referenced module names don't exist anymore
- Version numbers mentioned are obsolete

When encountering stale docs: fix them in the same PR as the code change that made them stale. Never leave a known-stale doc uncorrected.

---

## README Maintenance

READMEs are living documents — they should be updated whenever the service's behavior, API, or recommended usage changes.

### README Health Checklist

Run this checklist whenever modifying a service significantly:

- [ ] One-sentence description still accurate?
- [ ] "When to use" section still reflects current guidance?
- [ ] Quick start example still works?
- [ ] All linked files still exist?
- [ ] No references to deleted classes, functions, or modules?
- [ ] Version requirements up to date?
- [ ] No outdated environment variable names?

### When NOT to Update the README

- For internal refactors with no behavioral change
- For bug fixes with no API surface change
- For test additions

---

## Frontend Component Documentation

### Storybook

When the project uses Storybook, each component story IS the documentation. Maintain stories that cover:

1. **Default state** — the most common usage
2. **All significant variants** — different props that produce different output
3. **Edge cases** — empty states, error states, loading states, truncated content
4. **Interactive states** — hover, focus, disabled, selected

Each story should have:
```typescript
export default {
  title: 'Components/CandidateCard',
  component: CandidateCard,
  parameters: {
    docs: {
      description: {
        component: 'Compact display card for a single candidate. Used in pipeline boards and list views.',
      },
    },
  },
} satisfies Meta<typeof CandidateCard>;
```

### Component README (when no Storybook)

When Storybook isn't available, document components in their directory:

```
components/CandidateCard/
├── CandidateCard.tsx
├── CandidateCard.test.tsx
└── README.md
```

`README.md` must cover: purpose, props table, usage example, variants.

---

---

## Memory Artifacts (`docs/memories/`)

Memory artifacts are the team's collective knowledge base — the human-readable output of continuous learning. All types use date-based subdirectories: `docs/memories/<type>/YYYY/MM-DD/*.md`.

---

### Lessons (`docs/memories/lessons/`)

**Purpose:** Reusable insights from code experience that should change future behavior.

**Write when:** You discovered something non-obvious that you or a teammate will need again and that can't be derived just by reading the code.

**Gate:** Must be verified by real work (not theory), reusable across sessions, specific enough to change behavior, non-trivial.

**Format:**
```markdown
# [Concise lesson title — active verb + subject]

**Date:** YYYY-MM-DD
**Tags:** [domain, component]

## Problem

[What was ambiguous or unknown that prompted the investigation]

## Context / When This Applies

[Specific conditions under which this lesson is relevant]

## Insight

[What was learned — the non-obvious finding]

## Verification

[How this was confirmed — test, observation, or user feedback]

## Related

- [Link to fix, procedure, or audit if applicable]
```

---

### Facts (`docs/memories/facts/`)

**Purpose:** Stable facts about the user, company, or project context not derivable from code.

**Write when:** A teammate (or future agent) would make a wrong assumption without this fact.

**Gate:** Durable (won't change frequently), non-sensitive, clearly true.

**Format:**
```markdown
# [Fact title — declarative statement]

**Date:** YYYY-MM-DD
**Category:** team | infrastructure | business | process

## Fact

[The fact itself — one clear statement]

## Why This Matters

[What goes wrong without knowing this]

## Source / Evidence

[Where this was learned or confirmed]
```

---

### Procedures (`docs/memories/procedures/`)

**Purpose:** Documented repeatable workflows — how things should be done after discovery.

**Write when:** You've figured out the right way to do something that would require rediscovery without notes.

**Gate:** Repeatable, non-trivial to rediscover, tested at least once.

**Format:**
```markdown
# [Procedure title — verb phrase]

**Date:** YYYY-MM-DD
**Last verified:** YYYY-MM-DD

## When to Use

[Trigger condition — when should someone follow this procedure?]

## Steps

1. [Step one with expected output]
2. [Step two]
3. ...

## Notes / Caveats

[Known edge cases, prerequisites, gotchas]
```

---

### Fixes (`docs/memories/fixes/`)

**Purpose:** Solutions to errors or bugs that were non-obvious or likely to recur.

**Write when:** A fix was hard to find or the error is likely to appear again.

**Gate:** Non-obvious cause or solution, fix is specific and reproducible.

**Format:**
```markdown
# Fix: [Error description or symptom]

**Date:** YYYY-MM-DD
**Tags:** [domain, error-type]

## Symptom

[What the error looks like — exact message or behavior]

## Root Cause

[Why it happens]

## Fix

[Exact steps or code change to resolve it]

## Prevention

[How to avoid hitting this again, if applicable]
```

---

## Continuous Doc Quality Signals

### Good continuous doc signals:
- Development logs written within hours of the change, not days later
- Changelogs readable by a non-engineer
- Inline docs updated in the same PR as the code change
- READMEs that pass their own quick-start instructions
- Memory artifacts written when insights are fresh, not reconstructed from memory

### Warning signals:
- Log entries written in bulk days after the changes
- Changelogs with implementation details ("fixed N+1 query")
- Inline docs that reference deleted parameters
- "TODO: document this" comments older than one sprint
- Lessons or fixes written without a concrete trigger or verification
