---
name: social-media-management
description: Create platform-native X and LinkedIn content — engagement (replies, DMs, quote posts), original posts and threads, and full viral product launches. Use when the user wants to engage on either platform, create original posts, or run a coordinated launch campaign designed to hit trending.
version: 2.0.0
license: MIT
compatibility: Instruction-only. Optional context from brand voice, post URLs, product features, prospect research, or source content.
---

# Social Media Management

Create platform-native interactions for X and LinkedIn that earn attention, build credibility, and advance a clear goal — without sounding generic, templated, or spammy.

---

## Common Principles

These rules apply regardless of platform:

- Lead with the sharpest thought, not background context.
- Keep each message to one idea or one ask.
- Add value through specificity, contrast, or a credible example.
- Personalize using real context: their post, role, company, or stated opinion.
- Avoid generic praise, low-signal agreement, or fake curiosity.
- If disagreeing, keep the disagreement clear and civil.
- Never pitch aggressively in a first touch unless the user explicitly asks for that style.

If the user also needs a visual asset to support the post or campaign:

1. Prefer code-as-image for product-focused visuals.
2. Reuse existing external URLs or local repo images when they already fit the message.
3. Use generated imagery for missing backgrounds or supporting scenes.
4. Hand off asset production to `code-as-images`, `html-visualization`, `code-slides`, or `video-generation` depending on the artifact.

---

## X / Twitter

### Use Cases

**Engagement (existing conversation):**
- Reply to a post with a useful observation, disagreement, or extension.
- Draft quote posts that add a distinct angle instead of repeating the original.
- Write DMs for warm outreach, follow-up, or collaboration.
- Turn a broader idea into an engagement sequence around a launch, article, or debate.

**Original Post Creation:**
- Draft a standalone post or thread from scratch.
- Develop a post brief using `templates/x-post-brief.md`.
- Plan a thread structure using `templates/x-thread-plan.md`.
- Run the research pipeline before writing a high-stakes post (see `references/x-research-workflow.md`).

**Viral Product Launch:**
- Run the full 6-step launch system from `references/x-viral-launch-playbook.md`.
- Find the hidden outcome using "so what?" recursion on the product feature list.
- Engineer controversy positioning that makes critics become distributors.
- Research viral concept frames from YouTube and controversy from X.
- Score every line of the script through the weapons-check agent before filming.
- Build the phased distribution plan with reply drafts for the 48-hour window.

### Inputs

- The target post, theme, or conversation summary (for engagement).
- The core idea, insight, or topic (for original posts).
- The desired outcome: visibility, replies, saves, clicks, follows, or meetings.
- Audience posture: cold audience, peers, customers, creators, investors, or friends.
- Optional: past top-performing posts for calibration, research output from `x-search.ts`.
- Optional constraints: tone, length, no-pitch rule, taboo topics, CTA style.

### Outputs

- Ready-to-post single tweet, thread, reply, quote post, or DM.
- Optional 2–3 variants by tone, format, or hook angle.
- A one-line rationale for why the angle fits the target conversation or goal.

### Writing Framework

Apply the Matt Gray guidelines from `references/x-writing-guidelines.md`:

- Lead with the sharpest hook — specific number, bold contrast, or curiosity gap.
- Explain the HOW, not just the WHAT — be specific with numbers, tools, examples.
- End threads and key tweets with a "banger" — a mic-drop line built for shares.
- Include one clear CTA scaled to audience warmth.
- No AI filler phrases. No hedging. Write like a knowledgeable peer.

### Format Selection

Use `references/x-post-formats.md` to select the right structure:

| Goal | Format |
|------|--------|
| Teach a process | How-to thread |
| Build authority | Listicle thread or resource post |
| Drive debate | Hot take post or thread |
| Drive saves | Resource / numbered list post |
| Start a conversation | Question post |
| Build trust | Story arc thread or milestone post |
| React to news | Single hot take |

### Research Workflow

For high-stakes posts, run the data-driven pipeline from `references/x-research-workflow.md`:

1. Fetch your top posts from the last 30 days — calibrate to your voice and what works for your account
2. Research topic market winners — find posts exceeding the engagement threshold in your niche
3. Analyze trends — check topic overlap and timing
4. Synthesize — write from evidence, not templates

Skip research for time-sensitive reactions, personal updates, or quick replies.

### Algorithm Mechanics

X measures two completely separate signals — see `references/x-algorithm-mechanics.md`:

- **Sourcing** (retweets): determines whether the post enters the For You feed at all
- **Ranking** (reply chains where the original author responds back): determines how high it appears

For any high-stakes post, include a retweet mechanic (giveaway, vote, or strong controversy plant). For the first 48 hours after a launch post, reply to every comment — this is the most direct lever available for algorithmic ranking.

### Viral Launch Decision Tree

| Situation | Use |
|-----------|-----|
| Quick reply or comment | X engagement patterns (above) |
| Original post or thread | `x-post` command + writing guidelines |
| Product launch (first trending) | `x-launch` command + full 6-step playbook |
| Script that needs quality check | `agents/weapons-check.md` |
| Post research before writing | `references/x-research-workflow.md` |

### Engagement Patterns

#### Reply

- Acknowledge the core point.
- Add a concrete observation, question, or counterexample.

#### Quote Post

- Use the original post as a jumping-off point, not a paraphrase target.
- Contribute a new frame, implication, or applied lesson.

#### DM

- Reference the shared context directly.
- State the reason for reaching out in one sentence.
- End with one lightweight next step.

---

## LinkedIn

### Use Cases

- Comment on posts with insight, a question, or an experience that advances the discussion.
- Write connection requests and first-touch DMs.
- Build short follow-up sequences after a comment, event, or accepted connection.
- Support founder, sales, recruiting, or community-led engagement.

### Inputs

- Target post, profile, or account summary.
- Relationship context: cold, warm, peer, prospect, candidate, customer, or partner.
- Objective: visibility, conversation, meeting, referral, partnership, or nurture.
- Optional guardrails: tone, no-pitch first touch, max length, CTA type.

### Outputs

- Comment or message ready to paste.
- Optional variants for soft, direct, or warmer approaches.
- A short note on why the draft fits the context.

### Drafting Rules

- Personalize using their role, post, company context, or stated opinion.
- Prefer one concrete observation over broad praise.
- Keep comments tight and easy to reply to.
- Keep DMs to one ask or one value add.
- Do not pitch aggressively in the first message unless the user explicitly asks for that style.

### Quality Checklist

- References something real from the post, profile, or relationship context.
- Adds value: insight, question, resource, or relevant perspective.
- Reads like a person, not a growth hack template.
- Ends with a clear but lightweight next step when messaging privately.

---

## References

- `references/x-writing-guidelines.md` — Matt Gray writing framework, hook patterns, quality bar
- `references/x-post-formats.md` — Post and thread format library with annotated structures
- `references/x-research-workflow.md` — Research pipeline using x-search.ts (personal data + topic research)
- `references/x-viral-launch-playbook.md` — Complete 6-step viral launch system with prompts for each step
- `references/x-copy-scoring.md` — Weapons Check scoring dimensions, 24 AI slop patterns, expert panel approach
- `references/x-algorithm-mechanics.md` — Sourcing vs ranking signals, 48-hour reply protocol, distribution phasing
- `references/x-concept-research.md` — YouTube competitive analysis + X controversy research methodology

## Agents

- `agents/weapons-check.md` — Scores every line on Invention Novelty + Copy Intensity; rewrites below 10/10

## Templates

- `templates/x-post-brief.md` — Brief for scoping a single post or thread
- `templates/x-thread-plan.md` — Structural plan for a thread
- `templates/x-launch-brief.md` — Full launch positioning brief covering all 6 steps

## Examples

- `examples/x-post-patterns.md` — High-performing post patterns with annotations and anti-patterns
- `examples/x-launch-example.md` — Full walk-through of the Durable launch: hidden outcome, weapons check, controversy, distribution

## Related Skills

- If the user wants a long-form X piece first, create it with `x-articles` and then derive engagement from it.
- If the user wants to turn a long-form idea into LinkedIn-native content before engaging, use `linkedin-articles`.
- If the user wants a broader multi-channel distribution pack, use `content-syndication`.
- If the user needs a product-focused visual asset, use `code-as-images`.
- If the user needs a shareable visual explainer or social landing page, use `html-visualization`.
- If the user needs presentation graphics or slide-style assets, use `code-slides`.
- If the user needs motion graphics or a social video, use `video-generation`.
- If the user needs account or persona context first, start with `prospect-research`.
- If the LinkedIn DM is part of a broader outbound motion, use `message-outreach`.
