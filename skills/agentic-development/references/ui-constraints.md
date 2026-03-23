# UI Constraints

Opinionated hard rules for building interfaces. Apply these on top of the general guidance in `frontend-development.md`. Rules use MUST / NEVER / SHOULD to indicate strictness.

## Stack

- MUST use Tailwind CSS defaults unless custom values already exist or are explicitly requested.
- MUST use `motion/react` (formerly `framer-motion`) when JavaScript animation is required.
- SHOULD use `tw-animate-css` for entrance and micro-animations in Tailwind CSS.
- MUST use `cn` utility (`clsx` + `tailwind-merge`) for class logic.

## Components

- MUST use accessible component primitives for anything with keyboard or focus behavior (`Base UI`, `React Aria`, `Radix`).
- MUST use the project's existing component primitives first.
- NEVER mix primitive systems within the same interaction surface.
- SHOULD prefer [`Base UI`](https://base-ui.com/react/components) for new primitives if compatible with the stack.
- MUST add an `aria-label` to icon-only buttons.
- NEVER rebuild keyboard or focus behavior by hand unless explicitly requested.

## Interaction

- MUST use an `AlertDialog` for destructive or irreversible actions.
- SHOULD use structural skeletons for loading states.
- NEVER use `h-screen`; use `h-dvh`.
- MUST respect `safe-area-inset` for fixed elements.
- MUST show errors next to where the action happens.
- NEVER block paste in `input` or `textarea` elements.

## Animation

- NEVER add animation unless it is explicitly requested.
- MUST animate only compositor props (`transform`, `opacity`).
- NEVER animate layout properties (`width`, `height`, `top`, `left`, `margin`, `padding`).
- SHOULD avoid animating paint properties (`background`, `color`) except for small, local UI (text, icons).
- SHOULD use `ease-out` on entrance.
- NEVER exceed `200ms` for interaction feedback.
- MUST pause looping animations when off-screen.
- SHOULD respect `prefers-reduced-motion`.
- NEVER introduce custom easing curves unless explicitly requested.
- SHOULD avoid animating large images or full-screen surfaces.

## Typography

- MUST use `text-balance` for headings and `text-pretty` for body/paragraphs.
- MUST use `tabular-nums` for data.
- SHOULD use `truncate` or `line-clamp` for dense UI.
- NEVER modify `letter-spacing` (`tracking-*`) unless explicitly requested.
- SHOULD use `font-variant-numeric: oldstyle-nums` for inline numbers in prose; `lining-nums tabular-nums` for data tables.
- SHOULD enable `font-variant-numeric: slashed-zero` in code-adjacent UIs (disambiguates `0` from `O`).
- SHOULD enable `font-feature-settings: "ss02"` in code-facing UIs (disambiguates `I`, `l`, `1`).
- SHOULD set `font-optical-sizing: auto` (never disable it — browser uses size-adaptive glyph shapes).
- SHOULD set `-webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale` on retina surfaces.
- SHOULD set `text-underline-offset: 3px; text-decoration-skip-ink: auto` on anchor links.
- SHOULD set `font-synthesis: none` on display or icon fonts to prevent browser-generated faux bold/italic.
- SHOULD use `font-display: swap` in `@font-face` declarations.
- SHOULD add `letter-spacing: 0.05em` to uppercase or small-caps text.

## Layout

- MUST use a fixed `z-index` scale (no arbitrary `z-*`).
- SHOULD use `size-*` for square elements instead of `w-*` + `h-*`.

## CSS Pseudo-Elements

- MUST add `content: ""` to `::before` / `::after` — they will not render without it.
- SHOULD use pseudo-elements for decorative content instead of extra DOM nodes (`<span className="bg" />`).
- MUST set `position: relative` on the parent when positioning pseudo-elements absolutely.
- MUST set `z-index: -1` on pseudo-elements that should render behind the element's text content.
- SHOULD use `::before` with negative `inset` values (e.g. `inset: -8px -12px`) to expand hit targets without markup overhead.
- MUST assign `view-transition-name` to elements participating in the View Transitions API.
- MUST ensure each `view-transition-name` is unique on the page during a transition; clear stale names in the `startViewTransition` callback.
- SHOULD prefer the native View Transitions API over JS animation libraries for page-level transitions.
- SHOULD use `::backdrop` for `<dialog>` and popover overlay backgrounds instead of a separate overlay `<div>`.
- SHOULD use `::placeholder` for input placeholder styling.
- SHOULD use `::marker` for custom list bullet styles instead of `list-style: none` + background-image hacks.
- SHOULD use `::selection` to style text selection highlighting.

## Performance

- NEVER animate large `blur()` or `backdrop-filter` surfaces.
- NEVER apply `will-change` outside an active animation.
- NEVER use `useEffect` for anything that can be expressed as render logic.

## Design

- NEVER use gradients unless explicitly requested.
- NEVER use purple or multicolor gradients.
- NEVER use glow effects as primary affordances.
- SHOULD use Tailwind CSS default shadow scale unless explicitly requested.
- MUST give empty states one clear next action.
- SHOULD limit accent color usage to one per view.
- SHOULD use existing theme or Tailwind CSS color tokens before introducing new ones.
- SHOULD use concentric border radius for nested rounded elements: inner radius = outer radius minus padding. Using the same radius on both creates uneven curves.
- SHOULD layer 2–3 `box-shadow` values for realistic depth rather than a single shadow.
- MUST keep all `box-shadow` offsets in the same direction across the UI (single virtual light source). Mixed directions look broken.
- SHOULD use semi-transparent or neutral dark colors for shadows (`rgba(17,24,39,0.08)`), not pure `rgba(0,0,0,X)`.
- SHOULD use semi-transparent border colors (e.g. `var(--gray-a4)`) that adapt to any background instead of hardcoded hex.
- NEVER animate `box-shadow` directly — it triggers expensive repaints. Animate a pseudo-element's `opacity` instead.
