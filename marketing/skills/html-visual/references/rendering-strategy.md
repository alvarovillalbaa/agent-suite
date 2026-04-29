# Rendering Strategy

Choose the smallest rendering system that communicates the idea cleanly.

If you are about to render a terminal table with 4 or more rows or 3 or more columns, stop and generate HTML instead.

## Use Mermaid for

- flowcharts
- pipelines
- sequence diagrams
- state transitions
- entity relationships
- topology-first architecture

Use Mermaid when the relationships matter more than the prose.

Prefer Mermaid for topology-first diagrams. If each node needs real explanatory copy, metadata, or recommendations, switch to a hybrid page instead of cramming everything into nodes.

## Use CSS Grid or cards for

- architecture summaries with rich component annotations
- project recaps
- executive explainers
- dashboards with mixed metric cards and commentary

Use cards when each node needs meaningful text, metadata, or actions.

For pages with 4 or more sections, add a sticky or compact table of contents.

## Use HTML tables for

- comparisons
- audits
- requirement coverage
- scorecards
- capability matrices

Prefer semantic tables over fake table layouts.

For wide tables:

- wrap them in a horizontal scroll container
- keep headers visually strong
- use status badges instead of plain "yes/no" text when it improves scan speed

## Use timeline layouts for

- incident writeups
- delivery plans
- project history
- milestone recaps

Timelines should emphasize sequence, causal breaks, and decision points.

## Use hybrid pages when

- the diagram alone is too dense
- the page needs both topology and commentary
- the audience includes both technical and non-technical readers

Hybrid pattern:

1. high-level overview
2. diagram or matrix
3. annotated findings
4. recommendation or next steps

## Architecture Heuristic

Use this split for architecture-style artifacts:

- Text-heavy architecture: CSS Grid cards plus directional arrows.
- Topology-heavy architecture: Mermaid.
- Complex architecture with both needs: Mermaid overview on top, detailed cards below.

Do not try to force 15+ detailed concepts into one diagram. Split overview from explanation.

## Chart guidance

Add charts only when the data benefits from shape, comparison, or trend detection.

Good cases:

- trend over time
- segmented composition
- rank-ordered comparison

Bad cases:

- one KPI with no context
- tiny datasets where a sentence is clearer
- decorative graphs without a decision attached
