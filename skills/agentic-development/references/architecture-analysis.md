# Architecture Analysis

Use this reference when the hard part is understanding how the system works, what owns a behavior, or what will break if code moves.

## Analysis Loop

1. Name the subject precisely: endpoint, job, page, hook, model, package, command, event, or config surface.
2. Find the real entrypoints and owners: routes, handlers, exported APIs, task registries, CLI commands, schedulers, migrations, schemas, or bootstrap code.
3. Trace the path end to end: input, validation, orchestration, persistence, external calls, async handoff, and returned output.
4. Map contracts and state: types, schemas, model relations, feature flags, env vars, retries, side effects, and lifecycle fields.
5. Map dependents: callers, imports, tests, fixtures, docs, CI jobs, dashboards, and rollout scripts.
6. Answer only the claim the user asked for: explanation, dependency risk, or refactor impact.

## Architecture Questions

- Start from code and runtime wiring, not folder names or guesses.
- Prefer authoritative files: app bootstrap, route registration, dependency-injection setup, task registration, schema definitions, migrations, and public exports.
- Distinguish the owning layer from convenience wrappers. The real owner is where business rules and state transitions actually live.
- For data-model questions, follow identifiers, relations, lifecycle state, and derived fields before describing the shape.
- For integration questions, trace auth, configuration, retries, error handling, and where failures surface back to the caller.
- Explain tradeoffs only after describing the current implementation accurately.

## Fast Search Patterns

Use focused searches before broad reads:

```bash
rg -n "feature_name|route_name|event_name|command_name" .
rg -n "import .*Symbol|from .* import Symbol|require\\(" src app services packages
rg -n "schema|serializer|dto|zod|pydantic|interface|type " .
rg -n "deprecated|TODO|FIXME|feature_flag|env\\." .
rg -n "SymbolName" tests docs .github
```

Search both directions:

- inward dependencies: what this code needs to run
- outward dependents: what will notice if this code changes

## Dependency Mapping

- Separate static imports from dynamic registration. Plugin registries, reflection, code generation, and env-driven loading often hide real dependencies.
- Watch for duplicated ownership: two services writing the same entity, two endpoints mutating the same state, or multiple formatters for the same contract.
- Check architectural boundaries the repo already enforces: transport vs domain, UI vs state, worker vs request path, package vs app, public API vs private helpers.
- If the system is event-driven, map both the producer and every meaningful consumer before claiming low-risk change.
- If a dependency seems circular, confirm whether it is a true cycle or only a type-only, test-only, or generated-code edge.

## Refactor Impact Analysis

Inventory impact in these buckets before moving code:

- runtime call sites and imports
- persisted data, migrations, caches, and backfills
- HTTP, RPC, event, CLI, env, and config contracts
- async jobs, schedulers, webhooks, and workers
- tests, fixtures, snapshots, mocks, and factories
- docs, examples, runbooks, and code comments
- CI, build, packaging, deploy, and observability wiring

Risk rises when a change touches:

- public or versioned contracts
- stateful data or mixed-version rollouts
- concurrency, retries, or idempotency
- dynamic loading or generated code
- poorly covered or weakly isolated code paths

Prefer compatibility-first refactors:

1. add the new path without breaking the old one
2. switch callers incrementally
3. verify behavior and telemetry
4. remove the old path only after the repo can prove safety

## Good Answer Shape

When responding to architecture questions or refactor-risk questions, structure the result around:

1. current owner or execution path
2. key files and boundaries
3. main dependencies and dependents
4. likely break points or rollout risks
5. exact proof or migration steps needed before declaring safety
