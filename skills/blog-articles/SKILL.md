---
name: blog-articles
description: Use when turning raw notes, research, transcripts, or existing content into well-structured blog articles, including outline and full draft optimized for clarity, depth, and SEO for a defined audience.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file read/write.
---

# Knowledge to Blogs

## Overview

Convert **raw knowledge** (notes, research, transcripts, tweets, threads, docs) into **publishable blog articles** that are clear, opinionated, and conversion-aware.

This skill focuses on:
- **Extracting the core argument** from messy or fragmented inputs.
- Designing a **compelling narrative + structure** appropriate for the target reader.
- Producing a **complete blog draft** (or multiple variants) with strong intros, clear sections, evidence, and CTAs.

Use this when you need a **blog article** (for your site, company blog, or publication) rather than an X Article or multi-channel syndication.

## When to Use

Use this skill when:
- The user says “turn these notes/research into a blog”, “write a blog article on X”, or “create a blog post from this”.
- They paste:
  - A **knowledge dump** (notes, bullet lists, research snippets).
  - A **meeting or podcast transcript**.
  - A **Twitter/X thread** or social posts.
  - A rough **outline** or half-written draft that needs full development.
- The target output is a **blog article** (not primarily an X Article, newsletter, or LinkedIn post).

Prefer other skills when:
- They explicitly want an **X/Twitter Article** → use `x-articles`.
- They want **multi-channel repurposing** → use `content-syndication` to orchestrate.

## Inputs You Should Collect

Always gather:

- **Source knowledge**
  - Paste of notes, transcript, research excerpts, old posts, or an existing rough draft.
  - If multiple sources, ask which one is **primary** vs secondary.

- **Target reader & context**
  - Who is the article for? (Job title, level, context, pain level.)
  - What do they **already know** vs what needs explanation?
  - Where will this appear? (Personal blog, company blog, dev docs, etc.)

- **Goal of the article**
  - Inform / teach / persuade / activate / sell / attract subscribers?
  - Desired **reader action** at the end (subscribe, share, sign up, reply, book a call).

- **SEO & constraints (if relevant)**
  - Primary keyword/phrase and 3–7 supporting phrases.
  - Hard constraints: length range, must-include points, must-avoid topics.
  - Tone preferences: authoritative, contrarian, playful, formal, etc.

If any of these are missing and matter for quality, ask **2–3 targeted questions** before drafting.

## Output Requirements

Always produce:

1. **Concept & angle**
   - 2–3 **possible angles** for the article:
     - E.g., “Practical playbook”, “Contrarian teardown”, “Personal story + lessons”.
   - Briefly explain which angle you’ll choose and why it best serves the goal and audience.

2. **SEO-aware outline (if SEO matters)**
   - H1 (title) and H2/H3 structure.
   - Where primary and secondary keywords will naturally appear.
   - Indicate which sections are **must-read** vs optional depth.

3. **Full blog article draft**
   - Strong **title** optimized both for clickability and clarity.
   - **Opening hook** (2–4 short paragraphs) that:
     - Names the reader’s problem or aspiration.
     - Positions the piece as *for them* specifically.
   - 3–6 **main sections** with clear, descriptive headings (H2/H3).
   - **Evidence**: examples, stories, data, or frameworks grounded in the source knowledge.
   - **Smooth transitions** between sections.
   - **Clear close** with 2–4 key takeaways and a concrete CTA.

4. **Metadata**
   - Approximate word count.
   - Suggested slug, meta description, and 3–5 headline variations.
   - Optional: 2–4 internal link ideas (if it’s for a site with existing content).

## Blog Structure Patterns

Use these common, proven structures. Select the best fit rather than inventing a new pattern each time.

### 1. Problem → Insight → Playbook

- **Best when**: The goal is to help readers solve a known pain.
- Structure:
  - Hook: Name the problem and why current advice fails.
  - Insight: Explain the missing mental model or principle.
  - Playbook: Concrete steps, checklists, or templates.
  - Close: Recap + “start here today” CTA.

### 2. Story → Lessons → Application

- **Best when**: The source material contains a story (case study, founder journey, failure, success).
- Structure:
  - Story: Tell the narrative with enough vivid detail to care.
  - Lessons: Extract 3–5 explicit principles.
  - Application: Show how the reader can apply them in their situation.
  - Close: Encourage sharing or trying one lesson this week.

### 3. Myth → Reality → New Approach

- **Best when**: The angle is contrarian or aimed at busting bad advice.
- Structure:
  - Hook: Call out common myth or bad default.
  - Reality: Show why it fails (data, examples).
  - New approach: Present a better model and how to adopt it.
  - Close: “If you still do X, try Y instead for a week.”

When using this skill:
- Explicitly state **which pattern** you picked.
- Adjust the pattern to the user’s audience and voice.

## Detailed Workflow

When this skill is triggered, follow this process:

### Step 1 – Normalize and digest the inputs

- If the user gives messy notes or transcripts:
  - Quickly cluster content into **themes** (e.g., “problem stories”, “frameworks”, “tactics”, “examples”).
  - Identify **what’s actually interesting or non-obvious** vs generic advice.
  - Note any **strong lines or quotes** worth preserving verbatim.

### Step 2 – Clarify purpose and reader

- From the inputs + user context, write for yourself:
  - One sentence: **“This article is for [persona] who [current state] and want [desired state].”**
  - One sentence: **“After reading, they should [do/decide/understand X].”**
- Use these as filter for what to include or cut.

### Step 3 – Choose angle and structure

- Propose 2–3 **angles** and pick one.
- Select a **structure pattern** (Problem → Insight → Playbook, Story → Lessons → Application, or Myth → Reality → New Approach, or a simple “Guide with sections” if none fit).
- Surface this explicitly so humans can see the rationale.

### Step 4 – Draft the outline

- Create a **scannable outline** with:
  - H1 title candidate.
  - 3–6 H2 sections with 1-line descriptions.
  - H3s only when necessary to avoid walls of text.
- Ensure logical progression and avoid duplicative sections.
- Make sure each main section **earns its existence**:
  - Would the article be meaningfully worse if we cut this section?

### Step 5 – Write the article

While drafting:
- Keep paragraphs to **2–4 lines**, one idea per paragraph.
- Use **concrete examples** frequently, pulled from the source material when possible.
- Use the user’s **phrasing** selectively to preserve voice, but rewrite heavily for clarity.
- For SEO-aware pieces:
  - Use the **primary keyword** in the title, first 100 words, and at least one H2.
  - Sprinkle secondary keywords naturally; avoid keyword stuffing.

### Step 6 – Sharpen and compress

- Do a second pass focused on:
  - Cutting repetition, hedging, and filler words (“very”, “really”, “in order to”, etc.).
  - Tightening intros to each section (no slow ramp-ups).
  - Ensuring **each section starts with context** and ends with a **mini-takeaway**.
- If the article is much longer than needed:
  - Call out an optional **“deep dive” section** that can be moved to a separate post.

### Step 7 – Close with teeth

- Ensure the close:
  - Recaps the key 2–4 takeaways in plain language.
  - Includes a **specific CTA** aligned with the user’s stated goal.
  - Optionally, asks **one simple question** to invite comments or replies.

## Quality Bar and Checks

Before you present the result, quickly self-check:

- **Clarity**
  - Could a smart but busy reader understand the core message in **30 seconds of skimming**?
  - Do headings and bolded lines alone tell a coherent story?

- **Originality**
  - Does the article contain at least **1–2 non-obvious insights** or ways of framing the problem?
  - Is it clearly better than a generic “10 tips” listicle?

- **Voice fit**
  - Does the tone match what the user asked for (spicy vs measured, personal vs institutional)?
  - Are any jarring tone shifts present? Smooth them.

- **Truthfulness**
  - Are all examples and claims consistent with the provided knowledge?
  - If you extrapolate, mark it as **(opinion)** rather than fact.

## Common Mistakes to Avoid

- Turning notes into a **dump of everything** instead of a **single, clear argument**.
- Over-indexing on SEO at the cost of **actual insight**.
- Writing in a generic “content marketing voice” and erasing the author’s personality.
- Producing a wall of text with no structure, headings, or visual cues.
- Ignoring the requested **audience or goal** and writing for yourself.

---

## Quality Rubrics (0–10)

Use these heuristics to self-score drafts and push them toward top-tier quality.

### 1. Core Argument

- **0–2 (Broken)**: No clear thesis; article is just a list of points.
- **3–4 (Fuzzy)**: Some main idea, but buried or contradicted by tangents.
- **5–6 (OK)**: Thesis is present but not stated crisply; reader must infer it.
- **7–8 (Strong)**: One clear, memorable central argument; everything relates back to it.
- **9–10 (Elite)**: Argument is sharp, slightly contrarian or non-obvious, and repeatable in one sentence.

### 2. Structure & Flow

- **0–2**: Random sequence of paragraphs; no meaningful sections.
- **3–4**: Sections exist but ordering feels arbitrary; some repetition.
- **5–6**: Reasonable structure; could consolidate or reorder for more impact.
- **7–8**: Clean, logical progression; each section sets up the next.
- **9–10**: Structure itself teaches; reader can learn the model just by skimming headings.

### 3. Evidence & Depth

- **0–2**: Mostly opinion; no examples, data, or stories.
- **3–4**: Occasional examples, often generic or shallow.
- **5–6**: At least one concrete example per major section.
- **7–8**: Rich mix of stories, stats, frameworks, and counter-examples.
- **9–10**: Feels like the writer has **lived the problem**; depth is obvious without being bloated.

### 4. Reader Relevance

- **0–2**: Could apply to anyone; no specific reader is targeted.
- **3–4**: Vague references to roles; no real empathy or context.
- **5–6**: Reasonable alignment with target reader but still generic.
- **7–8**: Feels written *for* a specific persona and situation.
- **9–10**: Reader feels deeply seen; article anticipates their objections and constraints.

### 5. Voice & Differentiation

- **0–2**: AI-generic marketing voice; indistinguishable from boilerplate content.
- **3–4**: Functional but bland; any company could have written it.
- **5–6**: Some POV and personality; a few standout lines.
- **7–8**: Consistent, recognizable voice; clear stance.
- **9–10**: Unique combination of tone, analogies, and POV; obviously this specific author.

---

## Audience & Article Type Matrix

Different combinations of audience and purpose call for different **article archetypes**.

### Audience Dimension

- **Builders / Practitioners**
  - Care about: concrete tactics, examples, “what should I do Monday”.
  - Tolerate: some theory if it unlocks better tactics.

- **Leaders / Execs**
  - Care about: tradeoffs, risks, ROI, narratives that help them decide.
  - Tolerate: less step-by-step detail, more synthesis.

- **General / Curious**
  - Care about: stories, relatable explanations, broad implications.
  - Tolerate: very little jargon, minimal deep technicals.

### Article Type Dimension

- **Playbook / How-To**
  - Promise: “After this, you can do X.”
  - Structure: Problem → Framework → Step-by-step → Pitfalls → Checklist.

- **Thought Leadership / Opinion**
  - Promise: “Here’s a new way to think about X.”
  - Structure: Myth → Reality → Reframe → Implications → Call to rethink.

- **Case Study / Narrative**
  - Promise: “Here’s what happened when we did X.”
  - Structure: Context → Challenge → Approach → Result → Lessons → Transfer.

When drafting:
- State explicitly: **“This is a [Audience] × [Type] article.”**
- Let this choice drive which details to keep vs cut.

---

## SEO-Aware Process (Without Killing Insight)

Only apply this when the user indicates SEO matters.

### Step 1 – Intent & Keyword Mapping

- Ask for:
  - **Primary keyword** (e.g., “AI performance reviews”, “hiring rubric”).
  - 3–7 **supporting phrases** (variants, long-tails, related problems).
- Infer **search intent** from phrasing:
  - “what is / definition” → explanatory.
  - “how to / template / checklist” → practical.
  - “vs / compare” → decision-support.

### Step 2 – Integrate Keywords Naturally

- Place the primary keyword:
  - In the **title** or a close variant.
  - In the **first 100 words**.
  - In at least **one H2**.
- Use secondary terms:
  - As labels for sections or bullet points.
  - When naming examples, problems, or use cases.
- Never:
  - Stuff the same exact phrase every other sentence.
  - Twist natural language just to jam in a keyword.

### Step 3 – On-Page Checklist

In metadata output, always include:
- **SEO title suggestion** (≤ 60 characters).
- **Meta description** (120–155 characters).
- **Suggested slug** (short, hyphenated, keyword-informed).

---

## Handling Messy Inputs (Transcripts, Dumps, Screenshots)

When the source is chaotic:

1. **Segment by topic**
   - Create quick buckets:
     - Problems / complaints.
     - Ideas / proposed solutions.
     - Stories / anecdotes.
     - Data / specific claims.

2. **Identify potential hooks**
   - Look for:
     - Emotional lines (“I was embarrassed when…”, “We almost missed payroll…”).
     - Strong numbers (“we cut time-to-fill by 37%”).
     - Contrarian statements (“most performance reviews are a waste of time”).

3. **Extract candidate lessons**
   - Frame notes into **lesson sentences**:
     - “If you [do X], you’ll likely [get Y].”
   - Group similar lessons to avoid redundancy.

4. **Choose an angle and discard aggressively**
   - Delete entire buckets that don’t serve the chosen thesis.
   - You’re not archiving calls; you’re writing an argument.

---

## Example End-to-End Flow (Abstracted)

Use this template mentally; don’t hard-code content.

1. **User input**
   - 4 pages of meeting notes about “improving engineering performance reviews”.
   - Goal: blog article for **engineering managers** to share internally.

2. **Normalize**
   - Themes:
     - Pain: reviews feel bureaucratic, not useful.
     - Insight: reviews fail when expectations are not set early.
     - Tactics: quarterly calibration, rubric examples, skip-level feedback.
   - Strong lines:
     - “If reviews are a surprise, you failed months ago.”

3. **Angle & type**
   - Audience: **Leaders / Execs**.
   - Type: **Thought leadership + light playbook**.
   - Angle statement:
     - “Performance reviews are not a form; they’re a year-long conversation with a deadline.”

4. **Outline**
   - H1: “If Performance Reviews Are a Surprise, You Failed Months Ago”
   - H2: Why Traditional Reviews Backfire on Engineering Teams.
   - H2: Set Expectations Quarterly, Not Annually.
   - H2: The Simple Rubric That Makes Reviews Boring (in a Good Way).
   - H2: How to Fix Your Next Review Cycle in 30 Days.
   - H2: Key Takeaways for Your Team.

5. **Draft**
   - Use real phrases from notes to preserve voice.
   - Weave in 1 story + 1 rubric + 1 “start this month” checklist.

6. **Sharpen**
   - Cut out generic HR advice sections from the notes.
   - Tighten each section intro to 2–3 lines.

7. **Close**
   - CTA: “Share this with your EMs and agree on one change before next quarter.”

---

## Interactions with Other Skills

- If the user later wants:
  - An **X Article** version → feed your final blog draft into `x-articles`.
  - A **multi-channel pack** (X, LinkedIn, Substack, Medium) → feed the canonical blog into `content-syndication`.

- If the user wants stronger discoverability after drafting:
  - Run the final article through `seo-and-geo` for SEO, GEO, and AEO improvements.

- When used as part of a pipeline:
  - `blog-articles` defines the **canonical argument and structure**.
  - `x-articles` shapes it into **X-native long-form**.
  - `content-syndication` breaks it into **channel-native variants**.
