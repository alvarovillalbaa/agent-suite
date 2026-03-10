# Frontend Development

Treat frontend changes as behavior, state, and user trust. Good frontend work preserves the repo's architecture while improving what users can actually do.

## Start With Repo Reality

Before editing code, identify:

- framework boundaries: server versus client, SSR versus CSR, routing model, hydration model, and data-loading primitives
- design-system sources: tokens, primitives, theme files, typography, spacing, motion rules, and shared component directories
- state owners: server state, URL state, form state, client UI state, and local ephemeral state
- shared concerns: auth, analytics, feature flags, i18n, notifications, and error reporting
- the current home for the change: do not invent a new subsystem unless the existing structure is clearly failing

## Delivery Loop

1. Reconstruct the user-facing behavior and enumerate the important states before coding.
2. Choose the owner for data, validation, navigation, and optimistic updates.
3. Build from existing primitives upward, not from ad hoc markup downward.
4. Verify keyboard flow, focus behavior, errors, empty states, and responsiveness before calling the work complete.
5. Instrument meaningful events and failure paths if the repo already tracks them.

## Component Construction

- Choose the right artifact level before coding: primitive, composed control, domain component, or page section.
- Reuse existing component primitives, tokens, utilities, and interaction patterns before creating a new API.
- Prefer composition, slots, or subcomponents over wide prop matrices and conflicting boolean flags.
- Expose native attributes, refs, and styling seams when the framework supports them.
- Support both controlled and uncontrolled state only when both modes are genuinely useful.
- Keep data fetching and persistence outside low-level reusable components unless the component exists specifically to own that workflow.

## Component and State Boundaries

- Prefer existing component primitives, tokens, and utilities. Do not mix competing primitive systems on one interaction surface unless the repo already does.
- Keep components cohesive. Split when one file mixes rendering, API orchestration, validation, state machines, and modal coordination.
- Move network calls, transforms, and cache orchestration into loaders, services, actions, hooks, or stores that the repo already uses.
- Keep URL state in the URL when the user expects shareable or restorable state: filters, tabs, pagination, expanded panels, wizard steps, and search.
- Preserve framework conventions for server/client boundaries; do not turn large trees into client-only code just to solve a small local problem.
- Do not use `useEffect` for work that can happen during render, on the server, or in an event handler.

## Interaction and Accessibility

- Use native elements first. Use ARIA to describe custom behavior, not to excuse missing semantics.
- Buttons perform actions. Links navigate. Inputs keep labels, visible focus, autocomplete, and paste support.
- Cover loading, success, error, empty, disabled, and permission-restricted states as first-class behavior.
- Put errors next to the failing action or field. Use polite live regions for async validation or confirmations when relevant.
- Keep focus order logical. Dialogs, menus, popovers, and drawers should manage focus on open and close.
- Keyboard paths should match pointer paths. Do not hide required functionality behind hover-only UI.
- Maintain touch-friendly hit targets and mobile-safe input sizing. Do not disable zoom.
- Keep destructive actions behind confirmation or an explicit undo path.
- Keep empty states actionable instead of decorative.

## Visual and Responsive Quality

- Preserve an established design system if the repo has one. If it does not, choose a clear direction instead of generic scaffolding.
- Treat typography, color, spacing, density, and motion as a system, not isolated tweaks.
- Verify sparse, average, and dense content. Handle long labels, large numbers, empty collections, and narrow screens intentionally.
- Check mobile, laptop, and wide layouts. Fix overflow and dead space instead of hiding them with arbitrary widths and clipping.
- Use motion to clarify cause and effect. Respect reduced-motion preferences and avoid animating layout or huge blur surfaces unless the repo intentionally does so.

## Forms and Async UX

- Let users type freely; validate at the right boundary and explain how to recover.
- Keep submit enabled until the request starts. Disable during submission if duplicate writes are risky.
- Prefer optimistic updates only when rollback is explicit and the existing data layer supports it.
- Preserve user input through refetches, hydration, and validation errors.
- Reuse repo conventions for toasts, inline errors, undo flows, and retry actions.
- Keep shareable or restorable state in the URL when users expect refresh, back, or deep-link behavior.

## Localization and Content Resilience

- Use the repo's locale helpers for dates, times, numbers, and currencies when they exist.
- Assume translated text may be longer than the source language.
- Verify short, average, and very long content on narrow and dense layouts.
- Keep copy specific enough that errors and actions remain clear after localization.

## Performance and Observability

- Prioritize fixes in this order: waterfalls, excess client JavaScript, misplaced server or client ownership, rerender churn, then large-surface rendering cost.
- Measure before optimizing. Use the repo's existing profilers, bundle tools, traces, or browser tooling.
- Start promises early and await as late as correctness allows. Parallelize independent fetches.
- Avoid unnecessary client-side JS, repeated derived work, broad subscriptions, and layout thrash.
- Keep heavy widgets, editors, charts, and low-priority panels behind route or feature boundaries when the framework supports it.
- Avoid broad state subscriptions when only a small derived value is needed. Use deferred or transition-based updates for non-urgent UI when the stack supports it.
- Code-split by route or feature when the framework supports it. Lazy-load non-critical media and heavy widgets.
- Virtualize large lists or use `content-visibility` when the surface is large enough to justify it.
- Track meaningful user intent and workflow transitions, not every render.

## Refactor Triggers

Refactor when you see:

- a long render function plus heavy state or effect logic
- raw network calls and data transforms inside view components
- repeated JSX or duplicated variant logic
- multiple modal states or tangled conditional branches
- unclear ownership between hook, store, URL, and component state
- fragile accessibility or focus behavior patched piecemeal

## Refactor Workflow

1. Reconstruct current behavior before moving code.
2. Decide the proof first: focused test, manual path, screenshot sequence, or trace.
3. Mark the current owners for data, form state, URL state, ephemeral UI state, and side effects.
4. Extract in the safest order: pure constants and helpers, repeated view fragments, local state hooks, then data orchestration.
5. Verify after each slice instead of landing a giant rewrite.
6. Stop when ownership is explicit and the next change is easier. Do not keep splitting past the point of clarity.

Use these extraction rules:

- Preserve public props and behavior until the repo has proof for cleanup.
- Move network calls and transforms toward the repo's existing service, query, action, or store layer.
- Extract hooks when logic is reusable or when state transitions hide the view.
- Extract subcomponents when sections can render from explicit props without hidden state coupling.
- Replace deep conditionals with guard clauses, lookup tables, or explicit state objects when that makes behavior clearer.

## Done Checklist

Before declaring frontend work complete, confirm:

- the architecture follows repo conventions
- user-visible states are covered
- keyboard, focus, and semantics are checked
- responsive behavior is checked
- analytics or error reporting are integrated if required
- the proof command, manual path, or screenshot evidence is recorded
