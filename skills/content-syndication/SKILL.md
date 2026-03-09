---
name: content-syndication
description: Use when repurposing a core content piece into tailored versions for multiple channels (e.g. X, LinkedIn, Substack, Medium) while changing angle, tone, and structure enough to avoid duplicate-content penalties.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file read/write.
---

# Content Syndication

## Overview

Turn **one original content asset** (usually a blog article, long-form doc, or X Article) into **distinct, channel-native pieces** across:

- X posts / X Articles
- LinkedIn posts and LinkedIn articles
- Substack newsletters
- Medium posts
- Optional extras: email newsletter snippet, landing page teaser, etc.

This skill focuses on:
- **Preserving the core idea** while changing **angle, voice, structure, and depth** per channel.
- Producing content that feels **native to each platform**, not copy-pasted.
- Avoiding near-duplicate content that could trigger **Google duplicate-content / canonical issues**.

## When to Use

Use this skill when:
- The user has a **source piece** (blog, deck, memo, X Article, report) and says:
  - “Turn this into X + LinkedIn + Substack versions.”
  - “Repurpose this blog into posts for different channels.”
  - “I want a distribution pack from this article.”
- They want **multiple channel outputs** from a single asset.

Prefer other skills when:
- They only need a **blog from knowledge** → use `blog-articles`.
- They only need a **single, high-quality X Article** → use `x-articles`.

## Inputs You Should Collect

Always gather:

- **Source content (canonical piece)**
  - Paste the full article / doc / notes, or link + pasted key sections.
  - Ask which part is **most important** if it is very long.

- **Target channels**
  - Explicit list: e.g., `["X thread", "X Article", "LinkedIn post", "LinkedIn article", "Substack newsletter"]`.
  - If not specified, suggest a default pack and confirm.

- **Priority goal(s)**
  - Audience growth (followers/subscribers).
  - Lead generation / pipeline.
  - Thought leadership / authority.
  - Engagement (comments, replies).

- **Audience & positioning**
  - Primary persona(s) and level.
  - Any constraints on brand voice, compliance, or what cannot be said.

If unclear, ask **2–3 sharp questions** to resolve ambiguity, not a long survey.

## Channels and Native Styles

Use these as **default patterns**; adjust based on the user’s brand.

### X / Twitter

#### 1. X Thread (posts)

- **Goal**: Fast, snackable, shareable highlights.
- Style:
  - 1 high-contrast **hook tweet**.
  - 5–15 follow-up posts, each a **complete thought**.
  - Short lines, clear language, minimal jargon.
  - Occasional emojis if on-brand and requested.
- Content:
  - Strip most context; highlight **key insights, tactics, or “aha” lines**.
  - Use numbered structure when listing steps.

#### 2. X Article

- Use `x-articles` for deep optimization when the user wants a full Article.
- In this skill, generate an **Article-ready draft** and note that `x-articles` can further optimize it.

### LinkedIn

#### 1. LinkedIn Post

- **Goal**: Professional visibility + conversation.
- Style:
  - 3–8 short paragraphs, 1–3 lines each.
  - Story or problem setup → 2–4 key insights → CTA/question.
  - Light use of bullets; minimal, relevant hashtags (1–5).
- Content:
  - Emphasize **credibility, context, and people** (teams, orgs, leaders).
  - Make it easy to comment with an opinion or experience.

#### 2. LinkedIn Article

- **Goal**: Longer-form professional article that can be referenced.
- Style:
  - 800–1,500+ words.
  - Clear headings (H2/H3), polished narrative, examples.
  - Slightly more formal than a blog if needed, but still human.

### Substack Newsletter

- **Goal**: Deep relationship and recurring engagement.
- Style:
  - Conversational, often in the **first person**.
  - Opening that feels like a direct note to the reader.
  - Mix of story + analysis + “here’s what to do”.
  - Strong CTA to reply, share, or upgrade to paid (if relevant).
- Content:
  - More context and reflection.
  - One or two **personal or behind-the-scenes elements**.

### Medium Article

- **Goal**: Broad audience and editorial-style piece.
- Style:
  - Strong narrative hook or moment.
  - Clear structure, but more literary/conceptual freedom.
  - Slightly more polished, less salesy than a company blog.

## Anti-Duplicate-Content Rules

To avoid thin or duplicate content across platforms:

- **Change at least two of:**
  1. **Angle** – who it’s for or what problem you foreground.
  2. **Structure** – story-first vs playbook-first vs myth-busting, etc.
  3. **Voice & examples** – personal story vs abstract, technical vs plain-language.

- **Rebuild, don’t paraphrase**
  - Do **not** just synonym-swap sentences.
  - Re-select which stories, examples, or data points you emphasize per channel.

- **Vary intros and closes**
  - Each channel should have its **own hook** and own close, not a lightly edited copy.

- **Length adaptation**
  - Use **meaningful compression or expansion**:
    - X posts: highly compressed.
    - LinkedIn / Medium: mid-depth.
    - Substack: deepest, with more commentary.

Always include a short **“Difference from source” note** per channel artifact, explaining:
- What changed (angle, structure, tone).
- Which parts of the original were dropped or added.

## Output Structure

For a given input and channel list, output:

1. **Syndication summary**
   - Brief description of the **core idea** of the source.
   - List of target channels.
   - 1–2 sentences on **global positioning** across all channels.

2. **Per-channel deliverables**

For each channel requested, create a subsection:

### Example format (for each channel)

#### Channel: X Thread

- **Hook post**
- **Thread posts 2–N**
- **CTA post**
- **Difference from source**

#### Channel: LinkedIn Post

- **Post body** (ready to copy-paste).
- Optional bullet list of **hashtags**.
- **Difference from source**.

#### Channel: LinkedIn Article

- **Title options** (2–3).
- **Outline** (H2/H3).
- **Full draft** (if requested) or at least 2–3 representative sections.
- **Difference from source**.

#### Channel: Substack Newsletter

- **Subject line options**.
- **Pre-header**.
- **Newsletter body** with intro, main content, CTA.
- **Difference from source**.

#### Channel: Medium Article

- **Title options**.
- **Opening section** with narrative hook.
- **Section overview** (H2s).
- **Difference from source**.

3. **Implementation notes**

- Short guidance on **publish order** and how to cross-link:
  - E.g., “Post the LinkedIn article first, then share the X thread linking to it,” etc.

## Detailed Workflow

When this skill triggers, follow these steps:

### Step 1 – Digest the source asset

- Read the content once end-to-end.
- Identify:
  - Core **thesis** or message.
  - 2–4 **strongest insights** or frameworks.
  - Any standout **stories, stats, or lines** worth keeping.

### Step 2 – Clarify channels and priorities

- Confirm which channels matter most.
- Ask: “If one channel over-performed, which one should it be?” and bias extra care there.

### Step 3 – Define per-channel angle

For each channel:
- Decide:
  - **Who** is being spoken to (may differ slightly).
  - **What problem or aspiration** is foregrounded.
  - **How bold vs safe** the tone should be.
- Write **1–2 sentences per channel** describing that angle before drafting.

### Step 4 – Draft per-channel artifacts

- Start with the **highest-priority channel**.
- For each:
  - Use the **native style patterns** defined above.
  - Respect platform norms (length, cadence, CTA type).
  - Ensure the copy can stand on its own if someone never sees the original.

### Step 5 – Enforce non-duplication

After drafting:
- For each channel, explicitly check:
  - Is the **intro** clearly differentiated from the source and other channels?
  - Are at least some **examples, metaphors, or stories** unique to this version?
  - Is the **CTA** tuned to platform behavior (reply vs comment vs click vs subscribe)?
- If two versions feel too similar, **rewrite one** with a new angle or structure.

### Step 6 – Summarize and hand off

- Provide a **brief publishing plan**:
  - Suggested order of posting.
  - How to link between pieces without sounding spammy.
  - Which version should be the **canonical source** for SEO (usually the main blog or site).

## Quality Bar & Checks

Before returning outputs, quickly verify:

- **Channel-native**
  - Would a heavy user of that platform believe this was written for it, not pasted from somewhere else?

- **Clarity and punch**
  - Hooks are **sharp and specific**.
  - No platform gets a “watered-down” version; each should have at least one **strong idea**.

- **SEO safety**
  - The **main canonical article** is the deepest, most complete version.
  - Other long-form versions (LinkedIn article, Medium) shift angle, examples, and structure enough to avoid being near-clones.

- **Brand consistency**
  - Voice and POV are consistent across channels, even as style changes.

## Common Mistakes to Avoid

- Copy-pasting paragraphs across platforms with minor rephrasing.
- Using the **same intro and CTA** in every version.
- Ignoring the **behavioral reality** of each platform (e.g., X is fast-scan, Substack is long-form relationship building).
- Over-optimizing for SEO at the cost of **human engagement** on social platforms.
- Forgetting to state **which channel is canonical** for search engines (assume main site/blog unless told otherwise).

---

## Channel-Specific Patterns & Templates

Use these patterns as **starting points**, then adapt to the user’s brand and audience.

### X Thread Template

**Structure (7–12 posts):**

1. **Hook post**
   - Format patterns:
     - “Most [role] do X. The best do Y instead.”
     - “You’re not failing at [topic] because of Z. You’re failing because of A.”
     - “We did [specific outcome]. Here’s exactly how.”

2. **Context (1–2 posts)**
   - Briefly define the problem or moment that motivated the original piece.

3. **Core insights (4–8 posts)**
   - One insight or tactic **per post**, often with:
     - “Here’s the mistake…”
     - “Here’s what to do instead…”

4. **Mini-summary (1 post)**
   - “If you only remember 3 things, remember these: [1/2/3].”

5. **CTA (1 post)**
   - Soft, platform-native ask:
     - “If this helped, follow for [cadence + type of content].”
     - “Reply with your biggest [topic] mistake and I’ll reply with 1 suggestion.”

Always:
- Keep lines short and scannable.
- Avoid multi-tweet paragraphs; split long thoughts across posts.

### X Article Draft (from Canonical)

When generating an X Article draft inside this skill:
- Shorten intros, cut meta context, and lean into:
  - **Skimmability** (subheadings, bullets, bold).
  - **Stories and concrete examples**.
- Then note that `x-articles` can further:
  - Run scoring.
  - Perform deep rewrite.
  - Tighten for X-native reading patterns.

---

### LinkedIn Post Template

**Structure:**

1. **Hook (1–2 short paragraphs)**
   - Call out a pattern your audience recognizes:
     - “Most teams treat performance reviews as a form to fill. That’s why they fail.”

2. **Body (2–5 paragraphs)**
   - 1–2 concrete observations.
   - 1–2 tactical suggestions or a small framework.

3. **CTA / Question**
   - Invite commentary:
     - “How does your team handle X?”
     - “What’s one thing you’d change before the next review cycle?”

4. **Hashtags (optional)**
   - 1–5 targeted tags; avoid spammy clouds.

Tone:
- Slightly more professional than X, but still human and opinionated.

---

### LinkedIn Article Template

**Structure:**

1. **Title**
   - Clear promise about outcome or idea.

2. **Intro**
   - Short scenario or observation grounded in professional context.

3. **Main sections (3–5 H2s)**
   - Problem landscape.
   - Your framework or approach.
   - 1–2 real examples or mini case studies.
   - Implementation checklist or pitfalls.

4. **Close**
   - Takeaways + invite to connect or comment.

Use the canonical blog as:
- Starting skeleton.
- Then adapt:
  - Language to be slightly more “boardroom-friendly”.
  - Examples to be more org/team-centric vs purely individual.

---

### Substack Newsletter Template

**Structure:**

1. **Subject line**
   - Lean more personal or story-driven:
     - “I almost burned out my entire team.”
     - “The performance review mistake I kept repeating.”

2. **Pre-header**
   - 1 short line of context or outcome.

3. **Intro**
   - Talk directly to the reader; often first-person.
   - Set emotional context: “You probably feel X right now…”

4. **Main Content**
   - Mix of:
     - Story (what happened).
     - Analysis (what it means).
     - Tactics (what to do).

5. **Close**
   - Reflection.
   - CTA to reply with thoughts, share, or upgrade to paid (if applicable).

Substack should feel **more intimate** than blog or LinkedIn—less polished, more honest.

---

### Medium Article Template

**Structure:**

1. **Narrative Hook**
   - Begin with a moment, image, or quote.

2. **Zoom-Out**
   - Explain why this moment is representative of a broader pattern.

3. **Exploration**
   - Unpack the idea with:
     - Supporting research (if available).
     - Examples from industry or culture.

4. **Resolution**
   - Land on a clearer way of seeing or approaching the problem.

5. **Soft CTA**
   - Often just an invitation to reflect or follow for more.

Medium rewards **story + insight** more than raw how-to.

---

## Angle & Differentiation Matrix

To consistently avoid duplication, explicitly choose **angle variants**.

For each channel, pick at least one:

- **Who’s the hero?**
  - “You the individual.”
  - “You the manager.”
  - “The team / org.”

- **Time horizon**
  - “Fix this today.”
  - “Fix this this quarter.”
  - “Fix this over the next year.”

- **Frame**
  - Story (what happened).
  - Playbook (how to).
  - Opinion (why common practice is wrong).

Example differentiation:
- Canonical blog: “Manager-focused playbook for fixing performance reviews this quarter.”
- X thread: “Checklist of red flags your review process is broken.”
- LinkedIn article: “Org-level risks of bad performance review design.”
- Substack: “Personal story of failing reviews as a manager and how it changed.”

Write this matrix **before drafting**, then confirm each artifact matches its assigned angle.

---

## Edge Cases & Constraints

Handle these scenarios explicitly:

- **Highly visual original content (slides, dashboards)**
  - Add descriptions like:
    - “[IMAGE: slide 4 of deck—funnel drop-off by stage]”.
  - On text-first platforms, describe what the visual *shows* in 1–2 lines.

- **Embargoed or confidential information**
  - Avoid reusing sensitive numbers or internal names.
  - Replace specifics with:
    - Ranges (“mid-seven figures”).
    - Anonymized descriptors (“a European fintech”).

- **Strict legal/compliance environments**
  - Soften absolute claims (“guarantees”, “will”) into likelihoods.
  - Avoid promising specific financial results unless explicitly provided.

- **Very short original piece**
  - For some channels (e.g., LinkedIn article, Medium), you may need to **expand** using:
    - Supporting context.
    - Analogies.
    - Industry examples (mark clearly as **(opinion)** when not from source).

---

## Example Syndication Flow (Abstracted)

1. **Input**
   - Canonical blog: “If Performance Reviews Are a Surprise, You Failed Months Ago.”
   - Goal: attract engineering managers and ICs; grow newsletter + LinkedIn presence.
   - Target channels: X thread, LinkedIn post, Substack newsletter.

2. **Syndication Summary**
   - Core idea: performance reviews work only when expectations are set and reinforced all year.
   - Channel stack:
     - X: fast checklist + teaser.
     - LinkedIn: professional framing + org implications.
     - Substack: more personal story + behind-the-scenes.

3. **Per-channel Artifacts (sketched)**

- **X Thread**
  - Hook: “If your performance reviews are a surprise, you failed months ago.”
  - 8–10 posts breaking down red flags + quick fixes.
  - CTA: “Follow for more honest engineering management playbooks.”

- **LinkedIn Post**
  - Story about last-minute review scramble.
  - 3 bullets: what great review cycles share.
  - Question: “What’s one change that would make your next review cycle less painful?”

- **Substack Newsletter**
  - Subject: “The year I almost burned out my team with ‘good’ reviews.”
  - Body: story + lessons + what changed in their process.
  - CTA: reply with their own horror story.

4. **Differences from Source**
   - X: stripped context, pure signals and checklists.
   - LinkedIn: adds more org-level framing and risk language.
   - Substack: much more personal and story-driven.

---

## Interactions with Other Skills

- When the source is **knowledge only** (no canonical article yet):
  - First use `blog-articles` to create a **canonical blog**.
  - Then use `content-syndication` on that canonical asset.

- When the user wants a **hero X Article** as the main long-form:
  - Use `x-articles` to create and optimize the X Article.
  - Then use `content-syndication` to generate:
    - X thread teasing the Article.
    - LinkedIn / Substack / Medium versions adapted from either the X Article or the canonical blog, depending on strategy.

- When the user wants to turn syndicated posts into conversation or outreach:
  - Use `linkedin-engagement` for LinkedIn comments and DMs.
  - Use `x-engagement` for X replies, quote posts, and DMs.
