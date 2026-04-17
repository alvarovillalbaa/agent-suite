---
name: product-development
description: >-
  Use for product strategy and product management work: PRDs, prioritization,
  roadmaps, discovery summaries, experiment plans, release criteria, decision
  memos, OKR planning, user stories, sprint planning, landing-page strategy,
  conversion audits, buyer psychology, and UX copy. Choose this when the user
  needs product framing, strategic tradeoffs, or conversion-focused page
  direction before implementation.
metadata:
  short-description: Shape product strategy, leadership docs, specs, and priorities
---

# Product

Use this skill to turn product ambiguity into a crisp decision, artifact, or plan.

Treat this as the umbrella skill for both day-to-day product management and Head-of-Product style strategic planning.

Keep `SKILL.md` focused on the operating model. Load only the reference file that matches the request:

- `references/strategy-operating-model.md` for quarterly planning, strategy type selection, company -> product -> team OKR cascades, alignment scoring, vision work, roadmap themes, and org design
- `references/competitive-strategy.md` for competitive landscape analysis, category framing, differentiation, and strategy implications
- `references/frameworks.md` for prioritization frameworks (RICE, ICE, MoSCoW, Kano, Value vs Effort), discovery frameworks (JTBD, Opportunity Solution Tree, hypothesis templates, customer interview guides), and metrics frameworks (North Star, HEART, funnel analysis, go-to-market checklists)
- `references/prd-templates.md` for fillable PRD templates: Standard PRD, One-Page PRD, Feature Brief, and Agile Epic
- `references/experiment-playbook.md` for experiment types (A/B, multivariate, holdout), metric design, stopping rules, novelty/primacy effects, pre-launch checklist, and post-test readout template
- `references/statistics-reference.md` for p-value, confidence intervals, MDE, statistical power, Type I/II errors, and practical significance guidance for product managers
- `references/landing-page-generation.md` for the generation workflow, design style reference (dark-saas, clean-minimal, bold-startup, enterprise Tailwind class sets), hero/feature/pricing/FAQ/CTA/footer component patterns, performance targets, and common pitfalls — load when building or reviewing a landing page
- `references/landing-page-copy-frameworks.md` for detailed PAS, AIDA, BAB, and 4Ps copy frameworks with worked SaaS examples, headline formulas, and CTA best practices — load when writing or critiquing landing page copy
- `references/landing-page-patterns.md` for proven conversion patterns (hero layouts, social proof placement, pricing psychology, form optimization, mobile-first patterns, page templates) and an A/B testing priority matrix — load when optimising an existing landing page or planning variants
- `references/landing-page-seo-checklist.md` for the full SEO validation checklist (meta tags, structured data, Core Web Vitals, keyword placement, image optimisation, mobile responsiveness, technical SEO) — always run before delivering a final landing page
- `references/user-story-templates.md` for standard story formats by type (feature, improvement, bug fix, enabler), Given-When-Then acceptance criteria patterns, INVEST validation checklist, Fibonacci story point estimation guide, and common story antipatterns — load when writing or reviewing user stories
- `references/sprint-planning-guide.md` for sprint planning meeting agenda, capacity calculation formulas, WSJF backlog prioritization, sprint ceremony guides (standup, refinement, review, retro), velocity tracking, burndown patterns, Definition of Done checklist, and sprint metrics — load when planning a sprint or tracking delivery health
- `references/content-strategy.md` for content pillar development (product-led, audience-led, search-led, competitor-led lenses), searchable vs. shareable content formats (hub-and-spoke, use-case pages, template libraries, thought leadership, data-driven content, expert roundups, case studies), keyword research by buyer stage, content ideation sources, and the four-factor prioritization matrix (Customer Impact 40%, Content-Market Fit 30%, Search Potential 20%, Resource Requirements 10%) — load when the user needs a content strategy, editorial calendar, topic cluster map, or content prioritization plan
- `references/marketing-psychology.md` for 50+ buyer psychology and persuasion mental models organized into six categories: Foundational Thinking (First Principles, Theory of Constraints, Pareto, Barbell Strategy), Buyer Psychology (Loss Aversion, Social Proof, Anchoring, Endowment Effect, IKEA Effect, Paradox of Choice, Zeigarnik, Confirmation Bias), Persuasion & Influence (Reciprocity, Commitment & Consistency, Authority, Scarcity, Foot-in-the-Door, Framing, Contrast), Pricing Psychology (Charm Pricing, Rule of 100, Decoy Effect, Mental Accounting), Design & Delivery (BJ Fogg Behavior Model, Hick's Law, Nudge Theory, EAST, Activation Energy), and Growth & Scaling (Network Effects, Flywheel, Compounding, Switching Costs, Survivorship Bias) — load when the user needs to improve conversion rates, reduce churn, design onboarding flows, frame pricing, apply persuasion to copy or campaigns, or understand why customers behave a certain way
- `references/ux-copy.md` for UX copy guidance: five Clear-Concise-Consistent-Useful-Human principles, copy patterns by component type (CTAs, error messages, empty states, confirmation dialogs, tooltips, loading states, onboarding), tone by scenario, output format with comparison tables and localization notes, and common mistakes — load when writing or reviewing any interface copy or microcopy
- `references/page-cro.md` for the CRO audit workflow: initial assessment (page type, conversion goal, traffic source context), seven analysis dimensions (value proposition clarity, headline effectiveness, CTA placement, visual hierarchy, trust signals, objection handling, friction points), copy alternative patterns, and the four-bucket deliverable structure (quick wins, high-impact changes, A/B test ideas, copy variants) — load when auditing or diagnosing an existing marketing page for conversion problems
- `references/product-marketing-context.md` for the 12-section product marketing context framework (Product Overview, Target Audience, Personas, Problems & Pain Points, Competitive Landscape, Differentiation, Objections & Anti-Personas, Switching Dynamics via JTBD Four Forces, Customer Language, Brand Voice, Proof Points, Goals), the auto-draft workflow for generating an initial context from README/landing page/package.json, the conversational gathering path, and the downstream-use guide — load when the user needs to establish foundational positioning, build or update a product marketing context document, define an ICP, document customer language, or prepare a reusable context file for marketing tasks

## Tools

Three executable scripts are available when the user wants to run quantitative analysis:

- `scripts/rice_prioritizer.py` — calculates RICE scores from a CSV of features, generates portfolio analysis and a quarterly roadmap by capacity. Run `python scripts/rice_prioritizer.py sample` to generate sample data.
- `scripts/customer_interview_analyzer.py` — extracts pain points, feature requests, JTBD patterns, sentiment, and key quotes from a raw interview transcript.
- `scripts/assumption_mapper.py` — reads assumptions from a CSV or inline input, scores by `risk × (1 − certainty)`, and outputs a prioritized test plan with suggested validation method per category (desirability, viability, feasibility, usability). See `references/frameworks.md` → "Assumption Mapping" for CSV format and usage examples.
- `scripts/sample_size_calculator.py` — computes required sample size (per variant and total) for two-proportion A/B tests from baseline rate, MDE (absolute or relative), alpha, and power. Run with `python3 scripts/sample_size_calculator.py --baseline-rate 0.12 --mde 0.02 --mde-type absolute`.
- `scripts/landing_page_scaffolder.py` — generates a complete landing page as HTML or Next.js TSX from a JSON config. Supports four Tailwind design styles and all major section types (hero, features, pricing, testimonials, CTA, footer). Run with `python scripts/landing_page_scaffolder.py config.json --format tsx --output LandingPage.tsx`. See `references/landing-page-generation.md` for the JSON input format.
- `scripts/user_story_generator.py` — generates INVEST-compliant user stories with Given-When-Then acceptance criteria, Fibonacci story point estimates, priority assignments, and sprint loading from an epic definition. Run `python scripts/user_story_generator.py` to generate stories from a sample epic, or `python scripts/user_story_generator.py sprint 30` to produce a sprint plan for a given capacity.

## Use this skill for

- PRDs and feature briefs
- prioritization and roadmap tradeoffs (RICE, ICE, MoSCoW, Kano, Value vs Effort)
- customer discovery planning, interview guides, and synthesis from calls, interviews, or analytics
- JTBD mapping and Opportunity Solution Tree construction
- assumption mapping, test prioritization, and discovery sprint planning
- problem validation (interviews, friction mapping, analytics triangulation)
- solution validation (concept tests, prototypes, fake-door, limited beta)
- experiment design and success metrics
- hypothesis writing with falsification criteria
- launch or release readiness from a product perspective (go-to-market checklists)
- decision memos for "should we build this"
- quarterly product strategy and planning
- company -> product -> team OKR design
- product vision and positioning docs
- strategic roadmap themes and sequencing
- competitive landscape analysis and response options
- product org design, hiring logic, and team-scaling proposals
- metrics framework selection (North Star, HEART, funnel analysis)
- CRO audits: diagnosing underperforming marketing pages (homepage, landing page, pricing, feature, campaign pages) across seven dimensions — value proposition clarity, headline effectiveness, CTA placement, visual hierarchy, trust signals, objection handling, and friction points — delivering quick wins, high-impact changes, A/B test hypotheses, and copy alternatives
- landing page creation and optimisation (hero, features, pricing, testimonials, CTA, SEO — Next.js TSX or standalone HTML)
- landing page copy using PAS, AIDA, BAB, and 4Ps frameworks
- landing page A/B test planning and conversion pattern selection
- content strategy: content pillar development, searchable vs. shareable planning, keyword research by buyer stage, topic cluster mapping, and content prioritization
- buyer psychology analysis: understanding cognitive biases, decision-making patterns, and behavioral triggers that affect conversion, onboarding, and retention
- persuasion and influence strategy: applying reciprocity, social proof, authority, scarcity, commitment, and framing principles to campaigns, copy, and product flows
- pricing psychology: anchoring, charm pricing, decoy effect, mental accounting, and Rule of 100 for pricing page design and discount framing
- conversion optimisation strategy: diagnosing low conversion using Hick's Law, BJ Fogg Behavior Model, Activation Energy, and Nudge Theory
- retention and churn reduction: applying Endowment Effect, Switching Costs, Status-Quo Bias, and Goal-Gradient to improve activation and reduce churn
- growth strategy: identifying feedback loops, flywheel opportunities, network effects, and critical mass thresholds
- product marketing context: building or updating a `.agents/product-marketing-context.md` file using the 12-section framework — product overview, target audience, personas, problems, competitive landscape, differentiation, objections, switching dynamics, customer language, brand voice, proof points, and goals
- ICP definition and persona documentation: mapping B2B buying roles (User, Champion, Decision Maker, Financial Buyer, Technical Influencer) or B2C persona profiles
- customer language capture: extracting verbatim customer phrases from interviews, reviews, or support tickets and embedding them in positioning and copy
- switching dynamics analysis: identifying push and pull forces, habit resistance, and anxiety forces (JTBD Four Forces) to diagnose where a buying journey stalls
- brand voice documentation: defining tone, communication style, personality traits, and copy conventions
- proof point curation: quantified outcomes, testimonials, and value themes for sales and marketing use
- UX copy writing and review: CTAs, error messages, empty states, confirmation dialogs, tooltips, loading states, and onboarding copy — applying Clear-Concise-Consistent-Useful-Human principles
- interface copy audits: reviewing existing microcopy for tone consistency, missing resolution steps in errors, vague CTA labels, or onboarding sequencing problems
- user story writing (INVEST criteria, Given-When-Then acceptance criteria)
- story point estimation and Fibonacci scale guidance
- epic breakdown into sprint-sized stories
- sprint planning, capacity calculation, and sprint loading
- backlog prioritization (WSJF, priority tiers)
- sprint ceremony facilitation (planning, standup, review, retro)
- velocity tracking, burndown patterns, and sprint metrics
- Definition of Done creation and validation

## Boundary

This skill is for product thinking, not engineering task breakdown.

- Focus on user problem, value, risks, scope, and metrics.
- When the request is strategic, focus on direction, alignment, sequencing, and organizational implications before features.
- If the user later wants implementation slicing, hand off to an engineering-planning skill.

## Default output modes

Choose the mode that best matches the request:

- **PRD**: for a feature or product initiative
- **Decision memo**: for yes/no or option comparison
- **Prioritization brief**: for backlog, roadmap, or sequence questions
- **Experiment brief**: for hypothesis testing
- **Discovery sprint plan**: for structured 1–2 week discovery cycles with explicit hypotheses, validation tests, and a proceed/pivot/stop decision
- **Assumption test plan**: for mapping and prioritizing desirability, viability, feasibility, and usability assumptions before committing to build
- **Release brief**: for launch readiness and rollout criteria
- **Strategy brief**: for quarterly or annual direction-setting
- **OKR cascade**: for company -> product -> team alignment
- **Vision brief**: for product vision, positioning, or strategic narrative
- **Competitive brief**: for market map, differentiation, and response options
- **Org design brief**: for product team structure, hiring, or scaling proposals
- **CRO audit**: for an existing marketing page — diagnoses conversion problems across seven dimensions and delivers a prioritized four-bucket report: quick wins, high-impact changes, A/B test ideas, and copy alternatives
- **Landing page**: for a complete, conversion-optimised landing page as Next.js TSX or HTML — includes copy, SEO meta, structured data, and performance targets
- **User story**: for one or more INVEST-compliant stories with Given-When-Then acceptance criteria and story point estimates
- **Epic breakdown**: for decomposing an epic into sprint-sized stories with dependencies and sequencing
- **Sprint plan**: for a sprint loading plan with committed and stretch items, capacity calculation, and sprint goal
- **Backlog brief**: for a prioritized backlog slice with WSJF or weighted scoring and recommended next sprint selection
- **Content strategy**: for a full content plan — content pillars, priority topic list with keyword and buyer stage mapping, and topic cluster map with hub and spoke structure
- **Psychology brief**: for applying buyer psychology and persuasion models to a specific challenge — maps the challenge to relevant mental models, explains the mechanism, and gives concrete implementation recommendations
- **Product marketing context**: for creating or updating `.agents/product-marketing-context.md` using the 12-section framework — auto-drafted from existing materials (README, landing page, package.json) or gathered conversationally section-by-section
- **UX copy review**: for auditing existing interface copy — delivers a comparison table of current vs. recommended copy with rationale and localization notes per component
- **UX copy brief**: for writing net-new interface copy for a screen, flow, or component — collects context, user state, tone, and constraints before producing copy variants

## Required thinking order

Work in this order unless the user explicitly overrides it:

1. Problem
2. User or segment
3. Evidence
4. Desired outcome
5. Strategic lens or planning context
6. Options and tradeoffs
7. Recommended scope, bets, or alignment model
8. Success metrics
9. Risks and open questions

Do not jump straight to features.

If the request is about quarterly or organizational strategy, reason in this sequence before writing recommendations:

1. Company context and why now
2. Strategic focus: growth, retention, revenue, innovation, or operational effectiveness
3. Product contribution to company outcomes
4. Team implications and cross-functional dependencies
5. Measurement cadence and review rules

## PRD contract

When producing a PRD, include these sections:

### 1. Context

- What changed now
- Why this matters
- Who is affected

### 2. Problem

- Current user pain
- Existing workaround or failure
- Why the current state is unacceptable

### 3. Goal and non-goals

- One clear outcome statement
- Explicit non-goals to prevent scope creep

### 4. Users and use cases

- Primary user
- Secondary stakeholder if relevant
- Top use cases in bullets

### 5. Proposed solution

- Product behavior, not implementation detail
- Key user-facing flows
- Important edge cases

### 6. Success metrics

- Leading metric
- Guardrail metric
- Adoption or quality threshold
- Time window for evaluation

### 7. Risks and open questions

- Product, operational, or adoption risk
- Unknowns that should block confidence

## Strategy brief contract

When producing a strategy brief, include:

### 1. Strategic context

- What changed now
- Why this quarter or planning window matters
- Which company objective or market force is driving the need

### 2. Strategic focus

- Primary lens: growth, retention, revenue, innovation, or operational
- Why this lens is the right one now
- What other lenses are intentionally deprioritized

### 3. Outcome statement

- One clear strategic outcome
- 3-5 measurable goals or KPIs
- Assumptions vs evidence

### 4. Strategic bets

- The few bets that matter most
- Why each bet supports the outcome
- What is explicitly not a bet this cycle

### 5. Roadmap themes

- Theme name
- Target user or segment
- Value created
- Dependency or sequencing note

### 6. Cross-functional alignment

- Required partners
- Decision owners
- Constraints or coordination risks

### 7. Review cadence

- Weekly or bi-weekly review motion
- Signals that trigger course correction
- End-of-period evaluation criteria

## OKR cascade contract

When producing OKRs, work top-down unless the user provides a fixed starting point.

Include:

- company objective(s)
- product objective(s) and explicit parent linkage
- team objective(s) only when the team structure is known or can be reasonably assumed
- measurable key results with current state and target when available
- contribution assumptions if product is only part of the company outcome
- alignment risks, overlaps, and missing coverage

Quality rules:

- Limit each level to 3-5 objectives
- Limit each objective to 3-5 key results
- Prefer outcomes over project completion
- Avoid key results with no baseline or no target unless the lack of baseline is called out as a blocker
- Name conflicts between teams instead of hiding them

## Vision brief contract

When producing a product vision or positioning brief, include:

- category or market frame
- future state for the user
- why this product is credibly different
- core narrative or positioning line
- product principles or strategic constraints
- 12-18 month implications for roadmap themes

## Competitive brief contract

When comparing competitors or alternatives, include:

- target segment and buying trigger
- alternatives the user actually compares against
- comparison dimensions that matter in the decision
- where we are stronger, weaker, or merely different
- implications for positioning, roadmap, pricing, or sequencing
- what evidence would change the conclusion

## Org design brief contract

When the user asks about team structure or scaling, include:

- current team shape and constraints
- proposed team topology by mission or surface
- responsibilities and ownership boundaries
- what roles should be added later, not now
- coordination risks, management overhead, and hiring tradeoffs
- what outcomes justify the org change

## Prioritization contract

When ranking work, score or discuss these dimensions explicitly:

- user impact
- business impact
- urgency or timing pressure
- confidence in evidence
- effort or complexity
- strategic alignment

End with:

- recommended order
- what not to do yet
- what evidence would change the ranking

## Experiment contract

For experiments, include:

- hypothesis
- target user
- change being tested
- success metric
- guardrail metric
- sample or observation window
- ship, iterate, or stop rule

Avoid fake precision when inputs are weak.

### Hypothesis format

Write every hypothesis in If/Then/Because format:

- **If** we change `[intervention]`
- **Then** `[metric]` will change by `[expected direction/magnitude]`
- **Because** `[behavioral mechanism]`

A hypothesis without a causal reason is a guess, not a hypothesis.

### Hypothesis quality checklist

- [ ] Contains explicit intervention and audience
- [ ] Specifies measurable metric change
- [ ] States plausible causal reason
- [ ] Includes expected minimum effect
- [ ] Defines failure condition

### Metric definition

Before running a test, lock in:

- **Primary metric**: the single decision metric (one only; owns the ship/no-ship call)
- **Guardrail metrics**: protect quality and risk — error rate, latency, churn proxy, support contacts
- **Diagnostic metrics**: explain why the change happened; do not use as decision gate unless pre-specified

### Sample size and MDE

Use `scripts/sample_size_calculator.py` when the user needs a concrete number. Inputs needed:

- baseline conversion rate or baseline mean
- minimum detectable effect (MDE) — set by business value threshold, not optimism
- significance level (alpha, default 0.05)
- statistical power (default 0.80)

Smaller MDE requires larger sample size. Surface this tradeoff explicitly.

### Experiment prioritization

When the user has multiple experiments to sequence, score with ICE:

- **Impact**: potential upside if hypothesis is true
- **Confidence**: quality of supporting evidence
- **Ease**: cost, speed, and complexity to run

ICE Score = (Impact × Confidence × Ease) / 10

### Stopping rules

Define before launch — never after observing results:

- fixed sample size per group, or fixed duration with minimum run window
- guardrail breach thresholds that pause the test
- avoid continuous peeking with fixed-horizon inference
- do not change the success metric or targeting mid-test

### Statistical interpretation guardrails

When reading results, apply these rules:

- p-value < alpha indicates evidence against null — not guaranteed truth
- a confidence interval crossing zero means directional claim is uncertain
- wide intervals imply low precision even when technically significant
- an effect can be statistically significant but too small to matter — compare to implementation cost and strategic KPI impact
- check for novelty effects: run long enough for behavior stabilization; inspect returning users and delayed cohorts separately
- investigate sample ratio mismatch and instrumentation drift before concluding

See `references/statistics-reference.md` for PM-level explanations of each concept.
See `references/experiment-playbook.md` for experiment type selection, pre-launch checklist, and post-test readout template.

## Agile Execution

Load `references/user-story-templates.md` and `references/sprint-planning-guide.md` when the request involves user story writing, sprint planning, backlog management, or velocity tracking.

### User Story contract

When producing user stories, include for each:

- **Narrative**: As a `[persona]`, I want to `[action]`, so that `[benefit]`
- **Acceptance criteria**: minimum 3 Given-When-Then statements covering happy path, validation, and error handling
- **Story points**: Fibonacci estimate (1, 2, 3, 5, 8 — stories at 13+ must be split)
- **Priority**: Critical / High / Medium / Low with one-line justification
- **INVEST pass**: confirm the story is Independent, Negotiable, Valuable, Estimable, Small, Testable — call out any failures

Story types to distinguish: Feature, Improvement, Bug Fix, Integration, Enabler (technical).

See `references/user-story-templates.md` for full template library and antipattern guide.

### Epic breakdown contract

When breaking down an epic:

1. State the epic scope and success criteria
2. Identify all affected personas
3. List capabilities per persona
4. Group into stories of ≤8 points each
5. Map dependencies between stories
6. Sequence for incremental value delivery — ship a walking skeleton before polishing edge cases

Splitting techniques to apply: by workflow step, by persona, by data type, by operation (CRUD), happy-path-first.

### Sprint plan contract

When producing a sprint plan, include:

- **Team velocity and availability factor** — show the adjusted capacity calculation
- **Sprint goal** — one measurable objective, not a list of features
- **Committed stories** — 80–85% of adjusted capacity, listed with priority tag and point value
- **Stretch goals** — 10–15% additional, clearly marked as optional
- **Dependencies and risks** — anything that could block a committed story
- **Definition of Done** — the team-level checklist that makes a story "done-done"

Sprint loading format:

```
Sprint Capacity: [N] points
Sprint Goal: [Clear, measurable objective]

COMMITTED ([N] points):
[H] US-001: Title (N pts)
...

STRETCH ([N] points):
[L] US-00N: Title (N pts)
```

See `references/sprint-planning-guide.md` for ceremony guides, WSJF prioritization, and velocity tracking.

## Product Marketing Context

When the user needs to establish foundational positioning, create or update a marketing context file, define an ICP, document customer language, or prepare shared context for downstream marketing work, load and follow `references/product-marketing-context.md`.

### Auto-Draft Workflow

When existing materials are available, analyze them to generate an initial draft before asking any questions:

| Source | Signals to extract |
|---|---|
| `README.md` | Product description, key benefits, target audience |
| Landing page copy | Headline framing, feature positioning, social proof |
| `package.json` / `pyproject.toml` | Category signals from keywords and description |
| Blog posts / docs | Customer language, use cases, competitive framing |

Mark inferred sections with `[INFERRED — please validate]`. Present the draft and iterate from there.

### Conversational Path

When no materials are available, gather context section-by-section. Ask specific questions with examples rather than open-ended prompts. Validate each section before moving to the next.

### Output

Save the completed document to `.agents/product-marketing-context.md`. This file is automatically referenced by landing page generation, content strategy, competitive briefs, and psychology briefs — updating it once updates the context for all downstream tasks.

### Product Marketing Context contract

When producing a product marketing context document, deliver all 12 sections:

1. Product Overview (one-liner, description, category, type, business model)
2. Target Audience (company type, size, geography, decision-makers, primary use case, JTBD statements)
3. Personas — User, Champion, Decision Maker, Financial Buyer, Technical Influencer (B2B); or single profile (B2C)
4. Problems and Pain Points (core challenge, solution gaps, cost, emotional tension, urgency drivers)
5. Competitive Landscape (direct, secondary, indirect competitors with shortcomings; category perception)
6. Differentiation (differentiators with mechanism explanation, benefits, selection reasons, category frame)
7. Objections and Anti-Personas (top 3 objections with responses; non-ideal fit profiles; disqualifiers)
8. Switching Dynamics — JTBD Four Forces (Push, Pull, Habit, Anxiety)
9. Customer Language (verbatim problem and solution descriptions; terminology; sources)
10. Brand Voice (tone, communication style, personality traits, copy conventions)
11. Proof Points (quantified outcomes, notable customers, testimonials, value themes)
12. Goals (business objective, primary conversion action, baseline metrics, target improvement)

Quality bar: the Customer Language section must contain verbatim quotes — inferred or polished language is a failure mode. Objections must be written in prospect language. Switching Dynamics must include at least one anxiety force.

## Landing Page Generation

When the user asks to create, improve, or A/B test a landing page, marketing page, homepage, or conversion-optimised web page, load and follow `references/landing-page-generation.md`.

### Inputs to collect before generating

```
Product: [name]
Tagline: [one sentence value prop]
Target audience: [who they are]
Key pain point: [what problem you solve]
Key benefit: [primary outcome]
Pricing tiers: [free/pro/enterprise or describe]
Design style: dark-saas | clean-minimal | bold-startup | enterprise
Copy framework: PAS | AIDA | BAB
```

Ask only for missing fields. Infer design style and copy framework from brand voice when existing content is provided.

### Reference loading guide

| Task | Load |
|---|---|
| Auditing an existing marketing page for conversion problems | `page-cro.md` |
| Generating or scaffolding a landing page | `landing-page-generation.md` |
| Writing or reviewing headlines, CTAs, body copy | `landing-page-copy-frameworks.md` |
| Selecting layouts, social proof, pricing presentation | `landing-page-patterns.md` |
| Pre-launch SEO validation | `landing-page-seo-checklist.md` |
| Applying buyer psychology to copy, pricing, or UX flows | `marketing-psychology.md` |

### Landing page contract

When producing a landing page, deliver:

- Complete TSX components (or HTML if specified) — not wireframes or descriptions
- All Tailwind classes matching the chosen design style
- Actual product copy using the chosen framework — not placeholder text
- SEO meta tags and Open Graph tags
- Structured data where applicable (FAQPage, Product)
- Explicit Core Web Vitals notes (preload hero image, lazy-load below fold, explicit image dimensions)

Validate against `references/landing-page-seo-checklist.md` before final output. Fix every gap inline.

## Product rules

- Never present a feature list without tying it to a user problem.
- Every recommendation needs an outcome and a metric.
- Distinguish assumptions from evidence.
- Prefer narrower scope with stronger learning over broad scope with vague value.
- Name the tradeoff. If something gets easier, say what gets worse or deferred.
- Use exact terms for segments, roles, and journeys; avoid "users" when a narrower label exists.
- For strategic planning, choose one primary planning lens. Do not mix growth, retention, revenue, innovation, and operational work into one vague strategy.
- For OKRs, trace product and team goals back to the parent outcome.
- For org proposals, tie headcount or team changes to outcomes, not status or intuition.

## Failure modes to avoid

- PRDs that are really implementation plans
- roadmaps without sequencing logic
- prioritization based only on opinions
- experiments without a stop rule
- experiments with underpowered sample sizes leading to false negatives
- stopping tests early on random spikes
- changing experiment targeting or success metric mid-test
- running too many simultaneous changes without isolation
- declaring success from p-value alone without checking effect size and CI
- ignoring sample ratio mismatch and instrumentation drift
- success metrics that are vanity metrics
- non-goals omitted, causing hidden scope expansion
- OKRs that are just project lists
- strategic plans that mix too many priorities to drive action
- competitor analysis with no implications for decisions
- team-scaling proposals that ignore management and coordination cost
- user stories written as implementation tasks ("implement Redis") rather than user outcomes
- compound stories that mix multiple personas or operations into one ("create, edit, and delete users")
- acceptance criteria that are untestable ("the system should be better") or missing unhappy-path coverage
- stories estimated at 13+ points that should be split before sprint planning
- sprint plans committed at 100% capacity with no buffer for unplanned work
- sprint goals that are just a list of features with no measurable outcome
- velocity used as a performance metric rather than a planning input
- applying psychological models without identifying the specific behavior to influence first
- using scarcity or urgency tactics that aren't genuine, eroding trust when customers discover the manipulation
- optimizing a local bottleneck (copy, CTA color) when the real constraint is upstream (traffic, positioning)
- ignoring second-order effects of persuasion tactics (flash sales training price sensitivity, overly aggressive onboarding prompts increasing churn)
- content topic lists not mapped to buyer stage or funnel position
- treating all content as equally searchable — shareable content must be genuinely novel to earn links and shares
- hub-and-spoke clusters built without auditing existing content for gaps and overlap
- skipping keyword validation on "obviously good" topics
- case studies without quantified results
- prioritizing search volume over customer impact
- product marketing context written in internal language rather than customer language
- customer language section filled with polished summaries instead of verbatim quotes
- personas that conflate the User and the Decision Maker into one profile, hiding the champion role
- switching dynamics missing the anxiety forces — the most commonly skipped and often the actual blocker
- differentiation described as outcomes only ("faster") without explaining the mechanism that makes it true
- anti-personas left vague ("not for enterprise") rather than specific enough to be useful in qualification
- reusing one product marketing context document across multiple products without adapting it to each ICP
- CRO audits that list 30 issues of equal weight — prioritize by leverage, not completeness
- auditing visual design before diagnosing the value proposition — hierarchy problems are nearly always downstream of a weak message
- recommending CTA color changes before fixing CTA copy — language is leverage, color is noise
- writing A/B test ideas without estimating the traffic required — an underpowered test is worse than no test
- ignoring traffic source context in a CRO audit — a paid social page and an organic search page have different intent profiles and need different fixes
- treating mobile as a secondary concern in CRO analysis — mobile traffic exceeds 60% on most paid campaigns
- writing CTAs from the product's perspective ("Submit form") rather than the user's ("Send my application")
- error messages that expose raw technical codes or end with no actionable step
- empty states that only say "No data" with no path forward
- confirmation dialogs for irreversible actions that do not warn the user of consequences
- onboarding copy that front-loads all concepts before the user has hands-on context
- tone inconsistency across surfaces — formal in settings, playful in errors, neutral in onboarding — signalling no shared voice

## Quality bar

- The reader can answer "why this" and "why now" quickly.
- Scope and non-goals are explicit.
- Success metrics are concrete enough to evaluate later.
- Open questions expose what is still unknown rather than hiding it.
- Strategic outputs show why this focus wins over alternatives.
- OKRs are aligned vertically and do not create obvious cross-team conflict.
