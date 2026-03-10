# Backend Development

Start by identifying where this backend expects business logic to live. Do not impose a generic architecture on a repo that already has strong patterns.

## First Pass

Before editing backend code, answer these questions:

1. What are the entrypoints for this behavior: HTTP, RPC, CLI, webhook, queue, scheduler, or signal?
2. Where does the repo expect business rules, state transitions, and side effects to live?
3. Which models, schemas, repositories, or services already own this concept?
4. What async, cache, auth, tenancy, rate-limit, or logging boundaries must remain intact?
5. What command, test, or manual scenario will prove the change works, and does repo policy allow running it automatically?

## Owning Layer

- Keep transport layers thin. Controllers, views, handlers, and serializers should validate, delegate, and return.
- Put business rules, side effects, and orchestration in the repo's existing service, use-case, or domain layer.
- Reuse models, relations, and shared utilities before adding new tables, schemas, or service classes.
- Prefer one canonical path for a behavior instead of near-duplicate endpoints or helpers.
- Keep background work on the existing queue, job, scheduler, or event system.
- Log at important boundaries and failure points with the repo's current logging approach.

## Data Model and Schema Bias

Before adding a new table, model, collection, field, or index, ask whether an existing entity or relation can carry the concept cleanly.

When the repo already prefers generalized models:

- favor reuse over new entity sprawl
- prefer relations over repeated fields
- use typed metadata or JSON fields only when validation remains clear
- centralize mixins and shared base behavior

When the repo prefers strict, explicit schemas, follow that instead.

Preserve the repo's conventions for IDs, timestamps, soft delete, tenancy, audit, search, and lifecycle state. Schema changes should ship with a migration and rollout plan proportionate to the risk.

For schema work in any backend:

- prefer additive, backward-compatible changes first
- separate schema evolution from data backfill when lock time or rollout risk matters
- consider expand, backfill, switch, and contract for higher-risk changes
- check downstream contracts such as API schemas, workers, analytics payloads, caches, and generated clients

## API and DTO Bias

In REST-oriented backends, prefer stable resource URLs and cohesive object-owned endpoints over parameter-heavy catch-all routes. If the repo already groups CRUD methods around one resource surface, keep doing that.

- Keep one clear owner for create, update, delete, and side-effect behavior.
- Validate once at the boundary, then operate on normalized data.
- Validate shape and basic invariants at the transport boundary, but keep cross-entity business rules in the owning service.
- Keep serializer, DTO, and schema objects explicit. Avoid hidden read/write drift, duplicate names for the same concept, or magic transformations when simpler field modeling works.
- Use transactions for multi-entity writes.
- Make retrieval size explicit through pagination, expansions, includes, or retrieval levels instead of always returning full graphs.
- Treat auth, permission, tenancy, and rate limits as part of endpoint design, not post-hoc hardening.

## Async, Jobs, and Events

- Reuse the repo's current task, queue, scheduler, webhook, or signal system instead of inventing a new async path.
- Keep job envelopes thin: deserialize input, load context, call the owning service, emit the right logs or metrics, and exit.
- Design async work to be idempotent and retry-safe.
- Pass correlation identifiers and the minimum context needed to debug failures.
- Respect transaction boundaries. If background work depends on committed state, enqueue after commit or through the repo's equivalent safe handoff.
- Keep signal, webhook, and scheduler handlers thin; delegate real work to services or processors.
- In mixed sync and async stacks, use the framework's approved boundary helpers instead of blocking the event loop or bypassing connection safety.

## Observability and Failure Handling

- Reuse existing logging, tracing, audit, and metrics wrappers before adding new instrumentation paths.
- Attach the correlation fields the repo already uses: request, trace, span, job, run, user, tenant, entity, or external provider IDs.
- Log around true boundaries: request entry, service decisions, external calls, queue dispatch, retries, cache misses, and state transitions.
- If the repo distinguishes routine logs from investigation-grade incidents or audit events, preserve that distinction instead of collapsing everything into one channel.
- Translate failures at the owner boundary into stable API responses, job outcomes, or domain errors without losing diagnostic context.

## Performance and Correctness

- Load related data intentionally. Watch for N+1 queries, repeated scans, accidental fan-out, and oversized payloads.
- Cache only when ownership and invalidation are clear.
- Design for duplicate delivery, double submission, concurrent updates, stale cache, and partial failure.
- Prefer cohesive code paths over over-abstracted indirection. Simpler systems fail in fewer ways.

## Stack Translations

For backends with a strong service layer:

- keep transport thin and service-owned logic central
- preserve existing logging, auth, and async dispatch patterns
- favor reusable domain objects, shared base types, and established write paths
- prefer resource or object-specific routes when that is the established surface

For Django or DRF repos, this often means thin views and serializers, service-owned business logic, `transaction.atomic()` for multi-table writes, deliberate `select_related()` or `prefetch_related()`, and `on_commit()` or queue-safe dispatch for post-write jobs.

For FastAPI, Flask, Express, Nest, Rails, or Go services, the same bias applies: keep routers or handlers thin, let validated request objects feed an owning service or use-case layer, and keep background work, external calls, and transaction management out of leaf transport code.

This is a bias, not a mandate. Match the repo you are in.
