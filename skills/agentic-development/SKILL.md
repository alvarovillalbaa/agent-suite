---
name: agentic-development
description: End-to-end repository execution workflow for implementing, debugging, refactoring, reviewing, instrumenting, explaining architecture, assessing refactor impact, designing system architecture, evaluating architecture patterns (monolith vs microservices, CQRS, event-driven, hexagonal), making technology decisions (database, cache, queue, auth, cloud, API style), generating architecture diagrams, analyzing dependencies, planning capacity, designing APIs and schemas, and shipping code in any software repo. Use when the assistant needs to orient in an unfamiliar codebase, choose between direct execution and supervised harness loops, keep specs, plans, and tests distinct, coordinate builder and reviewer passes, handle PR feedback, inspect observability, or land cross-cutting frontend and backend changes without leaving loose ends. Also use when the user wants to break down a PRD into phases, create an implementation plan from a PRD, plan vertical slices, or mentions "tracer bullets". Also use when the user wants to plan a refactor, create a refactoring RFC, file a refactor plan as a GitHub issue, break a refactor into safe incremental steps, or mentions "tiny commits".
---

# Agentic Development

Drive work through one loop: orient, classify the task, choose the execution mode, implement, review, verify, and compound. Treat repo-local instructions and existing architecture as the source of truth. For repeated or long-running work, keep the loop supervised: fresh context each iteration, state on disk, one task at a time, hard gates, and explicit reviewer output.

## Start Here

1. Run the repo scan helper if the skill bundles one; otherwise do the same discovery manually from the repo root.
2. Map the repo before touching code: instruction files, package or service boundaries, entrypoints, build and test commands, deployment surfaces, and current git state. The authoritative source of truth for project knowledge is the codebase itself and `docs/` — read implemented code and documented decisions before making assumptions.
3. For frontend-heavy work, map framework boundaries, route ownership, design-system sources, shared primitives, state owners, and existing analytics or error-reporting seams before choosing an edit path.
4. Decide the task type and execution mode: implementation, review, architecture explanation, debugging, refactor, instrumentation, or release cleanup; then choose direct execution or a supervised harness loop if code will be written.
5. Choose the authoritative path for the change or explanation: the existing module, service, component, hook, page, command, model, or workflow that already owns the behavior.
6. Decide the proof before editing: what command, test, log, screenshot, trace, dependency search, or reviewer output will confirm the result.
7. Load only the reference files relevant to the current task.

## Core Rules

- Prefer repo-local instructions over generic advice. If `AGENTS.md`, `CLAUDE.md`, `SOUL.md`, `PRINCIPLES.md`, `PLANS.md`, `README.md`, `CONTRIBUTING.md`, or service/package docs exist, follow them in the hierarchy the repo defines.
- Work with the current git reality. Do not force a branch or worktree change just because `main` is active; choose the safest path that fits the user's intent.
- Extend existing seams. Reuse current services, hooks, stores, component primitives, models, logging, analytics, and scripts instead of creating parallel abstractions. Prefer updating an existing file over creating a new one — embed functionality into the module that already owns the behavior.
- Architecture claims need evidence. Trace entrypoints, ownership, dependencies, and contracts before explaining how the system works or what a refactor will affect.
- Separate concerns intentionally: specs define behavior, plans define execution, progress files record loop state, tests prove behavior, and instrumentation explains production behavior.
- Treat context as scarce. Keep instruction files, prompts, and scratchpads compact; use index files and on-demand references instead of stuffing every loop with full docs.
- Structure instruction files as logical routers, not documentation dumps. A CLAUDE.md or AGENTS.md should say "before coding, read coding-rules.md" rather than inlining those rules. Keep the always-loaded file minimal; put depth in on-demand references loaded only when the relevant scenario is active.
- Keep rules and skills conceptually distinct. Rules encode preferences and constraints — what to always or never do. Skills encode recipes — the specific approach to accomplish a category of work. Mixing them into the same file degrades both.
- Separate research context from implementation context. When an agent explores alternatives, do not carry those alternatives into the implementing agent's brief. The implementing agent receives only the chosen approach, with fresh context, so discarded research paths cannot compete with the implementation signal.
- Use neutral prompts for discovery. "Trace through X and report all findings" produces honest results; "Find a bug in X" will produce a finding whether or not one exists — agents comply with requests, making biased diagnostic prompts unreliable for discovery.
- One task per loop. If work spans multiple iterations, persist state on disk and restart with fresh context instead of dragging a swollen transcript forward.
- Hard gates decide readiness. In harness or agent-loop mode, gates that can block or advance work must be binary pass or fail, not advisory.
- Structured review beats narrative when another agent or loop must consume the result. Emit compact findings with severity, file, line, risk, and expected fix.
- When broad permissions or network access are required, prefer the smallest blast radius: isolated branch or worktree, sandbox or ephemeral environment, and least-privilege credentials.
- Verification gates claims. Do not say fixed, complete, passing, or ready without fresh evidence.
- Report completion status explicitly: **DONE** (all steps done, evidence provided), **DONE_WITH_CONCERNS** (completed but with issues to surface), **BLOCKED** (cannot proceed — state what was tried), or **NEEDS_CONTEXT** (missing required information). Never leave the user guessing about state.
- When work spans multiple attempts and succeeds after prior failures, acknowledge what changed. When a task cannot be completed after 3 genuine attempts, escalate rather than loop.
- Prefer completeness over shortcuts. When AI makes the marginal effort near-zero, recommend the complete path: all edge cases covered, all call sites updated, all tests passing. Flag work that is ocean-scale (multi-quarter rewrite) rather than lake-scale (100% coverage of the current surface). Boil lakes; respect oceans.
- Frontend work is product behavior, not decoration. Preserve design systems, router conventions, state ownership, accessibility, and interaction quality the same way you would preserve API boundaries in a backend.
- Choose the right frontend artifact level before coding: primitive, composed control, domain component, page section, hook, store, or route. A bad boundary choice causes more churn than a small implementation bug.
- Finish cleanly. Make the next integration step explicit instead of silently leaving the repo in an ambiguous state.
- Seek clarification by default for any decision not already anchored in existing patterns. When an existing pattern is found, apply senior/principal-engineer judgement: evaluate whether it should be improved or preserved, then ask the user — prefer hybrid decisions that satisfy both evolution and backward consistency (framework choices excepted: frameworks are stable anchors).
- Before building any non-trivial artifact (feature, document, content, system, design), run a planner step first: expand the prompt into a full spec, identify strategic decisions that would otherwise be guessed at (audience, tone, scope, architecture, success criteria, constraints), and interview the user with a recommended answer per gap. Controlling the input produces better output than fixing the output — 2 minutes of upfront spec work eliminates the entire back-and-forth editing cycle.
- Apply senior and principal engineering standards in all work areas — frontend, backend, and beyond. Prefer the highest-quality, most maintainable implementation that fits the codebase and team conventions, not merely the minimum that compiles or passes tests.
- The authoritative source for all project knowledge is the codebase itself and `docs/`. Discover by reading implemented code and documented decisions before making assumptions. Do not invent conventions the codebase does not already follow.

## Execution Modes

### Code Development Default: Agent Selection by Complexity

For any code development task, choose the execution model before writing a single line:

| Scope / Complexity | Default execution model |
|--------------------|-------------------------|
| **Small** — single file or function, clear spec, one proof path | Single agent (direct execution) |
| **Medium** — 2–5 files, separable concerns, independent sub-tasks | Subagents-driven development — controller dispatches focused workers |
| **Large** — cross-cutting feature, multi-service, or multi-domain | Team of agents — controller + specialized agents (implementer, reviewer, tester, architect) |
| **Epic / multi-sprint** — full subsystem rewrite, major migration | Supervised harness loop with team of agents across iterations |

When in doubt, start one level up. A single-agent task that hits unexpected complexity should be paused, re-scoped, and re-dispatched with subagents rather than piling all context into one growing transcript.

Read [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for controller/worker patterns, team composition, review loops, and safe parallelization rules.

### Other execution modes

- **Direct execution** (single agent): use for small, clear changes with a single coherent proof path.
- **Subagents-driven development**: use when the task has separable concerns — backend vs. frontend, independent failures, domain-specific investigation. Controller owns scope and integration; workers own focused implementation slices.
- **Team of agents**: use for large or complex work. Typical team: architect agent (maps dependencies, designs the change), implementer agent(s) (write code per domain), reviewer agent (independent quality/risk check), and controller (integrates, verifies, resolves conflicts). Each agent gets an explicit brief, scoped files, and acceptance criteria.
- **Supervised harness loop**: use for repeated or backlog-style work only when the spec is clear, the change surface is isolated, and the repo has trustworthy gates. Keep each iteration fresh and single-purpose.
- **Review or explanation mode**: use for architecture mapping, impact analysis, code review, or debugging passes where the immediate output is understanding or findings rather than code.
- **Planner/interviewer mode**: use before any non-trivial creation task. Expand the prompt into a full spec, identify decisions Claude would otherwise guess at, interview the user with one proposed answer per gap until all gaps are resolved, assemble a complete brief, then execute. Skip for trivial changes where the spec is already unambiguous. See [interviewer-pattern.md](./references/interviewer-pattern.md).

Switch modes when the evidence changes. If a harness starts flailing, or a single-agent run grows beyond ~3 coherent sub-tasks, shrink the task, tighten the spec, and re-dispatch with subagents or a team.

## Architecture Bias

Apply these defaults unless the repo clearly prefers something else:

- Maximize reuse and minimize total LOC.
- Prefer one authoritative implementation path over duplicated variants.
- Avoid repeated logic and near-duplicate code with the same purpose.
- Do not over-modularize. Split only when independence, ownership, or readability materially improves. Monolithic files are acceptable when the logic is cohesive.
- No backward-compatibility shims or facades. When rearchitecting, update all import paths and call sites directly rather than adding re-export wrappers or compatibility layers.
- Avoid dead code. Remove unused imports, unreachable branches, stale feature flags, and code left behind after any refactor or behavioral change.
- Favor cohesive vertical slices over scattering one concept across many files.
- Push business logic and async orchestration out of leaf UI where possible; keep views readable and state ownership explicit.
- Prefer composition, slots, or subcomponents over boolean-heavy component APIs and prop matrices.
- Treat loading, empty, error, success, and responsive states as part of the implementation, not post-hoc polish.
- Widely-used utilities, helpers, types, constants, and shared logic belong in global folders — not duplicated per feature or service. Before creating a new local helper, search for an existing global one and extend it. When something is used in three or more places, promote it to the global location.
- Within a folder, prefer a `base` file that encodes shared logic; specialized files extend or compose from it. This makes the abstraction boundary explicit, reduces duplication, and centralizes the surface area for future changes.

## Workflow Router

### Orientation and repo policy

Read [repo-orientation.md](./references/repo-orientation.md) for startup discovery, instruction-file handling, repo-shape detection, and initial command selection.

### Harness loops and persistent task state

Read [harness-loops.md](./references/harness-loops.md) when the task is large enough for repeated agent iterations, when specs or plans live on disk between runs, when builder and reviewer passes should be split, or when you need to decide whether a repo is ready for higher-autonomy execution.

### Instruction file design and session hygiene

Read [instruction-file-design.md](./references/instruction-file-design.md) when structuring CLAUDE.md, AGENTS.md, or project rule/skill files; when deciding how to separate rules from skills in a project's cognitive scaffolding; when scoping research-phase agents vs implementation-phase agents to avoid alternative-pollution; or when prompting for discovery and wanting results that are accurate rather than confirmatory.

### Architecture analysis and refactor impact

Read [architecture-analysis.md](./references/architecture-analysis.md) when the user asks how the system works, wants dependency or data-model relationships explained, needs impact analysis before a rename, move, extraction, or schema change, or wants to create or evaluate an Architecture Decision Record (ADR) — choosing between technologies, documenting a design decision with trade-offs, reviewing a system design proposal, or designing a new component from requirements.

### Architecture patterns reference

Read [architecture-patterns.md](./references/architecture-patterns.md) when choosing or explaining a software architecture pattern — comparing Monolith vs Modular Monolith vs Microservices, understanding Event-Driven Architecture, CQRS, Event Sourcing, Hexagonal (Ports & Adapters), Clean Architecture, or the API Gateway pattern. Contains trade-off tables, structure examples, code snippets, and a pattern selection quick reference matrix. Use the team size → default pattern table as the starting point before exploring alternatives. Use alongside [architecture-analysis.md](./references/architecture-analysis.md) for impact analysis and ADR creation.

### System design workflows

Read [system-design-workflows.md](./references/system-design-workflows.md) when the user asks to design a system from scratch, estimate capacity, design an API, design a database schema, assess scalability, or plan a migration. Contains 6 step-by-step workflows: System Design Interview Approach (requirements clarification, scale estimation, high-level design, bottleneck analysis), Capacity Planning (compute/storage/bandwidth calculations), API Design (resource identification, request/response formats, error contracts), Database Schema Design (entities, relationships, indexes, partitioning), Scalability Assessment (profiling, load testing, vertical vs horizontal scaling), and Migration Planning (strangler fig, blue-green, canary strategies with rollback procedures and checkpoints).

### Interface design (Design It Twice)

Read [interface-design.md](./references/interface-design.md) when designing a new module, class, or service interface; when exploring API shape options before committing; when the user says "design it twice", "explore options", or "compare approaches"; or when a component boundary is unclear and multiple valid shapes exist. Implements the parallel sub-agents pattern from Ousterhout's "A Philosophy of Software Design": spawn 3+ agents with divergent constraints (minimize methods / maximize flexibility / optimize common case), present each design with its interface signature, usage examples, and hidden internals, compare on simplicity / depth / ease-of-misuse, then synthesize. Do not implement — this is a diverge-then-converge exploration for shape decisions that are hard to reverse once callers exist.

### Technology decision frameworks

Read [tech-decision-guide.md](./references/tech-decision-guide.md) when the user needs to choose a technology: database (SQL vs NoSQL decision matrix, PostgreSQL/MongoDB/Redis/DynamoDB/Cassandra/TimescaleDB comparison), caching strategy (read-through/write-through/write-behind/cache-aside, Redis vs Memcached vs CDN, TTL guidelines), message queue (RabbitMQ/Kafka/SQS/Redis Streams), authentication method (session vs JWT vs OAuth 2.0, token lifetimes, OAuth 2.0 flow selection), frontend framework (React/Vue/Angular/Svelte, meta-framework selection, rendering strategy), cloud provider (AWS/GCP/Azure comparison, multi-cloud decision), or API style (REST vs GraphQL vs gRPC, versioning strategies). Quick reference table at the bottom maps each decision to its default choice.

### Architecture tooling scripts

Use the architecture scripts in `scripts/` for automated analysis and visualization:
- `scripts/architecture_diagram_generator.py` — generates Mermaid, PlantUML, or ASCII diagrams (component/layer/deployment types) from a project directory by scanning structure, detecting technologies, and tracing imports. Usage: `python scripts/architecture_diagram_generator.py ./project --format mermaid --type layer`
- `scripts/dependency_analyzer.py` — analyzes npm/pip/Poetry/Go/Cargo dependencies for circular dependencies, coupling score (0–100), and outdated packages with actionable recommendations. Usage: `python scripts/dependency_analyzer.py ./project --verbose`
- `scripts/project_architect.py` — detects architectural patterns (MVC, Layered, Hexagonal, Clean, Microservices, Modular Monolith, Feature-Based) with confidence scores, reports large files and god classes, and detects layer violations. Usage: `python scripts/project_architect.py ./project --verbose`

### Git, branches, worktrees, and PR flow

Read [collaboration-and-git.md](./references/collaboration-and-git.md) when the task touches branching strategy, worktrees, PRs, merges, or cleanup. Includes bisectable commit ordering: infra → models+tests → controllers+tests → cleanup → release metadata, with rules for keeping each commit independently valid. Also contains the intent-first PR creation workflow: search session history for the problem and justification before writing the description, ask rather than fabricate if intent is missing, validate the diff for unexpected files, and apply the five anti-fabrication rules (no invented intent, no file lists, no narrated diffs, no speculative risks, no test plans).

### Spec-driven, plan-driven, and test-driven delivery

Read [specs-plans-tests.md](./references/specs-plans-tests.md) when the user asks for a plan or spec, when scope is fuzzy, or when writing any implementation code. Contains the Iron Law (no production code without a failing test first), the Red-Green-Refactor cycle, the anti-pattern of horizontal slices (write all tests then all code — wrong; use one-test-one-impl vertical cycles instead), testing philosophy (tests verify behavior through public interfaces, not implementation details), mocking discipline (mock only at system boundaries, never internal collaborators), the pre-completion verification checklist, common TDD rationalizations to reject, the Test Coverage Audit (ASCII diagram format, E2E Decision Matrix, coverage gate with line/branch/function targets, mandatory Regression Rule), and the Plan Completion Audit (cross-reference plan items against the diff before shipping). TDD is the default delivery mode for any behavioral change.

Also contains the **"A Sufficiently Detailed Spec Is Code"** principle: a spec precise enough to reliably generate a working implementation carries the same cognitive cost as the code itself. Use specs to capture *what* must be true (acceptance criteria, invariants, constraints), not as pseudocode substitutes for writing the code. Vague specs produce flaky implementations — precision cannot be outsourced to the agent.

### PRD to implementation plan (tracer bullets)

Read [prd-to-plan.md](./references/prd-to-plan.md) when the user wants to break down a PRD into phases, create a phased implementation plan, plan vertical slices, or mentions "tracer bullets". Covers the full workflow: confirming the PRD is in context, exploring the codebase, identifying durable architectural decisions, drafting vertical slices (each a thin end-to-end path through every layer), quizzing the user on granularity, and writing the plan to `./plans/<feature>.md` using the canonical template.

### Refactor planning — interview, commit plan, and GitHub issue

Read [refactor-planning.md](./references/refactor-planning.md) when the user wants to plan a refactor, create a refactoring RFC, file a refactor plan as a GitHub issue, break a refactor into safe incremental steps, or mentions "tiny commits". Contains an 8-step interview-driven workflow: gather the problem description, verify against the codebase, surface alternatives, deep implementation interview, nail down scope (in/out), check test coverage, break into tiny commits (one working-state commit per step per Martin Fowler), and file a structured GitHub issue with a Problem Statement / Solution / Commits / Decision Document / Testing Decisions / Out of Scope template. Distinct from `interviewer-pattern.md` (generic pre-build spec) — this workflow is specific to refactor scope negotiation, commit granularity, and coverage gate before touching existing behavior.

### Pre-build specification and gap interview

Read [interviewer-pattern.md](./references/interviewer-pattern.md) before building any non-trivial artifact — feature, document, content piece, design, system, or API. Implements the planner/interviewer pattern: (1) expand the short request into a full spec with every section defined and its strategic purpose stated, (2) identify decisions Claude would otherwise guess at — audience, tone, architecture, scope, success criteria, constraints, edge cases — and interview the user with a proposed answer per gap, (3) assemble a complete brief, then execute. Apply whenever the request leaves key strategic decisions unresolved. The 2-minute spec step eliminates the back-and-forth editing cycle on the back end.

### Advanced TDD techniques

Read [tdd-advanced.md](./references/tdd-advanced.md) for techniques beyond the core TDD cycle:
- **Spec-first workflow** — `specs/` directory convention, acceptance criteria → test mapping, AC traceability comments
- **Language-specific patterns** — TypeScript/Jest behavior-scoped tests, Python/Pytest fixtures + parametrize, Go table-driven tests
- **Property-based testing** — Hypothesis (Python) and fast-check (TypeScript) for invariant verification across random inputs
- **Mutation testing** — Stryker (JS/TS), mutmut (Python), PIT (Java) to measure whether tests actually catch production bugs (target 85%+ mutation score on critical paths)
- **Coverage targets by type** — Line 80%, Branch 70%, Function 90%, PR delta -2% alert
- **Test quality principles** — independence, speed (<100ms), determinism, naming conventions
- **Bounded autonomy rules** — when to stop and ask vs. continue generating tests autonomously

### Framework configuration and CI coverage integration

Read [tdd-framework-guide.md](./references/tdd-framework-guide.md) when setting up or configuring a test framework: Jest (`jest.config.js` with ts-jest and thresholds), Vitest (`vitest.config.ts` with c8 provider), Pytest (`pytest.ini` with cov options), or JUnit 5 (Maven dependencies + JaCoCo). Includes test pattern examples for each framework and minimum version requirements.

Read [tdd-ci-integration.md](./references/tdd-ci-integration.md) when wiring coverage into CI: GitHub Actions workflows for Node.js/Jest, Python/Pytest, and Java/Maven; quality gate configuration in `package.json`, `pyproject.toml`, and `pom.xml`; PR coverage checks (block merges on drops, coverage diffs); and coverage services (Codecov, Coveralls, SonarCloud).

### CI/CD pipeline generation

Use this workflow when bootstrapping CI for a new repository, replacing brittle copied pipeline files, migrating between GitHub Actions and GitLab CI, or auditing whether pipeline steps match the actual stack.

**Two-step workflow:**

```bash
# Step 1 — detect stack signals
python scripts/stack_detector.py --repo . --format json > detected-stack.json

# Step 2 — generate pipeline YAML from detection
python scripts/pipeline_generator.py \
  --input detected-stack.json \
  --platform github \
  --output .github/workflows/ci.yml

# Or end-to-end from repo directly
python scripts/pipeline_generator.py --repo . --platform gitlab --output .gitlab-ci.yml
```

Both scripts support `--format text` (default) or `--format json` for machine-readable output. The generator supports `github` and `gitlab` platforms and detects Node.js (pnpm/yarn/npm), Python, and Go stacks.

**Reference templates:**
- [github-actions-templates.md](./references/github-actions-templates.md) — Node.js, Python, Go baselines; Vercel deploy with OIDC; promote-after-tests pattern
- [gitlab-ci-templates.md](./references/gitlab-ci-templates.md) — Node.js, Python, Go baselines; protected deploy stages with `when: manual`
- [deployment-gates.md](./references/deployment-gates.md) — minimum gate policy (lint→test→build→deploy), environment promotion pattern, rollback requirements

**Adding deployment stages safely:**
1. Start CI-only (`lint/test/build`) — get a green baseline before adding deploy.
2. Add staging deploy with explicit `environment:` context.
3. Add production deploy with manual gate/approval.
4. Keep rollout/rollback commands explicit and auditable.
5. Gate deploy jobs on `needs: ci` (GitHub) or stage ordering (GitLab).

**Scaling guidance:** Split jobs by stage when runtime exceeds 10 minutes. Introduce test matrix only when compatibility truly requires it. Separate deploy jobs from CI jobs to keep feedback fast.

**Distinction from cloud-management:** `pipeline_generator.py` here generates CI YAML (lint/test/build stages) from stack signals. For cloud-specific deployment plans (rolling, blue-green, canary per provider), use the `cloud-management` skill's `scripts/deployment_manager.py` instead.

### Subagents, teams, and parallel work

Read [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for the complexity routing matrix, team-of-agents patterns (feature team, investigation team, review-loop team, harness team), controller responsibilities, builder/reviewer split, and safe parallelization rules. This reference is the primary guide for choosing between single-agent, subagents-driven, and team-of-agents execution.

### Agentic system architectures

Read [agentic-system-design.md](./references/agentic-system-design.md) when designing agent architectures from scratch — choosing between ReAct, Plan-and-Execute, tool use / function calling, multi-agent collaboration, or memory-and-state patterns; implementing orchestration protocols (sequential pipeline, hierarchical, debate/consensus); designing tool registries; or applying agent patterns such as Reflection, Self-Ask, and Expert Routing. Use alongside [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for in-session controller/worker patterns and alongside [harness-loops.md](./references/harness-loops.md) for supervised execution loops.

### Prompt engineering patterns

Read [prompt-engineering-patterns.md](./references/prompt-engineering-patterns.md) when writing or improving prompts — choosing between zero-shot, few-shot, chain-of-thought, role prompting, structured output, self-consistency, ReAct, tree-of-thoughts, RAG, or meta-prompting; designing in-context examples; enforcing output format; or selecting a technique based on task type (reasoning, tool use, structured JSON, multi-step logic). Includes a pattern selection guide and few-shot example design workflow.

### LLM evaluation frameworks

Read [llm-evaluation-frameworks.md](./references/llm-evaluation-frameworks.md) when evaluating LLM output quality, measuring RAG retrieval and answer faithfulness, designing A/B prompt experiments, selecting evaluation metrics (BLEU, ROUGE, BERTScore, Precision@K, MRR, NDCG), applying LLM-as-judge or human evaluation frameworks, building benchmark datasets, or setting up an automated evaluation pipeline. Use alongside `scripts/rag_evaluator.py` for automated RAG metric collection.

### Reviews, comments, and PR feedback

Read [reviews-and-comments.md](./references/reviews-and-comments.md) when reviewing code, receiving review feedback, or addressing GitHub, Sentry, or CI comments. Includes the Adversarial Review pattern — dispatching a fresh-context subagent to find what the structured review missed, with multi-model synthesis for large diffs.

### Observability and debugging

Read [observability.md](./references/observability.md) before adding logs or instrumentation, and whenever debugging should start from existing signals instead of guesswork.

### Backend execution

Read [backend-development.md](./references/backend-development.md) for service-layer, data-model, API, async, and architecture heuristics. Includes the canonical platform architecture pattern (API → Serializer → Service → BaseService, AI Agent → Tool Call → Service), hard rules for API design (UUID path params, one-view-per-model, all CRUD methods consolidated), data model minimization (multi-purpose models, JSONField vs columns, relations over repeated fields, composable mixins), and the core philosophy (maximize LOC reuse, minimize total LOC, single point of truth, no repeated logic, no over-modularization).

Read [api-design-patterns.md](./references/api-design-patterns.md) when designing or refactoring REST or GraphQL APIs — choosing between REST and GraphQL, resource naming conventions (plural nouns, hyphens, no verbs), URL path versioning and deprecation strategy, standard error response format with machine-readable codes, offset vs cursor-based pagination, JWT and API key authentication patterns, tiered rate limiting with Redis, and idempotency key implementation.

Read [rest-design-rules.md](./references/rest-design-rules.md) for a comprehensive rule-by-rule REST reference — HTTP method semantics (safe/idempotent matrix), status code catalogue (2xx/3xx/4xx/5xx with specific scenarios), URL design patterns (filtering, sorting, field selection, search query params), response format standards (single resource, collection, error envelope), field naming conventions (camelCase, boolean prefixes, ISO 8601 dates), content negotiation, caching headers (Cache-Control, ETags), security headers (CORS, Authorization), rate limit headers, and HATEOAS link relations. Use alongside api-design-patterns.md — this reference provides the normative rules; api-design-patterns.md provides implementation examples.

Read [api-antipatterns.md](./references/api-antipatterns.md) when reviewing an existing API design or performing a code review on API endpoints — covers 17 concrete anti-patterns each with bad/good examples: verb-based URLs, inconsistent naming conventions, ignoring HTTP status codes, overly complex nesting, inconsistent error formats, missing pagination, exposing implementation details, endpoint overloading, lack of versioning, poor error messages, ignoring content negotiation, stateful design, inconsistent HTTP method usage, missing rate-limit info, chatty design, no input validation, and synchronous long-running operations. Includes prevention strategies (design reviews, style guides, automated testing, documentation standards). Use when auditing API surface area or educating on REST correctness.

#### API review and quality scripts

- `scripts/api_linter.py` — lints OpenAPI/Swagger JSON specs against REST best practices: naming conventions (kebab-case paths, camelCase params, PascalCase schemas), HTTP method compliance, path structure (depth, verbs), response coverage (success + error codes), documentation completeness, and schema property naming. Produces a 0–100 quality score with error/warning/info breakdown. Usage: `python scripts/api_linter.py openapi.json` or `python scripts/api_linter.py --format json openapi.json`
- `scripts/api_scorecard.py` — grades an OpenAPI spec A–F across five weighted dimensions: Consistency 30% (naming, response patterns, URL structure), Documentation 20%, Security 20% (auth, RBAC), Usability 15% (DX, discoverability), Performance 15% (caching, pagination). Emits per-category scores, improvement recommendations, and supports `--format json` for CI integration. Usage: `python scripts/api_scorecard.py openapi.json`
- `scripts/breaking_change_detector.py` — compares two OpenAPI JSON files and classifies every difference as BREAKING / POTENTIALLY_BREAKING / NON_BREAKING / ENHANCEMENT with severity (CRITICAL → INFO). Detects removed endpoints, HTTP method removals, parameter changes (added required, removed, required-status flip), request/response body changes, schema type changes, property removals, new required fields, status code removals, content-type changes, and security-scheme modifications. Generates per-change migration guides and a version-bump recommendation (major/minor/patch). Supports `--exit-on-breaking` for CI gates. Usage: `python scripts/breaking_change_detector.py v1.json v2.json` or `python scripts/breaking_change_detector.py --format json v1.json v2.json`

Read [database-optimization.md](./references/database-optimization.md) when queries are slow or database performance needs improvement — reading EXPLAIN ANALYZE output (scan types, cost, buffers), indexing strategies (B-tree, GIN, GiST, composite, partial, covering), solving N+1 queries (JOIN, batch loading, ORM eager loading), pg-pool configuration and pool sizing formula, PgBouncer for high scale, cursor-based pagination vs OFFSET, safe migration patterns (CONCURRENTLY, non-blocking column addition), and pg_stat_statements for identifying slowest queries. Use alongside `scripts/database_migration_tool.py` for automated schema analysis and migration generation.

### Database schema design and normalization

Read [database-design-reference.md](./references/database-design-reference.md) when designing a new schema from scratch, evaluating normalization level, choosing between normalization and denormalization, or writing SQL patterns (JOINs, CTEs, window functions, aggregations, materialized aggregates). Covers 1NF–BCNF theory with before/after DDL examples, denormalization patterns (redundant storage, materialized aggregates), common query patterns, and index optimization principles. Use as the foundational design reference before reaching for database-optimization.md (which focuses on existing-query tuning).

Read [normalization-guide.md](./references/normalization-guide.md) for a deep-dive on each normal form (1NF–BCNF) with full DDL violation/fix examples, denormalization trade-off analysis, trigger-based consistency maintenance, materialized views, and an anti-patterns checklist. Use when normalizing a legacy schema or teaching normalization decisions.

Read [index-strategy-patterns.md](./references/index-strategy-patterns.md) when choosing index types or debugging slow queries — covers B-tree, hash, partial, covering, and functional/expression indexes; composite index column-ordering strategy (most-selective-first rule with selectivity SQL); query-pattern matching (equality+range, multiple equality, equality+sort); index intersection vs composite trade-offs; over-indexing anti-patterns; and PostgreSQL-specific monitoring queries (`pg_stat_user_indexes`, `pg_stat_statements`). Use alongside database-optimization.md; this reference focuses on index design, database-optimization.md on EXPLAIN reading and pooling.

Read [database-selection-decision-tree.md](./references/database-selection-decision-tree.md) when choosing a database technology for a new project or evaluating a migration — provides a full decision tree from use-case (OLTP, OLAP, real-time analytics, search, graph, time-series) through consistency and scaling requirements to specific engine recommendations (PostgreSQL, MySQL, CockroachDB, MongoDB, Cassandra, Redis, DynamoDB, Snowflake, Neo4j, InfluxDB, Elasticsearch, etc.). Includes a selection criteria matrix, requirements checklist, common decision patterns by application type (e-commerce, IoT, social media, analytics, global SaaS), and migration strategies. Use alongside [tech-decision-guide.md](./references/tech-decision-guide.md) — this reference goes deeper on the full DB landscape beyond the SQL/NoSQL split.

#### Database design scripts

- `scripts/schema_analyzer.py` — analyzes SQL DDL or JSON schema for normalization violations (1NF–BCNF), missing constraints (FK, NOT NULL, UNIQUE), data type issues, naming convention violations, missing indexes on FK columns, and generates Mermaid ERD diagrams. Usage: `python scripts/schema_analyzer.py --input schema.sql --output-format json --generate-erd`
- `scripts/index_optimizer.py` — takes a schema + query patterns file and recommends optimal indexes, detects redundant/overlapping indexes, estimates selectivity, and emits prioritized `CREATE INDEX` SQL. Usage: `python scripts/index_optimizer.py --schema schema.json --queries queries.json --format text`
- `scripts/migration_generator.py` — diffs two schema JSON files and generates ordered migration steps with forward SQL, rollback SQL, and validation queries; supports the expand-contract (zero-downtime) pattern. Usage: `python scripts/migration_generator.py --current current_schema.json --target target_schema.json --zero-downtime`

Read [backend-security-node.md](./references/backend-security-node.md) when writing Node.js/Express backend code that touches authentication, authorization, input handling, or HTTP responses — OWASP Top 10 mitigations (broken access control, cryptographic failures, injection, SSRF), Zod schema validation middleware, SQL injection prevention (parameterized queries, ORM safety), XSS prevention (CSP via helmet, Content-Type headers), bcrypt password storage, JWT best practices (RS256, short-lived access tokens, rotation), RBAC authorization middleware, security headers (helmet + CORS config), startup secrets validation, and pino redaction for sensitive fields. For comprehensive security audits, threat modeling, and STRIDE analysis, use the `quality-assurance` skill instead. Use alongside `scripts/api_scaffolder.py` to generate route handlers with validation middleware already wired.

### Frontend execution

Read [frontend-development.md](./references/frontend-development.md) for framework boundary detection, reusable component design, UI implementation, refactor workflow, async UX, accessibility, responsive quality, performance priorities, analytics, and automation scripts (component generator, bundle analyzer, frontend scaffolder).

### React patterns and hooks

Read [react-patterns.md](./references/react-patterns.md) for concrete implementations of: compound components, render props, HOCs, custom hooks (useAsync, useDebounce, useLocalStorage, useMediaQuery, usePrevious), Context+Reducer state management, Zustand, React.memo with custom comparison, useCallback/useMemo, list virtualization, error boundaries, and anti-patterns (inline objects, index keys, derived state via useEffect, direct state mutation).

### No direct useEffect

Read [no-use-effect.md](./references/no-use-effect.md) whenever writing or reviewing React components — especially in agentic contexts where `useEffect` gets added defensively. The rule: never call `useEffect` directly; use `useMountEffect` (an explicit empty-dep wrapper) only for genuine external-system sync. Contains the five replacement patterns with bad/good examples and smell tests: (1) derive state inline instead of syncing it via effects, (2) use a data-fetching library (React Query, SWR) instead of effect-based fetching, (3) put user-triggered work in event handlers not effects, (4) use `useMountEffect` with conditional mounting for one-time external sync, (5) reset component state with `key` instead of dependency choreography. Also covers enforcement via ESLint `no-restricted-syntax` and `AGENTS.md` guidance for agents. Backed by React's own ["You Might Not Need an Effect"](https://react.dev/learn/you-might-not-need-an-effect) guide.

### Next.js performance optimization

Read [nextjs-optimization-guide.md](./references/nextjs-optimization-guide.md) for rendering strategy config (`force-static`, `force-dynamic`, `revalidate`), streaming with Suspense, image optimization patterns, dynamic imports with loading skeletons, parallel routes, `Promise.all` data fetching, fetch cache options, `unstable_cache`, bundle analysis with `@next/bundle-analyzer`, tree-shaking, and Core Web Vitals optimization (LCP priority images, CLS prevention, INP with deferred scripts, `useReportWebVitals`).

### Frontend best practices

Read [frontend-best-practices.md](./references/frontend-best-practices.md) for: TypeScript patterns (discriminated unions for state machines, generic components, type guards, polymorphic `as` prop, extending HTML attributes), Tailwind CSS with CVA (`class-variance-authority` variant system), feature-based project structure, barrel exports, and security (XSS prevention with DOMPurify, input validation with Zod + React Hook Form, keeping secrets server-side via Route Handlers).

### UI constraints and patterns

Read [ui-constraints.md](./references/ui-constraints.md) for hard MUST/NEVER/SHOULD rules covering stack defaults (Tailwind, motion/react, cn), accessible component primitives, interaction patterns (AlertDialog, skeletons, h-dvh, safe-area-inset), animation budget and compositor-only rules, typography helpers (text-balance, tabular-nums), layout conventions (z-index scale, size-*), performance guards, text layout & measurement (when to use `@chenglou/pretext` instead of `getBoundingClientRect` loops), and design constraints (no unsolicited gradients, one accent color, empty-state affordances). Apply these on top of frontend-development.md whenever touching UI code.

### Design engineering and animation craft

Read [design-engineering.md](./references/design-engineering.md) when the task involves animation decisions, interaction polish, UI review feedback, component building, gesture interactions, or perceived performance. Covers the animation decision framework (should animate? easing? duration?), spring animations, CSS transform mastery, clip-path techniques, gesture and drag patterns, hardware acceleration, accessibility (prefers-reduced-motion), stagger animations, exit animations with AnimatePresence (modes, nested presence, useIsPresent), container animation (two-div pattern, ResizeObserver), morphing icons (three-line SVG system), and debug workflows. Use alongside ui-constraints.md: constraints define the hard rules; this reference provides the craft depth and the before/after review format.

### Cinematic and immersive web design (epic-design)

Read the `references/epic-design/` folder when the task involves building a cinematic, immersive, or 2.5D website — scroll storytelling, parallax depth, GSAP scroll animations, text that lights up word-by-word, sections that overlap or transition cinematically, floating products between sections, clip-path reveals, curtain drops, iris opens, or any effect described as "Apple-style", "premium", "alive", or "scrollytelling". This workflow is distinct from `design-engineering.md` (which covers general animation decisions and micro-interactions) — it provides a complete 45-technique catalogue for production-quality cinematic experiences with a mandatory asset-inspection and depth-assignment workflow.

Trigger when the user says: "make it feel alive", "Apple-style animation", "sections that overlap", "product rises between sections", "immersive", "scrollytelling", or requests any scroll-driven visual effect. Use aggressively for ANY web design task where premium scroll craft applies.

Before writing any code:
1. Run `scripts/inspect-assets.py` on every image asset — determine format, background status, depth assignment, and whether background removal is actually needed.
2. Assign every element to a depth level (0–5) from `references/epic-design/depth-system.md`.
3. Choose techniques from `references/epic-design/motion-system.md` (9 scroll patterns) and `references/epic-design/text-animations.md` (13 text techniques).
4. Apply mandatory accessibility and performance rules from `references/epic-design/accessibility.md` and `references/epic-design/performance.md` — every output must have `prefers-reduced-motion` and only animate GPU-safe properties.
5. Validate the finished output with `node scripts/validate-layers.js path/to/index.html`.

| File | When to read |
|------|-------------|
| `references/epic-design/asset-pipeline.md` | ALWAYS — inspect every image before coding; background judgment rules and user notification format |
| `references/epic-design/depth-system.md` | Every project — 6-layer depth model (parallax speed, blur, scale, shadow per level) |
| `references/epic-design/motion-system.md` | When building scroll interactions — 9 GSAP scroll architecture patterns with full code |
| `references/epic-design/text-animations.md` | When animating any text — 13 techniques (split converge, word lighting, masked reveals, etc.) |
| `references/epic-design/directional-reveals.md` | Sections with directional entry: top-drop, iris open, curtain roll, diagonal peel |
| `references/epic-design/inter-section-effects.md` | Elements that persist, float, or travel across section boundaries |
| `references/epic-design/performance.md` | ALWAYS — GPU compositor rules, will-change lifecycle, IntersectionObserver patterns |
| `references/epic-design/accessibility.md` | ALWAYS — prefers-reduced-motion (mandatory), WCAG 2.1 AA, ARIA for decorative elements |
| `references/epic-design/examples.md` | When the user needs a full-page site — 5 complete implementation blueprints |

### Comprehensive UI/UX guidelines

Read [ui-ux-guidelines.md](./references/ui-ux-guidelines.md) when designing new pages or components, reviewing UI for quality, accessibility, or usability, choosing styles, typography, or color palettes, implementing navigation patterns or forms, adding chart/data visualization, adding audio feedback or sound synthesis, implementing prefetching strategies, or when the task changes how a feature looks, feels, moves, or is interacted with. Contains 12 priority-ordered rule categories (accessibility, touch & interaction, performance, style selection, layout, typography & color, animation, forms & feedback, navigation patterns, charts & data, audio feedback + sound synthesis, predictive prefetching) synthesized from Apple HIG, Material Design 3, WCAG, and Laws of UX. Use alongside `ui-constraints.md` (Tailwind/React hard rules) and `design-engineering.md` (animation craft).

### Web interface guidelines review

Read [web-design-guidelines.md](./references/web-design-guidelines.md) when the user asks to review UI code, audit design, check accessibility, or validate a page against best practices. This procedure fetches the live Web Interface Guidelines ruleset and applies it to the target files, emitting findings in `file:line` format. Run alongside ui-constraints.md and ui-ux-guidelines.md for a full UI audit.

### Design consultation (create design system from scratch)

Read [design-consultation.md](./references/design-consultation.md) when the user asks for a design system, brand guidelines, "create DESIGN.md", or is starting a new project with no existing visual direction. Runs a six-phase conversational workflow (pre-checks → product context → optional research → full proposal with SAFE/RISK breakdown → drill-downs → HTML preview → DESIGN.md + CLAUDE.md update). Contains the aesthetic direction catalog, recommended and blacklisted fonts, deliverables checklist, and all key principles (propose don't menu, coherence over individual optimization, no AI slop). Distinct from design-critique.md (feedback on existing designs) and design-system.md (auditing or extending an existing system).

### Design critique

Read [design-critique.md](./references/design-critique.md) when the user shares a Figma URL, screenshot, or design description and asks for feedback — "review this design", "critique this mockup", "what do you think of this screen?". Contains the five-dimension critique framework (first impression, usability, visual hierarchy, consistency, accessibility), severity-graded output format, and guidance on matching feedback depth to the design stage (exploration vs. final polish). Use alongside design-engineering.md for animation and interaction findings, and pre-shipping-polish.md for the final quality pass.

### Live site design audit and fix

Read [design-review.md](./references/design-review.md) when the user asks to "audit the design", "visual QA", "check if it looks good", or "design polish" on a running site (local dev server or production URL). This is distinct from design-critique.md (Figma/screenshot feedback) and web-design-guidelines.md (code-level rules check). This workflow browses the live site, takes screenshots, grades it across 10 categories (visual hierarchy, typography, color, spacing, interaction states, responsive design, motion, microcopy, AI slop detection, performance as design) with dual A–F scores (Design Score and AI Slop Score), then iteratively fixes source code issues with one atomic commit per fix, verified by before/after screenshot pairs. Supports full, quick (`--quick`), deep (`--deep`), diff-aware (feature branches), and regression modes. Hard cap of 30 fixes with a risk heuristic to self-regulate. Requires a clean working tree before starting.

### Design system audit, documentation, and extension

Read [design-system.md](./references/design-system.md) when the task is about the design system itself rather than a specific feature: auditing naming inconsistencies or hardcoded values across components, documenting a component's variants/states/props/accessibility notes, or designing a new pattern that fits the existing system. Provides three structured modes (audit / document / extend) with scored output tables and output templates. Use alongside shadcn.md for component CLI/theming and building-components.md for API design when extending the system.

### shadcn/ui components

Read [shadcn.md](./references/shadcn.md) when the task involves adding, searching, fixing, debugging, styling, or composing shadcn/ui components; when working with `components.json`, preset codes, or a custom component registry; when initializing a new project with `npx shadcn@latest init`; or when updating existing components while preserving local changes. Contains critical rules (styling, forms, composition, icons, base-vs-radix), the full CLI reference, theming and CSS variable guidance, the component selection table, the smart-merge update workflow, and an MCP server reference for AI-assisted registry operations.

### Component refactoring

Read [component-refactoring.md](./references/component-refactoring.md) when the task is specifically to reduce component complexity, split a large component, extract hooks, consolidate modal state, simplify conditional logic, or restructure a component's directory layout. Use alongside frontend-development.md for the broader delivery context.

### Building reusable components and libraries

Read [building-components.md](./references/building-components.md) when the task is to design a component API, build a component library or primitive, implement accessibility patterns (ARIA, keyboard nav, focus management), choose between controlled and uncontrolled state, use composition patterns (compound components, asChild, polymorphism, boolean-prop avoidance, state/actions/meta provider pattern, children over render props, explicit variant components), set up styling systems (cn, CVA, design tokens, data-state, data-slot), decide on a distribution strategy (registry, npm, marketplace), or apply React 19 API changes (ref as prop, use() instead of useContext()).

### Code scaffolding (Cloush stack)

Read [code-scaffolding.md](./references/code-scaffolding.md) when the task is to create a new Django app, generate models, serializers, viewsets, or URL routing, scaffold frontend TypeScript types or Zod schemas, or produce test stubs for the Cloush Django/DRF + Next.js stack. Follows Cloush conventions: `SearchDetailModel`, `AccessControlSerializerMixin`, `UnifiedAccessChecker`.

### React and Next.js performance rules

Read [react-performance-rules.md](./references/react-performance-rules.md) when writing, reviewing, or refactoring React or Next.js code — especially when the task involves data fetching, bundle optimization, re-render churn, or rendering cost. Contains 45 rules across 8 priority tiers with the critical patterns (waterfall elimination, barrel imports, `React.cache()`, `Promise.all`) inlined and individual rule files with code examples in [react-rules/](./references/react-rules/).

### Next.js best practices

Read [next-best-practices.md](./references/next-best-practices.md) when writing or reviewing Next.js code. Covers file conventions, RSC boundaries, async API patterns (params, searchParams, cookies, headers), runtime selection (Node.js vs Edge), directives (`'use client'`, `'use server'`, `'use cache'`), functions (useRouter, useSearchParams, generateStaticParams), error handling (error.tsx, redirect, notFound, unstable_rethrow), data patterns (Server Components vs Server Actions vs Route Handlers, waterfall avoidance), route handlers, metadata and OG images, image optimization (next/image), font optimization (next/font), bundling issues (server-incompatible packages, ESM/CommonJS), scripts (next/script), hydration errors, Suspense boundaries, parallel and intercepting routes, self-hosting (Docker, ISR cache handlers), and debug tricks. Individual detail files in [next-best-practices/](./references/next-best-practices/). Use alongside react-performance-rules.md for performance concerns.

### Self-improvement and pattern learning

Read [self-improvement.md](./references/self-improvement.md) when the session ends and patterns should be consolidated, when a skill produced an incorrect outcome, when a recurring pattern (3+ occurrences) should be promoted into permanent reference guidance, or when the user asks to "self-improve", "learn from today", or "analyze this session". Uses a multi-memory architecture (semantic patterns, episodic experiences, working session state) with evolution and correction markers for traceability.

### Autonomous reference optimization (autoimprove)

Read [autoimprove.md](./references/autoimprove.md) when the user says "run autoresearch on [reference]", "autoimprove", "optimize this skill autonomously", or when a reference has a known recurring quality problem (same failure pattern 3+ times). Implements Karpathy's autoresearch loop: define a 3–6 item binary checklist, establish a baseline pass rate, then iterate — change one thing, test, keep if score improves, revert if not — until 95%+ pass rate is reached on 3 consecutive rounds. Produces an improved reference copy, a round-by-round changelog, and a machine-readable results log.

### Skill extraction (claudeception)

Read [skill-extraction.md](./references/skill-extraction.md) when a task produced non-obvious knowledge worth preserving as a reusable skill; the user says "save this as a skill", "extract a skill", or "what did we learn?"; `/claudeception` is invoked; or debugging required significant investigation with a non-obvious root cause. Creates new `SKILL.md` files in `.claude/skills/` or `~/.claude/skills/` — growing the skill library rather than updating existing references. Includes a decision matrix (create / update / add variant), a web-research step before writing, quality gates, and a versioning convention.

### Continual learning — maintaining CLAUDE.md / AGENTS.md memory

Read [continual-learning.md](./references/continual-learning.md) when the user asks to "update memory", "mine prior sessions", "keep CLAUDE.md current", or "run continual learning"; or when the cadence gate fires (≥10 completed turns AND ≥120 min since last run AND transcript has advanced). Incrementally mines transcript deltas for durable user preferences and stable workspace facts, writes them as plain bullets to the two learned sections of `CLAUDE.md` / `AGENTS.md`, and refreshes the transcript index. Delegates mining and writing to the `agents-memory-updater` subagent (`references/agents/agents-memory-updater.md`).

### Repo-local learning system (learning/ folder)

Read [learning-system.md](./references/learning-system.md) when the user says "save what we learned", "extract lessons", "mine this session", or wants a `learning/` folder that stores engineering knowledge as items, episodes, decision-traces, triples, lessons, collections, procedures, and beliefs. Operates a 4-step loop (orient → capture → consolidate → promote). Supporting references: [learning-folder-structure.md](./references/learning-folder-structure.md), [learning-extraction-patterns.md](./references/learning-extraction-patterns.md), [learning-promotion.md](./references/learning-promotion.md), [learning-knowledge-graph.md](./references/learning-knowledge-graph.md), [learning-repo-adaptation.md](./references/learning-repo-adaptation.md). Scripts in `scripts/` handle init, capture, scan, and refresh. When promoting `learning/` artifacts to human-readable docs, use `docs/memories/` — placement rules defined in the `code-documentation` skill.

### Documentation placement

When writing to `docs/` — logs, lessons, facts, procedures, fixes, audits, plans, specs, or cookbook guides — follow the `code-documentation` skill. That skill owns the `docs/` folder structure and format templates. The key structure: `docs/memories/<type>/YYYY/MM-DD/*.md` for all memory artifacts, `docs/audits/YYYY/MM-DD/` for comprehensive reports, `docs/plans/YYYY/MM-DD/` and `docs/specs/YYYY/MM-DD/` for implementation work. Do not invent new top-level `docs/` directories.

### Data engineering and AI/ML pipelines

Route all data pipeline, data modeling, DataOps, and ML infrastructure tasks to the `ai-engineering` skill. It owns the full data/AI engineering surface:

| Task | Where to go in `ai-engineering` |
|------|----------------------------------|
| Choose batch vs. streaming, Lambda vs. Kappa | Architecture Decision Framework in `SKILL.md` |
| Design a pipeline (Airflow, Spark, Kafka, Flink) | `references/data-pipeline-architecture.md` |
| Data modeling (Star schema, SCD, Data Vault, dbt) | `references/data-modeling-patterns.md` |
| Data quality, contracts, CI/CD, lineage, cost | `references/dataops-best-practices.md` |
| End-to-end worked examples (ETL, streaming, quality) | `references/data-workflows.md` |
| Troubleshoot Airflow, Spark, duplicates, schema drift | `references/data-troubleshooting.md` |
| Generate Airflow/Prefect/Dagster pipeline config | `scripts/pipeline_orchestrator.py` |
| Validate data quality (completeness, freshness) | `scripts/data_quality_validator.py` |
| Analyze and optimize SQL or Spark job performance | `scripts/etl_performance_optimizer.py` |

Before touching any data pipeline, warehouse schema, streaming topology, or data contract, load the relevant `ai-engineering` reference.

### Cloud infrastructure and DevOps

Route all cloud and infrastructure tasks to the `cloud-management` skill. It owns the full cloud surface across AWS, Azure, and GCP:

| Task | Where to go in `cloud-management` |
|------|-----------------------------------|
| Identify which cloud(s) the repo uses | `detect_repo_stack.py` + `references/provider-selection.md` |
| Choose a deployment strategy (rolling, blue/green, canary) | `references/deployment-strategies.md` |
| Bootstrap CI pipeline YAML (lint/test/build) from stack signals | `scripts/stack_detector.py` → `scripts/pipeline_generator.py` (this skill) |
| Scaffold cloud deploy stages (OIDC, image push, rolling/blue-green) | `scripts/pipeline_generator.py` (cloud-management) |
| Scaffold Terraform/OpenTofu modules | `scripts/terraform_scaffolder.py` |
| Plan a deployment with health gates and rollback | `scripts/deployment_manager.py` |
| Wire automatic deployments (OIDC, immutable artifacts) | `references/cicd-and-auto-deploy.md` |
| Provision new cloud resources or services | Task Router → "Deploy New Resources" section |
| Inventory, optimize, or right-size infrastructure | `references/inventory-optimization-remediation.md` |
| Diagnose and repair cloud failures | Task Router → "Diagnose and Fix Cloud Errors" section |
| Assess change risk before applying | `scripts/cloud_change_guard.py` + `references/approval-policy.md` |

Before touching any infra-sensitive path (IaC, CI/CD credentials, DNS, networking, IAM), load the relevant `cloud-management` reference. The approval model always applies: request permission before high-cost, destructive, ingress-changing, or org-scope operations.

### Security work

Route all security tasks to the `quality-assurance` skill. It owns the full security surface — from architecture design to testing to automated scanning:

| Task | Where to go in `quality-assurance` |
|------|-------------------------------------|
| Threat model a component or repo | `threat-modeling` section → STRIDE + DREAD workflow |
| Design secure architecture (Zero Trust, defense-in-depth) | `references/security-architecture-patterns.md` |
| Choose or audit cryptographic algorithms | `references/cryptography-implementation.md` |
| STRIDE automation or secret scanning | `scripts/threat_modeler.py`, `scripts/secret_scanner.py` |
| Full 15-phase security audit (CSO mode) | `Comprehensive security audit` section |
| Write secure code (framework-specific) | `references/security-best-practices/<stack>-security.md` |
| Extract security requirements from a threat model | `references/security-requirements.md` |
| Add security tests (auth, IDOR, injection, headers) | `references/security-testing.md` |
| Active penetration testing (staging only) | `references/pentesting-shannon.md` |
| Claude Code config security scan | `Claude Code configuration security scan` section |

Before touching any security-sensitive code (auth, crypto, input handling, permissions, secrets), load the relevant `quality-assurance` reference. Passive security review is always on: flag critical or high-severity issues encountered while working on any task.

### Pre-shipping polish

Read [pre-shipping-polish.md](./references/pre-shipping-polish.md) when the feature is functionally complete and needs a final quality pass before shipping. Covers visual alignment and spacing, typography refinement, color and contrast, all interaction states (hover/focus/active/disabled/loading/error/success), micro-interactions and transitions, content and copy consistency, icons and images, forms and inputs, edge cases and error states, responsiveness, performance, and code hygiene. Includes a full polish checklist and final verification steps. Use after `ui-constraints.md` and `design-engineering.md` for a complete pre-ship review.

### Land, merge, and deploy

Read [land-and-deploy.md](./references/land-and-deploy.md) when the user asks to merge, land, or deploy a PR. Covers: platform detection, pre-merge readiness gate (reviews, tests, docs, PR accuracy), Test Failure Ownership Triage (classifying in-branch vs pre-existing failures, solo vs collaborative response), merge via `gh pr merge`, CI wait, deploy strategy detection (GitHub Actions, Fly, Render, Vercel, Netlify, Heroku, Railway), staging-first option, canary verification, the Verification Gate (Iron Law: no completion claims without fresh verification evidence), revert procedure, and the final deploy report. Distinct from `collaboration-and-git.md` (which covers branching and PR creation) — this reference handles everything from merge to production verified.

### Release management

Read [conventional-commits.md](./references/conventional-commits.md) when writing commit messages, setting up commit linting, configuring automated changelogs, or explaining the conventional commit spec to the team. Contains the full type vocabulary (feat, fix, build, ci, docs, perf, refactor, style, test, chore, revert), breaking change syntax (`!` and `BREAKING CHANGE:` footer), scope naming conventions, multi-paragraph body format, tooling setup (commitizen, commitlint), and CI/CD integration with semantic-release, standard-version, and release-please. Use alongside [collaboration-and-git.md](./references/collaboration-and-git.md) for the broader commit and branch workflow.

Read [release-workflow-comparison.md](./references/release-workflow-comparison.md) when choosing a branching strategy or explaining the trade-offs between Git Flow, GitHub Flow, and Trunk-based Development. Contains a feature matrix (complexity, deployment frequency, branch lifetime, CI/CD requirements), branch structure diagrams, step-by-step command sequences for each model, release strategy examples per workflow, anti-patterns to avoid, and migration pathways between models. Use the decision matrix as the starting point: 10+ devs / scheduled releases → Git Flow; 3–10 devs / continuous deployment → GitHub Flow; expert team / multiple daily deploys + feature flags → Trunk-based.

Read [hotfix-procedures.md](./references/hotfix-procedures.md) when a critical production issue requires an emergency release outside the normal cycle. Covers severity tiers (P0 critical: 2h SLA, P1 high: 24h SLA, P2 medium: next regular cycle), step-by-step hotfix workflows for Git Flow, GitHub Flow, and Trunk-based, emergency response phases (detection → team assembly → investigation → fix → deploy → verification), communication templates, rollback procedures, post-deployment monitoring scripts, and the post-incident review format.

### Verification and completion

Read [verification-and-finish.md](./references/verification-and-finish.md) before declaring success, opening or merging a PR, or cleaning up a branch or worktree.

## Standard Execution Loop

1. Orient: inspect repo instructions, architecture, git state, and current task context. Discover by reading the codebase and `docs/` before making assumptions.
2. Classify: decide whether this is implementation, architecture analysis, debugging, review, refactor, instrumentation, or release work.
3. Anchor: find the existing owner of the behavior and the minimal safe change surface. Identify any global utilities or base files that should be extended rather than duplicated.
4. Implement: make the smallest coherent change that solves the right problem, not just the nearest symptom. Apply senior/principal engineering standards — highest quality that fits the codebase, not just minimum viable.
5. Verify: run the focused proof first, then any broader regression evidence the repo or user expects. Keep tests updated — follow the `quality-assurance` skill for test strategy, coverage, anti-patterns, and all security work (threat modeling, secure architecture, cryptography, OWASP review).
6. Compound: surface follow-up risks, rollout notes, and cleanup the next engineer will need. Keep documentation updated — follow the `code-documentation` skill for placement and format inside `docs/`. Do not leave the repo with stale docs or failing tests after a behavioral change.

## Skill Orchestration

If the current environment exposes more specialized skills, route work through them instead of bloating this skill:

- Use `create-plan` when the user explicitly asks for a plan.
- Use `cloud-management` for all cloud infrastructure and DevOps work: provisioning, cloud-specific CI/CD deploy-stage scaffolding (`scripts/pipeline_generator.py` in that skill), IaC module generation (`scripts/terraform_scaffolder.py`), deployment orchestration with health gates and rollback (`scripts/deployment_manager.py`), multi-cloud provider selection, deployment strategy selection (rolling, blue/green, canary), cost optimization, and cloud incident repair. Run `detect_repo_stack.py` first to identify the cloud surface, then load the relevant references. For bootstrapping a baseline CI pipeline (lint/test/build) use `scripts/stack_detector.py` + `scripts/pipeline_generator.py` in this skill first, then hand off deploy stages to cloud-management.
- Use `quality-assurance` when verification strategy, flaky tests, review findings, or CI triage becomes the bottleneck. Also use `quality-assurance` `references/testing-anti-patterns.md` when writing mocks, adding test utilities, or reviewing test code for mock misuse or test-only methods bleeding into production classes.
- Use `scripts/coverage_analyzer.py` to parse LCOV/JSON/XML coverage reports and identify P0/P1/P2 gaps. Use `scripts/tdd_workflow.py` to validate RED/GREEN/REFACTOR phase completion. Use `scripts/fixture_generator.py` to generate boundary-value test data and mock schemas. Full usage: `python scripts/<name>.py --help`.
- Use `scripts/api_scaffolder.py` to generate Express/Fastify/Koa route handlers, validation middleware, and TypeScript types from an OpenAPI spec or database schema — or to reverse-generate an OpenAPI spec from existing routes. Use `scripts/database_migration_tool.py` to analyze a PostgreSQL schema for missing indexes, N+1 risks, and optimization opportunities, and to generate or dry-run migration files. Use `scripts/api_load_tester.py` to load test API endpoints with configurable concurrency and duration, measuring P50/P95/P99 latency, throughput, and error rates — including endpoint comparison and rate-limit verification. Full usage: `python scripts/<name>.py --help`.
- Use `scripts/prompt_optimizer.py` to analyze prompt token count, clarity score, structure score, and ambiguity issues — and generate optimized versions or extract few-shot examples. Use `scripts/rag_evaluator.py` to measure context relevance, answer faithfulness, and groundedness in RAG systems, with comparison against a baseline report. Use `scripts/agent_orchestrator.py` to validate agent YAML/JSON configs, generate ASCII or Mermaid workflow diagrams, and estimate token costs per run. Full usage: `python scripts/<name>.py --help`.
- Use `quality-assurance` for ALL security work: threat modeling (`references/threat-modeling/`), secure architecture design (`references/security-architecture-patterns.md`), cryptography selection and implementation (`references/cryptography-implementation.md`), STRIDE automation (`scripts/threat_modeler.py`), secret scanning (`scripts/secret_scanner.py`), OWASP-aligned code review (`references/security-best-practices/`), security testing (`references/security-testing.md`), comprehensive security audits (CSO mode), and penetration testing (`references/pentesting-shannon.md`). Never implement security-sensitive code without first consulting the relevant `quality-assurance` reference.
- Use [interface-design.md](./references/interface-design.md) when designing a new module or API and the right shape is unclear — spawns parallel sub-agents with divergent constraints to generate 3+ radically different designs, then compares and synthesizes. Invoke before implementing any interface that will be hard to change once callers exist.
- Use `gh-address-comments` for GitHub review-thread triage and inline replies.
- Use `gh-fix-ci` when GitHub Actions checks are failing.
- Use [self-improvement.md](./references/self-improvement.md) at session end or after errors to extract patterns and keep reference guidance up to date. Templates live in `templates/` and accumulated patterns in `memory/semantic-patterns.json`.
- Use [autoimprove.md](./references/autoimprove.md) for autonomous, batch optimization of a specific reference — define a binary checklist, let the agent iterate unattended, ship only after reviewing the diff and score improvement.
- Use [skill-extraction.md](./references/skill-extraction.md) to create new `SKILL.md` files from session learnings — invoked via `/claudeception`, "save this as a skill", or after any non-obvious debugging. Use `templates/new-skill-template.md` as the scaffold.
- Use [continual-learning.md](./references/continual-learning.md) to keep `CLAUDE.md` / `AGENTS.md` current with durable user preferences and workspace facts mined from transcript deltas. Cadence-gated (≥10 turns, ≥120 min, transcript advanced). Delegates to `references/agents/agents-memory-updater.md`.
- Use [learning-system.md](./references/learning-system.md) for the repo-local `learning/` folder system — 8 artifact types (items → episodes → triples → lessons → collections → procedures → beliefs), 4-step operating loop, and promotion into identity/doc files. Scripts: `scripts/init-learning.sh`, `scripts/capture-item.py`, `scripts/scan-learning.py`, `scripts/refresh-learning.py`. When promoting to human-readable docs, write to `docs/memories/` (see `code-documentation` skill for format and placement rules).
- Use the `code-documentation` skill whenever writing any documentation to the repo — logs, lessons, facts, procedures, fixes, audits, plans, specs, cookbook guides, or service docs. That skill owns `docs/` folder structure, naming conventions, and format templates.
- Use [land-and-deploy.md](./references/land-and-deploy.md) when the user says "merge", "land", "deploy", "ship it to production", or similar. The reference covers the full sequence from pre-merge readiness gate through canary verification and revert strategy.
- Use dedicated component-building, frontend-design, browser-testing, observability, analytics, or release skills when they exist. Otherwise, use the references in this skill. For design system work at the system level (auditing token coverage, naming consistency, or component completeness; documenting component variants and states; or proposing a new pattern), use [design-system.md](./references/design-system.md). For shadcn/ui component work (adding components, CLI operations, styling rules, forms, composition, theming, preset management), use [shadcn.md](./references/shadcn.md). For component complexity reduction specifically, use [component-refactoring.md](./references/component-refactoring.md). For building reusable components or libraries (API design, a11y patterns, composition, boolean-prop avoidance, state/actions/meta provider pattern, explicit variants, children over render props, React 19 APIs, styling systems, distribution), use [building-components.md](./references/building-components.md). For comprehensive UI/UX guidelines (12 priority categories: accessibility, touch, performance, style, layout, typography, animation, forms, navigation, charts, audio feedback + sound synthesis, predictive prefetching — synthesized from Apple HIG, Material Design, WCAG, and Laws of UX), use [ui-ux-guidelines.md](./references/ui-ux-guidelines.md). For UI compliance reviews, design audits, or accessibility checks against the official Web Interface Guidelines, use [web-design-guidelines.md](./references/web-design-guidelines.md). For creating a new design system from scratch (brand guidelines, DESIGN.md, aesthetic direction, typography, color, spacing, motion — six-phase conversational workflow), use [design-consultation.md](./references/design-consultation.md). For structured design critique of Figma designs, screenshots, or mockups (first impression, usability, hierarchy, consistency, accessibility, severity-graded output), use [design-critique.md](./references/design-critique.md). For live site design audits on a running URL — 10-category visual checklist, AI slop detection, dual A–F scoring, atomic CSS-first fix commits with before/after screenshots — use [design-review.md](./references/design-review.md). For React and Next.js performance review (waterfalls, bundle size, re-render churn, server-side caching), use [react-performance-rules.md](./references/react-performance-rules.md). For the `useEffect` discipline rule (ban direct `useEffect`, five replacement patterns, `useMountEffect` wrapper, ESLint enforcement), use [no-use-effect.md](./references/no-use-effect.md). For Next.js file conventions, RSC boundaries, async APIs, data patterns, error handling, metadata, image/font optimization, bundling, hydration errors, Suspense, and self-hosting, use [next-best-practices.md](./references/next-best-practices.md). For animation decisions, interaction polish, gesture patterns, or UI review feedback (before/after table format), use [design-engineering.md](./references/design-engineering.md). For the final pre-shipping quality pass (alignment, spacing, interaction states, copy, edge cases, checklist), use [pre-shipping-polish.md](./references/pre-shipping-polish.md).

## Hooks

This skill ships three hooks. Wire them in Claude Code settings (`~/.claude/settings.json`), replacing `/absolute/path/to/agentic-development` with the actual path.

### Completion gate — `hooks/check-completion.sh`

Blocks premature stopping and forces a final pass over the original request, plan or spec state, verification evidence, recent errors, and integration cleanup.

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "/absolute/path/to/agentic-development/hooks/check-completion.sh",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

Set `AGENTIC_DEV_MAX=0` for no continuation cap, or any positive integer to limit repeated stop interceptions.

### Tool logging and error capture

`hooks/pre-tool.sh` logs every `Bash`, `Write`, and `Edit` invocation to stderr.
`hooks/post-bash.sh` captures non-zero exit codes into `memory/working/last_error.json` for the self-improvement loop.
`hooks/session-end.sh` writes `memory/working/session_end.json` so the self-improvement phase knows the session is complete.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/pre-tool.sh \"$TOOL_NAME\" \"$TOOL_INPUT\""
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/post-bash.sh \"$TOOL_OUTPUT\" \"$EXIT_CODE\""
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "/absolute/path/to/agentic-development/hooks/check-completion.sh",
            "timeout": 10
          },
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/session-end.sh"
          }
        ]
      }
    ]
  }
}
```

## Dynamic Skill Content

Skills can inject live shell output directly into the prompt at invocation time using the `!`command`` syntax embedded in `SKILL.md`:

```markdown
Current git branch: !`git branch --show-current`
Detected stack: !`cat detected-stack.json 2>/dev/null || echo "not yet generated"`
```

Claude Code runs the command when the skill is invoked, replaces the placeholder inline, and the model only ever sees the result — not the raw placeholder.

**Requirements:**

- The skill's frontmatter must declare `allowed-tools` listing every tool the embedded command needs. Without it the placeholder is left unexpanded.
- Declare the minimal surface: `allowed-tools: Bash` for general shell, or `Bash(git log)` to scope to a single command.

```yaml
---
name: my-skill
description: Use when ...
allowed-tools: Bash(git log --oneline -10), Bash(cat package.json)
---
```

**Security model — treat like postinstall scripts:**

- The command runs with the same permissions as the current shell session.
- Anything that can run in a postinstall hook can run here: network calls, file writes, credential reads.
- Audit every `!`...`` expression before installing a skill from an external source.
- Prefer read-only introspection commands (git, cat, jq, node -e) over commands that mutate state or download content.
- If the skill downloads external content, verify the source the same way you would verify a dependency.

**Common patterns:**

| Use case | Example expression |
|----------|--------------------|
| Current branch | `!`git branch --show-current`` |
| Recent commits | `!`git log --oneline -5`` |
| Detected stack | `!`node -e "console.log(require('./package.json').dependencies ? 'node' : 'unknown')"`` |
| Env flag | `!`echo ${CI:-local}`` |
| File existence check | `!`test -f .env && echo ".env present" || echo ".env missing"`` |

**When to use:**

- Inject context that changes per repo or per session (branch name, stack, env flags, last migration state).
- Surface file-existence checks so the model can skip or branch without a separate tool call.
- Pre-compute expensive discovery so it runs once at skill load rather than inline during reasoning.

**When not to use:**

- Do not embed commands that write files, make network requests to external services, or have side effects — those belong in hooks or explicit tool calls where the user can see and approve them.
- Do not use for content that should stay secret; command output is injected into the prompt in plaintext.
