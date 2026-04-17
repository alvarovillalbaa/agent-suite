# SEO + GEO Measurement Framework

KPIs, tools, tracking setup, and competitive benchmarking for traditional and AI-mediated search.

---

## The Measurement Challenge

Traditional SEO has mature tooling. GEO measurement is still emerging.

**Well-measured (SEO):**
- Organic traffic (Google Analytics, Search Console)
- Keyword rankings (Ahrefs, Semrush)
- Click-through rates (Search Console)
- Core Web Vitals (Search Console, PageSpeed Insights)
- Backlink growth (Ahrefs, Majestic)

**Harder to measure (GEO):**
- AI citation frequency
- Brand mentions in AI responses
- Traffic from AI referrals
- Content included in AI training datasets

**Proxy metrics for GEO:**
- "Direct" traffic increases (users who saw your brand in AI)
- Unlinked brand mention growth (social listening)
- Brand search volume growth (Search Console branded queries)
- AI referral traffic (Search Console → Referring Sites → AI domains)

---

## SEO KPIs by Goal

### Traffic Goal

| KPI | Target | Tool | Frequency |
|-----|--------|------|-----------|
| Organic sessions | +X% month-over-month | GA4 | Monthly |
| Organic users | +X% month-over-month | GA4 | Monthly |
| Impressions | Trending up | Search Console | Weekly |
| Clicks | Trending up | Search Console | Weekly |
| New keyword rankings | # of new page-1 keywords | Ahrefs/Semrush | Monthly |

### Rankings Goal

| KPI | Target | Tool | Frequency |
|-----|--------|------|-----------|
| Average position | Improving | Search Console | Weekly |
| Keywords in top 3 | Growing count | Ahrefs/Semrush | Monthly |
| Keywords in top 10 | Growing count | Ahrefs/Semrush | Monthly |
| Featured snippet wins | Growing count | Ahrefs/Semrush | Monthly |
| AI Overview appearances | Track manually or with tools | Manual | Monthly |

### Authority Goal

| KPI | Target | Tool | Frequency |
|-----|--------|------|-----------|
| Domain Rating/Authority | Upward trend | Ahrefs/Moz | Monthly |
| Referring domains | Growing unique count | Ahrefs/Majestic | Monthly |
| Link acquisition rate | +X new links/month | Ahrefs | Monthly |
| Branded search volume | Growing | Search Console | Monthly |

### Conversion Goal

| KPI | Target | Tool | Frequency |
|-----|--------|------|-----------|
| Organic conversion rate | Benchmark by channel | GA4 | Monthly |
| Organic revenue/leads | Growing | GA4 | Monthly |
| CTR by landing page | Improving | Search Console | Monthly |
| Assisted organic conversions | Understand full path | GA4 | Monthly |

---

## Google Search Console Setup

### Essential Reports

**Performance → Search Results**
- Date range: Compare last 3 months vs prior 3 months
- Queries: Sort by impressions descending — find quick wins (high impressions, low position)
- Pages: Identify top-performing pages to build on
- Devices: Check mobile vs desktop performance gap
- Search type: Web, Image, Video separately

**Coverage (Indexing)**
- Resolve all "Error" status pages
- Investigate "Excluded" pages — some exclusions are valid (noindex), some are problems
- Common issues: Discovered but not indexed, Crawled but not indexed

**Core Web Vitals**
- Fix all "Poor" URLs
- Address "Needs Improvement" URLs
- Use URL inspection to see field data vs lab data discrepancy

**Enhancements (Rich Results)**
- Monitor schema errors after implementation
- Track impressions from rich results by type

### Search Console Queries Analysis

**Find quick-win keywords** (high impressions, position 5-20):
1. Performance → Search Results
2. Filter by impressions > 500 (adjust based on site size)
3. Filter by position 5-20
4. These pages are close to page-1 or featured snippet positions
5. Optimize these pages first for maximum traffic gain

**Find CTR improvement opportunities:**
1. Performance → Search Results
2. Sort by CTR ascending (lowest CTR first)
3. Filter by impressions > 100 (enough data to be significant)
4. Pages with low CTR despite impressions need better title/description

**Find keyword cannibalization:**
1. Performance → Search Results
2. Filter by a specific keyword
3. Look at "Pages" tab
4. If multiple pages are ranking for the same keyword, you have cannibalization

### Search Console API for Automation

```python
# Python example: Pull top queries for automated reporting
from googleapiclient.discovery import build
from google.oauth2.credentials import Credentials

def get_search_analytics(property_url, start_date, end_date):
    service = build('searchconsole', 'v1', credentials=creds)

    response = service.searchanalytics().query(
        siteUrl=property_url,
        body={
            'startDate': start_date,
            'endDate': end_date,
            'dimensions': ['query', 'page'],
            'rowLimit': 1000,
            'metrics': ['clicks', 'impressions', 'ctr', 'position'],
        }
    ).execute()

    return response.get('rows', [])
```

---

## GEO Measurement: Tracking AI Visibility

### Method 1: Manual AI Query Monitoring

**Weekly/monthly process:**
1. Open ChatGPT, Claude, Perplexity, Gemini in separate tabs
2. Ask your 10-20 most important business queries
3. Document in a spreadsheet:
   - Query asked
   - Platform (ChatGPT, Perplexity, etc.)
   - Was your brand cited? (Y/N)
   - Where in the response?
   - Which competitors were cited?
4. Track trend over time

**Query types to monitor:**
- "What is the best [your category]?"
- "Compare [your brand] vs [top 3 competitors]"
- "How do I [core use case you serve]?"
- "What are the top [your category] tools?"
- Queries for your branded terms

### Method 2: Perplexity Citation Tracking

Perplexity cites sources visibly. Monitor:
- Pages Perplexity cites when answering your core queries
- Whether your domain appears in Perplexity citations
- Which of your pages gets cited most

**Tool:** BrightEdge, Semrush AI, and Zoominfo have AI visibility features. Manual is free.

### Method 3: GA4 AI Referral Traffic

AI assistants with browsing capabilities send referral traffic:
- GA4 → Reports → Acquisition → Traffic Acquisition
- Filter by Source/Medium for AI domains

**AI referral sources to monitor:**
- `chat.openai.com` (ChatGPT browsing)
- `perplexity.ai`
- `bard.google.com` / `gemini.google.com`
- `bing.com` (Copilot referrals)
- `you.com`
- `phind.com`

### Method 4: Brand Search Volume as GEO Proxy

When AI recommends your brand, users often search for it directly afterward.

- Search Console → Performance → Queries → Filter by brand name
- Track branded query impressions and clicks over time
- Increasing brand search = increasing brand awareness (some from AI)

### Method 5: Unlinked Brand Mentions

AI mentions your brand but users don't always click. Track brand mentions across the web:

**Tools:**
- Google Alerts (free, basic)
- Mention.com (paid)
- Brandwatch (enterprise)
- Ahrefs Alerts (paid, good for press mentions)

**Track:**
- Number of brand mentions per month
- Sentiment (positive/negative/neutral)
- Which domains are mentioning you
- Are AI-generated articles or AI tool outputs mentioning you?

---

## Competitive Benchmarking

### SEO Competitive Analysis

**Metrics to compare against 3-5 competitors:**

| Metric | Your Site | Comp 1 | Comp 2 | Comp 3 |
|--------|-----------|--------|--------|--------|
| Domain Authority (Moz) | — | — | — | — |
| Domain Rating (Ahrefs) | — | — | — | — |
| Organic keywords | — | — | — | — |
| Estimated organic traffic | — | — | — | — |
| Referring domains | — | — | — | — |
| Avg. content word count | — | — | — | — |
| Featured snippet count | — | — | — | — |
| Core Web Vitals (CWV) | — | — | — | — |

**Tools:** Ahrefs Site Explorer, Semrush Domain Overview (enter competitor URL)

### GEO Competitive Analysis

**For each AI platform (ChatGPT, Perplexity, Gemini, Claude):**

| Query | Your Brand Cited? | Competitor Cited | What They Had |
|-------|-------------------|------------------|---------------|
| Best [category] tool | — | Competitor A | Comprehensive guide |
| How to [use case] | — | Competitor B | Step-by-step tutorial |
| [Category] for [audience] | — | Competitor C | Specific use-case page |

**Identify the pattern:** What content type and signals do cited competitors have that you don't?

### Keyword Gap Analysis

**Find keywords competitors rank for that you don't:**
1. Ahrefs → Site Explorer → Competitor domain
2. Content Gap → Enter your domain
3. Filter: Competitor position 1-10, Your position Not in top 100
4. These are content opportunities

**Priority matrix:**
- High search volume + your site has topical authority = Priority 1
- High search volume + need to build authority = Priority 2
- Low volume + high commercial intent = Priority 3
- Low volume + purely informational = Priority 4

---

## Core Web Vitals Monitoring

### Tools and Their Data Types

| Tool | Data Type | When to Use |
|------|-----------|-------------|
| Search Console → CWV | Real user data (field data) | Ongoing monitoring |
| PageSpeed Insights | Field + Lab data | Single URL testing |
| Chrome DevTools | Lab data | Debugging specific issues |
| WebPageTest | Lab data with filmstrip | Deep performance analysis |
| Lighthouse CI | Lab data | Automated testing in CI/CD |

### Monitoring Alerts

Set up alerts in Search Console for:
- New URL errors in Core Web Vitals
- Coverage errors (new 404s, server errors)
- Manual actions (penalty notifications)
- Schema markup errors

**Email alerts:** Search Console → Settings → Email preferences → Enable all notifications

---

## SEO Reporting Template

Monthly report structure:

```
## SEO Monthly Report — [Month Year]

### Executive Summary
- Overall organic traffic: X,XXX (+X% vs prior month)
- Top keyword wins this month: [list]
- Top issues to resolve: [list]

### Traffic Performance
- Organic sessions: X,XXX (vs X,XXX prior month, +X%)
- Organic users: X,XXX (+X%)
- Impressions: XXX,XXX (+X%)
- Clicks: X,XXX (+X%)
- Average CTR: X.X% (+/-X%)
- Average position: X.X (+/-X.X)

### Keyword Ranking Changes
- Keywords moved to top 3: +X (now X total)
- Keywords moved to top 10: +X (now X total)
- Keywords lost from top 10: X
- New keywords entering top 100: X

### Top Pages Performance
| Page | Sessions | Change | Avg. Position |
|------|----------|--------|---------------|
| /page-1 | X,XXX | +X% | X.X |

### Technical Health
- Coverage errors: X (change from last month)
- Core Web Vitals issues: X pages Poor LCP, X pages Poor INP, X pages Poor CLS
- Schema errors: X

### GEO Visibility
- AI citation checks performed: X platforms, X queries
- Citation rate: X% (cited in X of X queries checked)
- Brand search volume: X,XXX impressions (change: +/-X%)
- AI referral traffic: X sessions

### Priority Actions Next Month
1. [Action] — Expected impact: High/Medium/Low
2. [Action] — Expected impact: High/Medium/Low
3. [Action] — Expected impact: High/Medium/Low
```

---

## ROI Measurement

### Organic Traffic Value

```
Organic Traffic Value = Monthly Organic Clicks × Average CPC for Those Keywords

Example:
- 10,000 organic clicks/month
- Average CPC for your keywords: $2.50
- Organic traffic value: $25,000/month
- That's $300,000/year in "earned" traffic you'd pay for via Google Ads
```

### SEO Conversion Tracking in GA4

Set up conversion events in GA4:
- Form submissions (`form_submit`)
- Free trial starts (`trial_start`)
- Purchases (`purchase`)
- Account signups (`sign_up`)

Track these by first-touch source to see organic search contribution:
- GA4 → Reports → Acquisition → Traffic Acquisition
- Compare conversion rate: Organic Search vs Paid Search vs Direct

### GEO Attribution

GEO-driven conversions are difficult to attribute directly. Use:
- Brand search volume increase as a leading indicator
- Qualitative surveys: "How did you hear about us?" → "Saw it recommended by AI"
- Direct traffic increase (AI users often navigate directly after getting a recommendation)
- UTM parameters on any links AI assistants generate when linking to your site
