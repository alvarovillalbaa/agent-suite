---
name: x-articles
description: Use when editing, auditing, or generating X/Twitter Articles from existing content or knowledge, and you need a structured analysis plus a high-engagement long-form Article optimized for skimmability, voice, and conversion.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file read/write.
---

# X Articles

## Overview

Transform raw drafts or knowledge into **high-engagement X/Twitter Articles** using a rigorous **8-step editorial framework**.

This skill always delivers **two artifacts**:
- **Part 1 – Structured analysis** against the 8-step X Articles framework with scores and specific fixes.
- **Part 2 – Complete optimized rewrite** of the Article, ready to publish on X.

Use this to:
- Turn blog posts, notes, transcripts, or outlines into polished X Articles.
- Audit underperforming Articles and rebuild them for reach and conversion.
- Standardize long-form content quality for X across a team.

## When to Use

Use this skill when:
- A user says they want to **write, optimize, or audit an X/Twitter Article**.
- They paste an **existing Article draft** and ask for improvements, editing, or optimization.
- They provide **source material** (blog posts, research, transcript, notes) and want it turned into an X Article.
- They explicitly mention: “X Article”, “Twitter Article”, “long-form on X”, “Articles on X”, “premium X article”.

Do **not** use this when:
- The ask is just for a short X post / thread (use normal prompting or a different skill).
- The user wants a generic blog article for their site (use `knowledge-to-blogs`).
- The user wants multi-channel repurposing (use `content-syndication` as the orchestrator).

## Inputs You Should Collect

Before applying the framework, ensure you have:

- **Source content**
  - Existing X Article draft; or
  - Blog post / essay / newsletter; or
  - Bullet notes, research, transcript, or knowledge dump.

- **Purpose & audience (mandatory)**
  - **Primary outcome**: what should the reader think/feel/do after reading?
  - **Target reader**: who is this for (as specifically as possible)?
  - Context: are they cold, problem-aware, or solution-aware?

- **Constraints / preferences**
  - Desired **tone**: analytical, spicy, personal, neutral, etc.
  - Approximate **length**: short (~800–1,200 words) vs deep (~1,500–2,500).
  - Any **brand/voice rules** you must respect.
  - Whether they want **strong CTA** (email list, product, follow, subscription).

If any of these are missing, ask 2–4 concise clarification questions before proceeding.

## Outputs You Must Produce

Always output in two clearly labeled parts:

1. **PART 1 – ANALYSIS & ASSESSMENT**
   - **Overall score** out of 80 (10 points per criterion).
   - **Top 3 critical fixes** (highest-leverage improvements).
   - Detailed commentary for each of the 8 framework steps (see below), with:
     - Short explanation of current state.
     - Concrete issues, preferably referencing specific sentences/sections.
     - Specific, actionable fixes (rewrites, reordering, additions/removals).

2. **PART 2 – COMPLETE OPTIMIZED REWRITE**
   - **3 title options** with explanation of why each works.
   - Recommended title with reasoning.
   - **Hook** (1–2 sentences, 2–4 lines max).
   - Full Article body with:
     - Clear subheadings every 3–5 paragraphs.
     - 2–4 line paragraphs, one idea per paragraph.
     - Bolded key insights.
     - Evidence (stats, stories, examples) immediately after claims.
     - Visual suggestions inline.
   - **Strong close** with summary, CTA, and engagement question.
   - A short **rewrite spec summary** (word count, reductions, improvements).

## 8-Step X Articles Framework

Use this section as your canonical checklist for Part 1 scoring and commentary.

### 1. Clear Purpose (Score: X/10)

**Goal:** The Article should have a single, sharp purpose.

Assess:
- **Reader outcome clarity**: Is it obvious what the reader should think, feel, or do after reading?
- **Audience specificity**: Does it clearly speak to a specific persona (e.g., “senior ICs burned out on meetings”) vs “everyone”?

For the analysis:
- Describe whether the purpose is **crisp, fuzzy, or missing**.
- Call out contradictions (e.g., teaching beginners but assuming expert context).
- Propose a **one-sentence purpose statement** as a fix:
  - “After reading, a [target persona] should [do/understand/decide X].”

### 2. Title & Hook (Score: X/10)

**Goal:** Make it impossible not to click or keep reading.

Evaluate:
- **Title**:
  - Is it **specific** (numbers, nouns, stakes)?
  - Does it **spark curiosity** without being clickbait?
  - Does it **promise a clear benefit or outcome**?
- **Hook (first 1–2 sentences)**:
  - Does it grab attention in **≤ 10–20 words**?
  - Does it **connect the reader’s pain** to the promise?

In Part 1:
- Show **BEFORE** title and hook.
- Provide **3 improved titles** labeled Option 1/2/3.
- Provide a single improved hook.
- Briefly explain which copy principles you applied (specificity, contrast, contrarian angle, etc.).

In Part 2:
- Reuse or refine the **best title option**.
- Ensure the hook flows smoothly into the rest of the article.

### 3. Skimmability Structure (Score: X/10)

**Goal:** Skimmers should extract the value in seconds, especially on mobile.

Checklist (mark ❌/✅ in analysis):
- Paragraphs are **2–4 lines max**.
- **Subheadings every 3–5 paragraphs.**
- Lists instead of text walls when enumerating items.
- **Bold key insights** in almost every section.
- One idea per paragraph.

In Part 1:
- Identify **offending paragraphs** (too dense, mixed ideas).
- Show **BEFORE** (dense paragraph) and **AFTER** (split into 2–3 short paragraphs with bold insight).

In Part 2:
- Enforce these structural rules strictly.
- Design headings to be **scannable** and self-explanatory, not clever.

### 4. Natural, Recognizable Voice (Score: X/10)

**Goal:** Sound like a sharp, opinionated friend—not a corporate memo.

Assess:
- Is the tone **overly formal, generic, or lifeless**?
- Does it talk **to the reader (“you/your”)** or just about abstract people?
- Does it feel like it could only be written by this specific person?

In Part 1:
- Provide 2–3 **BEFORE → AFTER** sentence rewrites showing:
  - More direct language.
  - Stronger point of view.
  - Clear “you” framing.

In Part 2:
- Maintain a **consistent voice** aligned with user preferences (analytical, spicy, personal).
- Use contractions and conversational phrasing while staying sharp.

### 5. Show, Don’t Just Tell (Score: X/10)

**Goal:** Every strong claim is backed by **proof** that makes it stick.

Assess:
- Highlight **unsupported claims**: bold them and note “no proof”.
- Identify where you need:
  - Stats or data points.
  - Short personal stories.
  - Before/after examples.
  - Embedded X posts or screenshots.

In Part 1:
- For 3–5 key claims:
  - Quote the claim.
  - Propose a specific stat, story, or example that would prove it.

In Part 2:
- After each major claim, immediately follow with **one concrete support element**.

### 6. Ruthless Editing (Score: X/10)

**Goal:** Cut 20–30% of words without losing meaning.

Assess:
- Estimate **original word count** vs target (20–30% reduction).
- Identify filler and padding:
  - “very”, “really”, “in order to”, “just”, “actually”, etc.
- Note repetitive points and tangents to cut or compress.

In Part 1:
- Provide at least 2 filler-heavy sentences with **BEFORE → AFTER** rewrites.

In Part 2:
- Aim for **sharp, economical sentences.**
- Remove repetition; merge overlapping points into one strong insight.

### 7. Visuals & Formatting (Score: X/10)

**Goal:** Break the scroll with visuals and make the page inviting.

Assess:
- Current **visual count** (images/charts/embeds).
- Target: roughly **1 visual every 200–300 words**.
- Use of:
  - Bold headers.
  - Whitespace and spacing.
  - Mixed visual types (images, screenshots, charts, embedded posts).

In Part 1:
- Propose **specific visual ideas**:
  - “After paragraph 3: chart showing X vs Y.”
  - “Embed your post about [topic] here.”
  - “Screenshot of dashboard / workflow here.”

In Part 2:
- Insert **[IMAGE:]** or **[EMBED:]** annotations with short descriptions at logical breakpoints.

### 8. Strong Close (Score: X/10)

**Goal:** End with punch, clarity, and a next step.

Assess:
- Does the Article **fizzle out** or build to a conclusion?
- Are main points summarized into **clear takeaways**?
- Is there a **specific CTA** (subscribe, reply, share, try a concrete action)?
- Is there an **engagement question** that makes replying easy?

In Part 1:
- Show **BEFORE** close.
- Propose a rewritten **AFTER** close that:
  - Summarizes 2–4 key takeaways.
  - Includes one clear, bolded CTA.
  - Ends with a simple question that invites replies.

In Part 2:
- Implement that strong close and align CTA with user’s actual goal (followers, subscribers, signups, etc.).

## End-to-End Workflow

When this skill triggers, follow this sequence:

1. **Clarify brief (if needed)**
   - Confirm purpose, audience, tone, constraints, and target outcome.
   - Ask only the minimum set of questions required to remove ambiguity.

2. **Ingest source material**
   - Read the user’s draft or source content carefully once end-to-end.
   - If content is extremely long, focus on sections most relevant to the stated purpose.

3. **Run 8-step diagnostic (Part 1)**
   - Score each of the 8 steps from 0–10.
   - Compute and show the **overall score (X/80)**.
   - List the **Top 3 critical fixes** that would most improve performance.
   - Under each step, give concise but concrete commentary and **example rewrites**.

4. **Design optimized outline**
   - Based on the 8-step findings, sketch a simple outline:
     - Hook + setup
     - 2–4 core sections (with subheadings)
     - Optional advanced/edge section
     - Takeaways + close
   - Make sure the outline:
     - Flows logically.
     - Covers the promised value from the title.
     - Matches the reader’s level and attention span.

5. **Write the complete optimized Article (Part 2)**
   - Generate **3 title options**, recommend one.
   - Write the hook and all sections according to the outline.
   - Enforce all structural rules (short paras, subheadings, bold insights, visuals).
   - Integrate evidence and examples, using user-provided data where possible.

6. **Summarize rewrite specs**
   - At the end of Part 2, add a short specs block:
     - Word count: Original ≈ X → Optimized ≈ Y (Z% reduction).
     - Paragraph counts and structure notes.
     - Number of subheadings, bold insights, visual suggestions.
     - Subjective scores for **mobile skimmability** and **conversational voice** (X/10).

7. **Offer follow-up options**
   - Close by briefly listing what you can do next if the user wants:
     - Refine specific sections.
     - Try a different tone.
     - Create alternative titles/hooks/closes.
     - Adjust for a different or more niche audience.

## Common Mistakes to Avoid

- **Overwriting description or background** instead of sharpening the core insight.
- **Keeping the user’s weak title or hook** out of politeness—always propose stronger alternatives.
- **Ignoring the user’s voice** and rewriting everything in a generic tone; instead, upgrade clarity and impact while preserving their POV.
- **Forgetting visuals and formatting**; X Articles are read on mobile feeds, not static PDFs.
- **Producing only feedback**; this skill must always output a full optimized rewrite (Part 2), not just critique.

---

## Detailed Scoring Rubrics

Use these rubrics to make the 0–10 scores consistent and comparable across Articles.

### Purpose

- **0–2 (Broken):** No clear audience, goal, or outcome. Article could be about anything for anyone.
- **3–4 (Vague):** Some hint of who it’s for or why, but purpose is broad or contradictory.
- **5–6 (Decent):** Purpose is identifiable but not sharp; article tries to do too much.
- **7–8 (Strong):** Clear, focused purpose for a specific persona; minor tightening needed.
- **9–10 (Elite):** Single, sharp purpose with explicit “after reading, you will…” clarity.

### Title & Hook

- **0–2:** Generic or misleading title; hook is missing or reads like a random first sentence.
- **3–4:** Title states topic but not stakes; hook restates title without tension or curiosity.
- **5–6:** Title is okay and hook is serviceable but not scroll-stopping.
- **7–8:** Title and hook work together to create curiosity + clear value; minor polish needed.
- **9–10:** Title is specific, curiosity-driving, and benefit-rich; hook grips in one line and flows perfectly into body.

### Skimmability

- **0–2:** Walls of text, no subheadings, hard to scan on mobile.
- **3–4:** Some headings or lists, but large dense sections remain.
- **5–6:** Mostly readable with a few dense spots; skimmers can get ~60% of value.
- **7–8:** Clean breaks, good subheadings, bullets used well; skimmers get ~80–90% of value.
- **9–10:** Designed for skimming: every section has a bolded insight, headings tell the story, no heavy blocks.

### Voice

- **0–2:** Corporate, robotic, or AI-generic; no point of view.
- **3–4:** Understandable but bland; feels like any generic content marketer.
- **5–6:** Some personality or POV, but inconsistent; too formal in places.
- **7–8:** Distinctive, conversational, and aligned to reader; minor tone mismatches.
- **9–10:** Instantly recognizable voice; feels like a sharp, specific human talking directly to the reader.

### Show, Don’t Tell

- **0–2:** Pure abstraction or advice; almost no examples, data, or stories.
- **3–4:** Occasional examples but generic or misaligned; most claims unsupported.
- **5–6:** At least one concrete example per major section; some claims still naked.
- **7–8:** Nearly every big claim is backed with a story, stat, or example.
- **9–10:** Rich tapestry of stories, numbers, and “before/after” moments; proof and narrative are inseparable.

### Editing

- **0–2:** Rambling, repetitive, full of filler; no visible editing.
- **3–4:** Some trimming but still verbose; multiple tangents remain.
- **5–6:** Reasonably tight; could cut another 10–20% without losing meaning.
- **7–8:** Lean, strong lines; only a handful of small trims left.
- **9–10:** Every sentence earns its place; no fluff; reading feels frictionless.

### Visuals & Formatting

- **0–2:** No visual thinking; giant text slabs; hard on the eyes.
- **3–4:** One or two visuals but random or decorative; formatting inconsistent.
- **5–6:** Basic formatting and a couple of purposeful visuals; still opportunities to break up text.
- **7–8:** Visuals and formatting are intentionally placed and support understanding.
- **9–10:** Layout feels like a designed experience; visuals, spacing, and typography work together.

### Close

- **0–2:** Abrupt or meandering end; no summary, no CTA.
- **3–4:** Some concluding statements but weak or generic; no clear next step.
- **5–6:** Decent summary or CTA but not both; little emotional punch.
- **7–8:** Strong recap and a meaningful CTA; might need sharper language.
- **9–10:** Memorable closing line, crisp takeaways, and a CTA that feels natural and compelling.

---

## Audience & Tone Adaptation

You must adapt structure and language based on **reader sophistication** and **tone preference**.

### Reader Sophistication Matrix

- **Beginner / Newcomer**
  - More definitions and context; fewer assumptions.
  - Use simple analogies; avoid jargon or explain it inline.
  - Prioritize **single clear win** from the Article.

- **Intermediate Practitioner**
  - Assume basic vocabulary and context.
  - Focus on **mistakes, plateaus, and leverage points**.
  - Use stories that mirror their day-to-day reality.

- **Advanced / Expert**
  - Skip basics; acknowledge tradeoffs and edge cases.
  - Use precise language and sharper contrarian takes.
  - Emphasize frameworks, meta-principles, and mental models.

### Tone Styles

Support at least these tones on request:

- **Analytical**
  - Emphasize structure, data, and logic.
  - Use clear sub-claims and mini-conclusions.
  - Keep voice confident but measured.

- **Spicy / Contrarian**
  - Open with a **strong, opinionated claim** or myth-bust.
  - Use sharper phrasing and contrast (“Everyone tells you X. They’re wrong.”).
  - Still back everything with evidence; avoid empty hot takes.

- **Personal / Vulnerable**
  - Lead with a story or moment; use first person more.
  - Show failures and uncertainty; end with grounded takeaways.
  - Keep it tight—avoid diary style rambling.

In Part 2, explicitly state the **chosen audience level and tone**, and ensure examples, vocabulary, and CTA all align.

---

## Edge Cases & Failure Modes

Handle these situations explicitly:

- **Source is extremely short (e.g., a tweet or two)**
  - Ask for **supplemental context** or expand by asking:
    - “What’s the story behind this?”
    - “What problem were you solving when you wrote this?”
  - If still short, create a **concise Article** (~600–800 words) and note limitations.

- **Source is extremely long (multi-thousand word doc)**
  - Ask user which **segment or outcome** matters most.
  - Summarize the long input, then focus the Article on **one core arc**.

- **Conflicting goals**
  - If user wants “deep technical detail” and “very short read”:
    - Offer an explicit tradeoff:
      - Option A: **Short tactical Article** with links/notes.
      - Option B: **Deeper Article** with technical detail.
  - State which option you picked.

- **Brand or legal constraints**
  - If user mentions compliance, confidentiality, or legal review:
    - Avoid concrete claims you cannot support from the input.
    - Prefer phrasing like “may”, “can”, “often” over hard guarantees.

---

## Mini End-to-End Example (Abstracted)

Use this as a mental model when transforming real content.

1. **Input**
   - 1,500-word blog post about “productivity systems”.
   - Goal: Convert to an X Article that **sells a newsletter**.

2. **Diagnosis (Part 1)**
   - Purpose: 5/10 – tries to teach 5 frameworks at once.
   - Title & hook: 4/10 – generic title, slow intro.
   - Skimmability: 3/10 – large paragraphs, few headings.
   - Voice: 6/10 – some personality, inconsistent.
   - Show vs tell: 4/10 – advice heavy, few stories.
   - Editing: 5/10 – can cut ~30%.
   - Visuals: 2/10 – none.
   - Close: 3/10 – ends in a generic conclusion paragraph.
   - Top 3 fixes:
     1. Narrow purpose to **one transformation**.
     2. Rebuild title/hook around that specific change.
     3. Split into sections with bolded mini-takeaways + 2 concrete stories.

3. **Outline**
   - Hook: “You don’t need another app; you need fewer priorities.”
   - Section 1: Why most productivity systems quietly fail.
   - Section 2: The 3-rule system that actually survives a busy week.
   - Section 3: Before/after story from the author’s own workflow.
   - Takeaways: 3 bullets.
   - Close: CTA to subscribe for weekly systems breakdowns.

4. **Rewrite (Part 2)**
   - New title options:
     - “You Don’t Need a New Productivity App—You Need Fewer Priorities”
     - “Why 95% of Productivity Systems Fail After Week 2”
     - “The 3 Rules That Saved My Calendar from Chaos”
   - Hook and body follow all structural rules above.

---

## Interactions with Other Skills

- When the user’s input is **pure knowledge** (notes, research, transcripts) and they haven’t yet produced a blog or long-form, consider:
  - First using `knowledge-to-blogs` to create a **canonical blog article**.
  - Then using `x-articles` to create a **long-form X-native version**.

- When the user wants **multi-channel distribution**:
  - Use this skill to generate the **X Article**.
  - Then call `content-syndication` to derive X threads, LinkedIn posts, Substack variants, etc., ensuring each one is differentiated.

