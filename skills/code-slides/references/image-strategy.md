# Image Strategy

Plan image usage before slide implementation.

## Supported Image Sources

1. AI-generated images created during deck work.
2. External image URLs already present in repository code/content.
3. Local image files inside the repository.
4. Code-as-image product visuals authored directly in HTML/CSS/JS or React.
5. Composite scenes that combine multiple source types.

## Asset Discovery Workflow

1. Run `scripts/index_image_sources.py` at repo root.
2. Review local assets first (lowest integration risk).
3. Review external URLs for quality, licensing, and reliability.
4. Fill gaps with AI-generated assets.
5. Build product-focused hero visuals with code-as-image when screenshots are unavailable or low quality.

## Code-as-Image Patterns

Prefer code-as-image for product narratives:

- Dashboard mockups
- User journeys
- Data visualizations
- Feature callouts

Compose layered visuals when useful:

1. Generated/photographic background layer.
2. Code-rendered product foreground layer.
3. Annotation overlays for narrative emphasis.

## Quality Requirements

- Maintain aspect ratio consistency across slides.
- Avoid blurry or stretched assets.
- Keep text legible on top of image backgrounds.
- Record source origin in implementation notes when possible.

## Performance Requirements

- Prefer modern formats (`webp`, `avif`) when supported.
- Lazy-load non-visible slide media if deck implementation permits it.
- Do not block initial render on large media fetches.
