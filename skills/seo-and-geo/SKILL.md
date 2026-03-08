---
name: seo-and-geo
version: 1.0.0
description: This skill should be used when the user wants to "optimize for SEO", "improve GEO", "get cited by ChatGPT", "appear in AI Overviews", "do an SEO audit", "optimize for Perplexity", "do AEO", "optimize for voice search", "add structured data", "improve E-E-A-T", "implement schema markup", "build topical authority", "optimize meta tags", "fix Core Web Vitals", "improve click-through rate", or "get featured snippets". Covers all three discovery disciplines: SEO (Search Engine Optimization), GEO (Generative Engine Optimization), and AEO (Answer Engine Optimization).
---

# SEO + GEO + AEO: Complete Optimization Skill

Three disciplines. One mission: make content discoverable by both humans and machines.

- **SEO** — Rank in Google, Bing, and traditional search engines
- **GEO** — Get cited by ChatGPT, Claude, Perplexity, Gemini, and other AI assistants
- **AEO** — Appear as direct answers in AI Overviews, featured snippets, and voice results

These disciplines share 80% of their practices. The 20% that differs matters enormously.

---

## Initial Assessment

Check for project context before starting:

1. Read `AGENTS.md` or any product/marketing context file if present
2. Identify the site type: SaaS, e-commerce, blog, documentation, local business, media
3. Identify the primary goal: traffic, citations, brand awareness, conversions
4. Identify current weak points: technical issues, thin content, no AI visibility

**Ask only what isn't in context:**
- What pages/keywords are priority?
- Who are the top competitors?
- Is there access to Google Search Console?
- What's the primary audience: humans searching Google, or AI-assisted researchers?

---

## Which Discipline to Apply

Use this decision framework:

| Situation | Primary Focus |
|-----------|---------------|
| Site not ranking in Google | SEO — Technical + On-page |
| Site ranks but gets no clicks | AEO — Featured snippets + SERP appeal |
| Brand not mentioned by AI assistants | GEO — Content authority + citation patterns |
| All three lacking | Full-stack: SEO foundation → AEO structure → GEO signals |
| New page being published | All three simultaneously |
| Existing page refresh | Audit first, then targeted improvements |

---

## The Optimization Stack

Apply in order — each layer depends on the one below:

```
Layer 4: GEO — AI citation authority
         ↑ requires trust signals, depth, named sources

Layer 3: AEO — Answer extraction
         ↑ requires clear structure, question-answer format

Layer 2: On-page SEO — Relevance signals
         ↑ requires crawlable, indexable content

Layer 1: Technical SEO — Foundation
         (crawlability, speed, indexation)
```

Fix technical issues before optimizing content. Fix on-page before chasing AI citations.

---

## Technical SEO: Foundation Checklist

**Crawlability**
- `robots.txt` does not block important pages
- XML sitemap exists, is valid, and submitted to Search Console
- No redirect chains (A→B→C — consolidate to A→C)
- No soft 404s returning 200 status
- Important pages reachable within 3 clicks from homepage

**Indexation**
- Canonical tags on all pages (`<link rel="canonical">`)
- No `noindex` on pages that should rank
- www/non-www and HTTP/HTTPS consistency
- Trailing slash consistency across the site

**Core Web Vitals** (Google ranking factor)
- LCP (Largest Contentful Paint) < 2.5s
- INP (Interaction to Next Paint) < 200ms
- CLS (Cumulative Layout Shift) < 0.1

**Mobile-first**
- Responsive design (not separate m.site)
- Same content served to mobile and desktop
- Tap targets ≥ 48px
- Viewport meta tag configured

For deep technical SEO: see [`references/technical-seo.md`](references/technical-seo.md)

For Next.js/React implementation: see [`references/nextjs-implementation.md`](references/nextjs-implementation.md)

---

## On-Page SEO: Relevance Signals

**Title tag** (50-60 characters)
- Primary keyword in first half
- Unique per page
- Compelling reason to click

**Meta description** (150-160 characters)
- Includes primary keyword
- States specific value: what the user will learn/get
- Starts with an action verb (not "Master")

**Heading structure**
- Single H1 with primary keyword
- Logical hierarchy: H1 → H2 → H3 (no skipping levels)
- H2s answer real user questions ("What is X?", "How does X work?")

**Content**
- Primary keyword in first 100 words
- Topic fully covered (not just surface-level)
- Satisfies search intent: informational / commercial / transactional / navigational
- Better depth than current top-ranking competitors

**Images**
- Descriptive filename (`closures-javascript-example.png` not `img001.png`)
- Alt text describes the image meaningfully
- WebP format, compressed, lazy-loaded

**Internal linking**
- Minimum 3-5 contextual links to related content per page
- Descriptive anchor text (not "click here" or "read more")
- No orphan pages (every page linked from at least one other)

For content strategy: see [`references/content-optimization.md`](references/content-optimization.md)

---

## AEO: Answer Engine Optimization

AEO wins featured snippets, AI Overviews, and voice results. The goal: make answers easy to extract.

**Definition pattern** (for "What is X?" queries):
```markdown
## What is [Term]?

[Term] is [1-sentence definition]. [2-3 sentences of context explaining why it matters].
```
Target: 40-60 words. Google extracts this for paragraph featured snippets.

**Step-by-step pattern** (for "How to X?" queries):
```markdown
## How to [Action]

[Brief overview sentence]

1. **[Step Name]**: [Clear action, 1-2 sentences]
2. **[Step Name]**: [Clear action, 1-2 sentences]
3. **[Step Name]**: [Clear action, 1-2 sentences]
```

**Comparison table pattern** (for "X vs Y" queries):
```markdown
| Feature | Option A | Option B |
|---------|----------|----------|
| [Key dimension] | [Value] | [Value] |
| Best for | [Use case] | [Use case] |
```

**FAQ pattern** (for "People Also Ask" boxes):
```markdown
## Frequently Asked Questions

### [Question exactly as users would search it]?

[Direct answer in first sentence]. [Supporting context in 2-3 more sentences].
```

**Key AEO principles:**
- Answer the question in the first sentence after the question heading
- Keep definitions to 40-60 words
- Use numbered lists for sequential processes
- Use bullet lists for unordered sets of items
- Add FAQ schema markup for FAQ sections

For complete AEO patterns with examples: see [`references/content-optimization.md`](references/content-optimization.md)

---

## GEO: Generative Engine Optimization

GEO is the practice of making content citation-worthy for AI systems (ChatGPT, Claude, Perplexity, Gemini, AI Overviews).

**The core insight:** AI systems cite sources that demonstrate clear authority, contain verifiable facts, and are structured for extraction.

**Five GEO signals:**

1. **Named attribution** — Quote real experts with names and credentials
   > "According to [Expert Name], [Title] at [Organization], [specific claim]."

2. **Cited statistics** — Include numbers with sources and dates
   > "According to [Source], [specific statistic], as of [year]."

3. **Self-contained statements** — Write sentences that make sense without surrounding context
   > "The optimal length for SEO blog posts is 1,500-2,500 words for competitive topics."

4. **Topical depth** — Cover a topic comprehensively (AI systems prefer authoritative sources over thin ones)

5. **Freshness signals** — Include publication dates, update dates, version numbers where relevant

**Content trust signals:**
- Author byline with credentials or bio
- Publication/last-updated date
- External citations and references
- HTTPS secure site
- Organization information (About page, contact info)

**Avoid AI-generated writing patterns** — AI systems are increasingly trained to discount content that looks machine-generated. See [`references/ai-signals.md`](references/ai-signals.md) for patterns to avoid.

For deep GEO strategies by content domain: see [`references/geo-strategies.md`](references/geo-strategies.md)

---

## Structured Data: Schema Markup

Schema markup directly communicates content meaning to search engines and AI systems.

**Always implement:**
- `Organization` on homepage
- `WebSite` with `SearchAction` on homepage
- `BreadcrumbList` on all pages
- `Article` on blog posts
- `FAQPage` on FAQ sections
- `HowTo` on step-by-step guides

For complete schema templates and JSON-LD: see [`references/structured-data.md`](references/structured-data.md)

For Next.js implementation (JsonLd component, builder utilities): see [`references/nextjs-implementation.md`](references/nextjs-implementation.md) and [`examples/nextjs-metadata.ts`](examples/nextjs-metadata.ts)

---

## E-E-A-T: The Trust Foundation

Google's E-E-A-T (Experience, Expertise, Authoritativeness, Trustworthiness) applies equally to traditional search ranking and AI citation decisions.

| Signal | SEO Impact | GEO Impact |
|--------|------------|------------|
| Author credentials | Medium | High |
| First-hand experience | High | High |
| External citations | High | Very High |
| Publication date/freshness | Medium | High |
| Organizational transparency | Medium | Very High |
| Accurate, verifiable claims | High | Very High |

**Implement E-E-A-T:**
- Add author bios with real credentials
- Include case studies or first-person experience
- Cite external authoritative sources
- Show publication and update dates
- Add organizational contact information and About page
- Link out to primary sources (studies, official docs, government data)

---

## Keyword Research Workflow

1. **Seed keywords** — Start with your core topic
2. **Intent classification** — Categorize by: Informational, Navigational, Commercial, Transactional
3. **Long-tail expansion** — Target "what is X", "how to X", "X vs Y", "best X for Y"
4. **People Also Ask mining** — Pull questions from Google PAA boxes
5. **Competitor gap analysis** — Find terms competitors rank for that you don't
6. **AI query patterns** — Consider how users phrase queries to AI assistants (more conversational, longer)
7. **Zero-click awareness** — Some queries will never drive clicks; optimize for brand awareness instead

**Keyword mapping principle:** One primary keyword cluster per page. Prevent cannibalization (multiple pages competing for the same keyword).

---

## Output Format

**For an SEO/GEO audit:**
```
## Audit: [Site/Page Name]

### Critical Issues (blocking ranking/citations)
- [Issue] → [Fix] — Impact: High

### On-Page Issues
- [Issue] → [Fix] — Impact: Medium

### GEO/AEO Opportunities
- [Opportunity] → [How to capitalize]

### Prioritized Action Plan
1. [Highest impact fix first]
2. ...
```

**For implementing optimizations:**
- Provide exact copy for title tags, meta descriptions
- Provide working code for schema markup
- Provide content templates for AEO patterns
- Verify fixes against checklists in references

---

## Measurement

Track progress with:
- **Google Search Console** — impressions, clicks, average position, Core Web Vitals
- **PageSpeed Insights** — Core Web Vitals field data
- **Rich Results Test** — validate structured data
- **Manual AI queries** — search in ChatGPT, Perplexity, Gemini for brand/topic mentions

For full measurement framework: see [`references/measurement.md`](references/measurement.md)

---

## Reference Files

| File | Contents |
|------|----------|
| [`references/technical-seo.md`](references/technical-seo.md) | Deep technical audit checklist, crawl issues, JS SEO, international SEO |
| [`references/geo-strategies.md`](references/geo-strategies.md) | GEO and AEO deep strategies by AI platform and content domain |
| [`references/structured-data.md`](references/structured-data.md) | Complete JSON-LD schema templates for every content type |
| [`references/content-optimization.md`](references/content-optimization.md) | Content strategy, search intent, featured snippets, internal linking |
| [`references/nextjs-implementation.md`](references/nextjs-implementation.md) | Next.js metadata API, sitemaps, robots.ts, dynamic OG images |
| [`references/ai-signals.md`](references/ai-signals.md) | E-E-A-T implementation, AI writing detection patterns to avoid |
| [`references/measurement.md`](references/measurement.md) | SEO + GEO KPIs, tracking setup, competitive benchmarking |

## Example Files

| File | Contents |
|------|----------|
| [`examples/nextjs-metadata.ts`](examples/nextjs-metadata.ts) | Next.js `generateMetadata` patterns and OG configuration |
| [`examples/schema-examples.json`](examples/schema-examples.json) | Ready-to-use JSON-LD schema blocks |
| [`examples/content-blocks.md`](examples/content-blocks.md) | AEO/GEO content templates with fill-in-the-blank patterns |

---

## Related Skills

- **seo-audit** — Reactive audit of an existing site's SEO issues
- **seo-review** — Page-level SEO review with scoring rubric
- **update-docs** — Keeping documentation fresh (freshness is a ranking signal)
