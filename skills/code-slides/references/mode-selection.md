# Mode Selection

Use this decision tree before writing deck code.

## Decision Tree

1. Ask whether the user explicitly requested `React`, `TypeScript`, or a component library implementation.
2. If yes, choose `react-ts` mode.
3. If no, choose `html` mode.
4. If the repository already contains shadcn-ui/Radix/Headless but no explicit request exists, keep `html` mode.
5. If the user explicitly requests a component library, implement UI controls using that library.

## Output Contracts

### `html` mode (default)

- Build plain HTML/CSS/JS.
- Render slides inside iframes.
- Keep each slide modular (one file per slide when practical).
- Include remote controller page and configurable nav placement.

### `react-ts` mode (explicitly requested)

- Build React + TypeScript components.
- Use requested component libraries for UI controls.
- Preserve the same remote + nav-position capabilities as HTML mode.
- Keep deck state serializable (for controller sync).

## Library Mapping Guidance

- `shadcn`: Prefer project-local shadcn primitives (`Button`, `Card`, `Tabs`, `Dialog`).
- `radix`: Use Radix primitives/themes for controls and accessibility.
- `headless`: Use Headless UI components plus project styling layer.
- `none`: Use native semantic controls only when no library is requested.

## Resolution Rules for Ambiguity

1. If user intent is ambiguous, choose default `html` mode.
2. If user later requests framework migration, convert deck architecture incrementally slide-by-slide.
3. Never silently switch from HTML to React without an explicit user request.
