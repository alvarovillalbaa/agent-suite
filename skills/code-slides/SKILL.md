---
name: code-slides
description: Create and evolve code-based slide decks and presentations (pitch decks, demos, product walkthroughs, technical talks) with HTML/CSS/JS or React/TypeScript. Use when a user asks for slides implemented in code, a single-file HTML presentation, responsive behavior across mobile/tablet/desktop, PowerPoint/PPTX-to-web conversion, remote-control navigation, configurable right-side or bottom navigation, iframe-based deck rendering, visual style exploration, or image workflows that combine AI-generated assets, external URLs, local repo images, and code-as-image product mockups. Trigger this skill for new deck creation, redesigns, refactors, framework migrations, PPT conversions, and slide-quality QA.
---

# Code Slides

Build production-ready, code-first slide decks with deterministic structure, distinctive visual direction, and fast iteration.

## Workflow

1. Detect the job type: new deck, existing deck enhancement, or PPT/PPTX conversion.
2. Confirm audience, delivery context, slide count, and whether the user wants direct preset selection or visual style previews.
3. Select implementation mode using `references/mode-selection.md`.
4. Apply viewport-fit rules from `references/viewport-fit.md` before writing slides.
5. Use `references/style-presets.md` when the user needs aesthetic direction or wants preview options.
6. Scaffold a starting point with `scripts/scaffold_deck.py`, template assets, and `templates/` prompts when useful.
7. Build slides using the image strategy workflow in `references/image-strategy.md`.
8. Implement remote control + navigation placement rules from `references/remote-control.md` when the deck needs multi-device control.
9. For PowerPoint imports, follow `references/ppt-conversion.md`.
10. Run `scripts/validate_deck.py` and fix every failed check.

## Presentation Modes

Handle each request as one of these modes:

1. New presentation: create the outline or full deck from a topic, brief, or finished content.
2. Existing presentation enhancement: read the current deck, preserve what works, and improve structure, visuals, and responsiveness.
3. PPT/PPTX conversion: extract slide content and assets, confirm the extracted structure, then rebuild the deck in HTML or React.

## Implementation Mode Rules

Apply these rules in order:

1. Use plain HTML by default.
2. Prefer a single self-contained HTML file with inline CSS/JS when the user wants a portable presentation, a zero-dependency deck, or a quick browser-openable artifact.
3. Render deck slides in iframes by default for multi-file plain HTML decks.
4. Switch to React/TypeScript only when the user explicitly requests React, TypeScript, or a component library implementation.
5. If the user already uses shadcn-ui, Radix UI, Headless UI, or another component library but gives no explicit format request, still default to plain HTML.
6. If the user explicitly requests component libraries, implement controls/components with the requested library (shadcn-ui, Radix UI, Headless UI, etc.), not raw HTML controls.

Load details from `references/mode-selection.md` when selecting the mode.

## Style Discovery Rules

When the user does not have a clear aesthetic direction:

1. Offer preset-led exploration instead of abstract design questions.
2. Either let the user pick a named preset from `references/style-presets.md` or generate three lightweight preview files that show distinct directions.
3. Keep previews intentionally different in typography, color, and motion.
4. Avoid generic "AI slop" patterns such as purple-on-white defaults, system-font stacks, and interchangeable hero layouts.
5. Preserve the established product or brand language when the repository already has one.

## Remote Navigation Requirements

Always ship navigation that supports local controls. Add the remote controller page whenever the delivery context requires multi-device presenting, speaker controls, or mirrored navigation across screens.

Required controls:

1. Local controls (keyboard + on-screen buttons).
2. Configurable navigation bar placement: `right` or `bottom`.

If remote control is included, also ship:

1. Remote controller page (phone/tablet friendly).
2. Clear presenter/screen role separation.

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
2. Make every slide fit within the viewport without internal scrolling; split content across slides instead of cramming.
3. Avoid fixed-height slide shells without overflow handling.
4. Keep controls reachable by touch on small screens.
5. Validate at common viewport widths and heights using `references/viewport-fit.md`.

## Bundled Resources

### scripts/

- `scaffold_deck.py`: Create HTML or React/TS starter deck files.
- `index_image_sources.py`: Discover local images and external image URLs.
- `validate_deck.py`: Validate required deck capabilities.
- `install_local.sh`: Optional helper for copying this skill into a local skill registry after clone.

### references/

- `mode-selection.md`: Deterministic mode decision tree.
- `remote-control.md`: Remote protocol, UI rules, and acceptance checks.
- `image-strategy.md`: Multi-source image workflow and composition patterns.
- `viewport-fit.md`: Required slide sizing, density limits, and responsive validation targets.
- `style-presets.md`: Distinct visual directions for pitch decks, talks, and demos.
- `ppt-conversion.md`: PowerPoint extraction and reconstruction workflow.
- `distribution.md`: `npx skills add`, `git clone`, and manual install guidance.

### assets/

- `templates/html/`: Default iframe-based HTML deck template with remote control page.
- `templates/react-ts/`: React/TypeScript deck template with library-ready control surface.

### templates/

- `slides-deck-plan.md`: Lightweight planning prompt for outline and story flow.
- `slides-deck-code.md`: Lightweight implementation prompt for deck generation.

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
2. Visual direction is either user-selected or explicitly justified.
3. Every slide fits the viewport without internal scrolling.
4. Navigation bar supports `right` and `bottom` placement when deck navigation is present.
5. Remote control flow works when remote mode is included.
6. Image usage includes an explicit source strategy.
7. Deck is usable on mobile, tablet, and desktop.
8. `scripts/validate_deck.py` returns success when applicable.
