# Rendering Strategy

Choose the smallest rendering system that communicates the idea cleanly.

## Use Mermaid for

- flowcharts
- pipelines
- sequence diagrams
- state transitions
- entity relationships
- topology-first architecture

Use Mermaid when the relationships matter more than the prose.

## Use CSS Grid or cards for

- architecture summaries with rich component annotations
- project recaps
- executive explainers
- dashboards with mixed metric cards and commentary

Use cards when each node needs meaningful text, metadata, or actions.

## Use HTML tables for

- comparisons
- audits
- requirement coverage
- scorecards
- capability matrices

Prefer semantic tables over fake table layouts.

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
