---
name: visualizer
description: Generate polished, self-contained visual explainers, reviews, diagrams, dashboards, comparison pages, and slide-mode HTML from technical or business inputs. Use when the user asks for a diagram, architecture overview, diff or plan review, project recap, comparison matrix, audit page, timeline, dashboard, or any explanation that would be clearer as a visual artifact than as plain terminal text. Also use proactively when the output would otherwise become a dense table or long text wall.
---

# Visualizer

Turn complex material into visual artifacts that are faster to scan, easier to trust, and worth sharing.

The default output is a self-contained HTML artifact. When the environment supports it, preview or open the generated file after writing it. If opening is not available, still produce the artifact and report the path.

## Core Promise

Use this skill to produce one of these artifacts:

1. Visual explainer page
2. Architecture or flow diagram page
3. Comparison or audit page
4. Review page for plans, diffs, or system changes
5. Dashboard or metric snapshot
6. Timeline or recap page
7. Slide-mode HTML for presentation-style delivery

Do not default to ASCII art, giant markdown tables, or text-only walls when the information has clear structure.

## Proactive Trigger

Use this skill even if the user did not explicitly ask for HTML when either condition is true:

- The output would include a table with 4 or more rows.
- The output would include 3 or more columns.
- The explanation depends on relationships, flow, hierarchy, chronology, or side-by-side comparison.
- A visual recap would reduce ambiguity or review time.

You can still include a concise chat summary, but the primary artifact should be the HTML output.

## Inputs To Collect

Gather only the inputs that materially change the artifact:

- Source material:
  - Notes, plans, code diffs, architecture context, metrics, audits, docs, or transcripts.
- Artifact goal:
  - Explain, review, compare, recap, pitch, audit, or present.
- Audience:
  - Engineer, executive, PM, founder, operator, client, or mixed audience.
- Constraints:
  - Timebox, tone, must-include sections, must-avoid claims, branding, or output path.
- Delivery mode:
  - Browser page, report, shareable handoff, or slide-mode.

If key context is missing, ask 2 to 4 targeted questions. Do not run a long survey.

## Output Modes

Choose the narrowest mode that fits the job.

### 1. Explainer

Use for:

- Concept walkthroughs
- Architecture overviews
- Mental model pages
- Project recaps

Default structure:

1. Title and framing
2. System or concept overview
3. Key components or phases
4. Risks, edge cases, or caveats
5. Recommended next steps

### 2. Review

Use for:

- Diff review
- Plan review
- Fact check against code or docs
- Requirement coverage

Default structure:

1. Executive summary
2. What changed or what was proposed
3. Strengths and confirmed matches
4. Risks, gaps, or regressions
5. Recommendation

### 3. Comparison

Use for:

- Tool evaluations
- Requirement matrices
- Before vs after views
- Option tradeoff pages

Default structure:

1. Decision frame
2. Comparison matrix
3. Critical deltas
4. Recommendation with rationale

### 4. Dashboard

Use for:

- KPI snapshots
- Funnel analysis
- Status rollups
- Health checks

Default structure:

1. Headline metrics
2. Trend or segmentation view
3. Interpretation
4. Risks and actions

### 5. Timeline

Use for:

- Incident recaps
- Release narratives
- Milestone plans
- Project history

Default structure:

1. Context
2. Timeline events
3. Inflection points
4. Lessons and next actions

### 6. Slide-Mode

Use for:

- Presentation-style delivery
- Team readouts
- Investor or client walkthroughs

Keep each slide focused on one idea. If the user needs a full presentation system with controls, speaker mode, or remote navigation, hand off to `code-slides`.

## Rendering Strategy

Choose the rendering method deliberately. Read `references/rendering-strategy.md` before generating complex artifacts.

General rules:

- Use Mermaid for topology, flow, state, and sequence relationships.
- Use HTML tables for comparisons, audits, and matrices.
- Use CSS timelines for chronological narratives.
- Use CSS Grid for dashboards, cards, and architecture summaries with rich annotations.
- Use charts only when the numbers materially benefit from visual encoding.
- Prefer hybrid pages over one giant diagram when there is a lot of explanatory text.

## Visual Direction

Pick a strong direction and commit to it. Read `references/visual-directions.md`.

Preferred directions:

- Blueprint
- Editorial
- Paper Ink
- Monochrome Terminal
- Product Brief
- Data Desk

Avoid generic defaults:

- Purple-on-white startup gradients
- Neon cyberpunk dashboards
- Inter plus indigo plus glassmorphism by reflex
- Decorative motion without information value

## Artifact Requirements

Every output should:

- Be self-contained HTML unless the user explicitly asks for another format.
- Have a clear title, framing sentence, and visible section structure.
- Use typography and spacing that improve scan speed.
- Make the recommendation or takeaway obvious.
- Handle mobile and desktop reasonably.
- Avoid internal scroll traps where possible.

For pages with 4 or more sections:

- Add a sticky or compact table of contents.

For diagrams:

- Add zoom-friendly containment and enough label contrast.

For comparisons and audits:

- Do not dump raw markdown tables into chat if the HTML page is the main deliverable.

## Workflow

1. Decide the output mode.
2. Choose the audience and information density.
3. Choose the rendering strategy.
4. Choose the visual direction.
5. Draft the information architecture before styling.
6. Generate the self-contained HTML artifact.
7. Verify that the page is readable, scannable, and accurate.
8. Write the file to a predictable location and report the path.

## Reusable Resources

### scripts/

- `scaffold_visualizer.py`: Generate a strong starter HTML artifact for explainer, review, or slide-mode pages.

### references/

- `rendering-strategy.md`: Map content types to the right rendering approach.
- `visual-directions.md`: Visual systems, palette guidance, and anti-patterns.
- `output-checklist.md`: Final QA checklist before delivery.

### assets/

- `templates/explainer.html`: Starter shell for explainers and architecture pages.
- `templates/review.html`: Starter shell for audits, plan reviews, and comparisons.
- `templates/slide-mode.html`: Starter shell for presentation-style output.

## Related Skills

- Use `code-slides` when the user needs a full presentation system rather than a single visual artifact.
- Use `quality-assurance` or `agentic-development` first when the hard part is the underlying technical review, then use `visualizer` to present the result.
- Use `code-documentation` when the primary output should be written documentation rather than a visual page.
