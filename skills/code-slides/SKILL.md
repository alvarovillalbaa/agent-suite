---
name: code-slides
description: Create and evolve code-based slide decks (pitch decks, demos, product walkthroughs, technical talks) with HTML/CSS/JS or React/TypeScript. Use when a user asks for slides implemented in code, responsive behavior across mobile/tablet/desktop, remote-control navigation, configurable right-side or bottom navigation, iframe-based deck rendering, or image workflows that combine AI-generated assets, external URLs, local repo images, and code-as-image product mockups. Trigger this skill for new deck creation, redesigns, refactors, framework migrations, and slide-quality QA.
---

# Code Slides

Build production-ready, code-first slide decks with deterministic structure and fast iteration.

## Workflow

1. Confirm deck intent, audience, and delivery context.
2. Select implementation mode using `references/mode-selection.md`.
3. Scaffold a starting point with `scripts/scaffold_deck.py` and template assets.
4. Build slides using the image strategy workflow in `references/image-strategy.md`.
5. Implement remote control + navigation placement rules from `references/remote-control.md`.
6. Run `scripts/validate_deck.py` and fix every failed check.

## Implementation Mode Rules

Apply these rules in order:

1. Use plain HTML by default.
2. Render deck slides in iframes by default for plain HTML decks.
3. Switch to React/TypeScript only when the user explicitly requests React, TypeScript, or a component library implementation.
4. If the user already uses shadcn-ui, Radix UI, Headless UI, or another component library but gives no explicit format request, still default to plain HTML + iframes.
5. If the user explicitly requests component libraries, implement controls/components with the requested library (shadcn-ui, Radix UI, Headless UI, etc.), not raw HTML controls.

Load details from `references/mode-selection.md` when selecting the mode.

## Remote Navigation Requirements

Always ship navigation that supports:

1. Local controls (keyboard + on-screen buttons).
2. Remote controller page (phone/tablet friendly).
3. Configurable navigation bar placement: `right` or `bottom`.

Implement remote transport with the following priority:

1. Existing project realtime channel (WebSocket/Supabase/Pusher/etc.) for cross-device control.
2. BroadcastChannel fallback for same-browser testing.

Load full protocol and validation requirements from `references/remote-control.md`.

## Image Strategy Requirements

Support all image pathways in every deck workflow:

1. AI-generated images created during the task.
2. Existing external image URLs found in the repository.
3. Existing local images stored in the repository.
4. Code-as-image product visuals for product-first slides.
5. Mixed compositions (for example: generated background + code-as-image foreground dashboard).

Use `scripts/index_image_sources.py` to inventory existing image assets.
Use the decision criteria in `references/image-strategy.md`.

## Responsiveness Requirements

Design for mobile, tablet, and desktop.

1. Use fluid typography and spacing (`clamp`, relative units).
2. Avoid fixed-height slide shells without overflow handling.
3. Keep controls reachable by touch on small screens.
4. Validate at common viewport widths (360, 768, 1024, 1440).

## Bundled Resources

### scripts/

- `scaffold_deck.py`: Create HTML or React/TS starter deck files.
- `index_image_sources.py`: Discover local images and external image URLs.
- `validate_deck.py`: Validate required deck capabilities.
- `install_local.sh`: Copy this skill into Codex/Claude/OpenClaw skill folders after `git clone`.

### references/

- `mode-selection.md`: Deterministic mode decision tree.
- `remote-control.md`: Remote protocol, UI rules, and acceptance checks.
- `image-strategy.md`: Multi-source image workflow and composition patterns.
- `distribution.md`: `npx skills add`, `git clone`, and manual install guidance.

### assets/

- `templates/html/`: Default iframe-based HTML deck template with remote control page.
- `templates/react-ts/`: React/TypeScript deck template with library-ready control surface.

## Command Reference

```bash
# Scaffold default HTML deck
python3 scripts/scaffold_deck.py \
  --mode html \
  --output ./slides \
  --title "Quarterly Product Review" \
  --nav-position right

# Scaffold React/TS deck (when explicitly requested)
python3 scripts/scaffold_deck.py \
  --mode react-ts \
  --output ./slides-app \
  --title "Quarterly Product Review" \
  --nav-position bottom \
  --component-lib shadcn

# Discover reusable images in repository
python3 scripts/index_image_sources.py \
  --repo-root . \
  --output ./slides/image-index.json

# Validate finished deck
python3 scripts/validate_deck.py \
  --project-root ./slides \
  --mode html
```

## Done Criteria

Mark a deck complete only when all checks pass:

1. Mode selection matches `references/mode-selection.md`.
2. Navigation bar supports `right` and `bottom` placement.
3. Remote control flow works (screen + remote roles).
4. Image usage includes an explicit source strategy.
5. Deck is usable on mobile, tablet, and desktop.
6. `scripts/validate_deck.py` returns success.
