---
name: message-outreach
description: Draft personalized outbound and reply-style sales messages, build scored campaigns, and triage follow-up queues. Use when the user needs a cold email, follow-up, breakup note, LinkedIn message, reply to an engaged prospect, a short multi-touch outreach sequence, a scored ICP with tiered prospects, or a mailbox-ready draft from Gmail or gws CLI context.
license: MIT
---

# Message Outreach

Turn research into outbound copy that is specific, channel-aware, and ready to send or save as a draft.

This skill owns the messaging layer, not the deep-research layer. If the user needs a full account or persona brief, use `prospect-research` first and bring its output into this workflow.

Keep `SKILL.md` focused on the core writing workflow. Load only the reference file that matches the job:

- `references/icp-scoring.md` when building a campaign from scratch, scoring or tiering a prospect list, or defining who to target before writing
- `references/copy-rules.md` when drafting cold outbound sequences or reviewing copy for quality and deliverability
- `references/gmail-workflows.md` when working from or into a mailbox or Gmail-like CLI
- `references/email-sequences.md` when the user wants a multi-touch sequence
- `references/follow-up-triage.md` when the user wants to know who needs a reply, bump, or promise-fulfillment follow-up
- `references/response-drafting.md` when replying to an existing thread or handling a sensitive response
- `references/writing-style-calibration.md` when the user wants the outreach to sound like a real sender, match an established voice, or learn from prior sent messages

## Use this skill for

- cold outbound email
- warm outbound after a trigger, intro, or event
- follow-up, bump, breakup, and re-engagement notes
- LinkedIn connection requests and follow-up DMs
- short call openers or call scripts grounded in the same research as the written outreach
- reply-style sales emails to engaged prospects
- follow-up queue review when the user needs help deciding who to nudge or respond to next
- short outreach sequences, usually 2–5 touches
- rewriting or drafting outreach that should sound like the sender's actual email or social voice
- scoring and tiering a prospect list before writing sequences
- building a campaign from scratch including ICP definition, sequence design, and copy review

## Do not use this skill for

- full account or persona research briefs
- ICP or ICA scorecard application as the primary deliverable
- pipeline health or forecast analysis

## Core workflow

### 1. Establish the message context

Collect or infer only what is required to write responsibly:

- **Audience:** who this is for, title, account, and relationship stage
- **Goal:** book a call, get a reply, share a resource, revive a deal, confirm fit
- **Channel:** email, LinkedIn, chat, or a specific thread reply
- **Sender context:** who is reaching out, company, proof points, and CTA options
- **Constraints:** length, tone, forbidden claims, legal or compliance guardrails
- **Available evidence:** prior research, CRM notes, email thread history, recent trigger events
- **Voice evidence:** existing style guide, approved outbound, sent emails, public posts, or brand voice notes

If the user has only raw URLs or scattered notes, use `prospect-research` first or perform a lightweight research pass before drafting. Never fake personalization.

### 2. Classify the situation

Choose the messaging mode before drafting:

- **Cold outbound:** no prior relationship
- **Warm outbound:** mutual contact, prior meeting, inbound signal, or recent event
- **Reply / active thread:** prospect already responded or asked a question
- **Follow-up:** no response after an earlier touch
- **Re-engagement:** prior interest went cold
- **Sensitive response:** objection handling, delay, policy boundary, or bad news

### 3. Calibrate the sender voice

Before optimizing for persuasion, decide what "sounds like the sender" actually means.

Use voice evidence in this order:

1. An explicit `writing-style-guide.md`, brand voice doc, or approved messaging rules
2. Recent approved or sent messages from the same sender on the same channel
3. Other recent first-party writing from the sender such as LinkedIn posts, notes, or public writing
4. Existing outbound templates or snippets already known to work for this sender

Apply these rules:

- Weight recent writing higher than old writing. Voice drifts.
- Keep channel-specific behavior separate. Email voice, LinkedIn voice, and call language often differ.
- Strip quoted replies, forwarded content, signatures, disclaimers, and recipient-authored text before learning from samples.
- Learn patterns, not private details. Do not lift exact sensitive wording from historical messages unless the user explicitly wants reuse.
- If the evidence is too thin to match the sender reliably, say so and keep the draft clean and generic rather than inventing a "voice."

If the user expects repeated drafts in the same voice and no durable guide exists yet, load `references/writing-style-calibration.md` and create a lightweight voice brief or persistent `writing-style-guide.md` before drafting more than one message.

### 4. Score and tier prospects when building a campaign

If the user is building a new campaign rather than drafting a single message, load `references/icp-scoring.md` and complete this step before drafting:

- Collect ICP definition fields: titles, industries, company size, geography, buying signals, anti-ICP exclusions
- Score the prospect list or segment using the 6-factor model (product-market fit, outbound readiness, value prop clarity, TAM, multi-channel willingness, sector fit)
- Assign tiers: Tier 1 (score ≥2.5), Tier 2 (1.5–2.4), Tier 3 (<1.5)
- Write personalized sequences for Tier 1 first; use lighter sequences for Tier 2; exclude Tier 3
- Confirm personalization fields are available before writing copy that depends on them

If this is a single-message task rather than a campaign build, skip this step and proceed to signal assessment.

### 5. Assess signal strength before drafting

Decide whether the available evidence is strong enough to write from directly:

- **Strong internal signals:** recent CRM notes, product usage, prior thread context, mutual contact, or a specific trigger event. Draft from these first.
- **Thin internal signals:** little beyond role, company, or title. Run a lightweight external research pass for public hooks before drafting.
- **Still sparse after research:** do not invent a personalized hook. Return the real facts you found and ask the user for more context or permission to stay generic.

Evaluate candidate hooks using these tests:

1. **Recency:** happened in roughly the last 7-30 days when possible
2. **Specificity:** concrete action or change, not a generic company fact
3. **Relevance:** connects directly to the sender's product, value, or reason to reach out now

If multiple hooks are available, use the one with the best mix of recency, specificity, and relevance. Save the rest for follow-ups or alternative channel variants.

### 6. Choose the artifact

Produce the smallest useful artifact:

- **Single draft** for one email or DM
- **Paired draft** for email plus LinkedIn backup
- **Multi-format package** for email, LinkedIn, and call opener/script from the same evidence
- **Reply package** when the thread context matters
- **Follow-up queue** when the job is to identify who needs a response, bump, or promise close-out before drafting
- **Short sequence** when the user wants the motion mapped end-to-end

Default to a single message unless the user asks for a sequence, multi-channel package, or follow-up review.

### 7. Draft from evidence

Every message should map research to one clear ask and one clear voice profile.

Priority order for hooks:

1. Trigger event or time-sensitive change
2. Prior relationship or mutual contact
3. Prospect content, talk, post, or hiring pattern
4. Company initiative or role-specific pressure
5. Role-based pain point grounded in known context

### 8. Deliver through the right tool

If mailbox tools are connected and the user wants the message in their inbox:

- Read the existing thread first when replying or following up
- Read sent mail too when the user is trying to remember promises they made or who needs a bump
- Prefer draft creation over immediate send
- Use helper commands such as read, reply, reply-all, forward, and send when available
- Inspect tool schemas or help first if the exact method shape is uncertain

If no mailbox tool is connected, return copy-paste-ready plain text.

## Output modes

### A. Single outbound draft

Use this for cold, warm, or follow-up outreach.

```markdown
# Outreach Draft: [Person] @ [Company]
**Goal:** [reply / meeting / referral / resource share]
**Channel:** [email / LinkedIn]
**Research basis:** [1-line summary with cited support]
**Style basis:** [style guide / recent sent emails / brand voice / approximate]

## Draft
**Subject:** [primary subject]
**Alt subjects:** [2 options]

[Plain-text message body]

## Why this approach
- **Opening:** [why the hook is specific]
- **Value prop:** [why this matters now]
- **CTA:** [why the ask is low-friction]

## Draft status
- [Created in mailbox / ready to copy]
```

### B. Reply or sensitive response draft

Use this when responding to an active thread, objection, or delicate situation.

```markdown
# Reply Draft
**To:** [name]
**Channel:** [email / thread / chat]
**Tone:** [direct / empathetic / executive / technical]

## Draft
[Plain-text reply]

## Internal notes
- **Why this tone:** [brief rationale]
- **Things to verify:** [facts, dates, commitments]
- **Risk factors:** [anything to review before sending]
```

### C. Short outreach sequence

Use this when the user asks for multiple touches, not by default.

```markdown
# Outreach Sequence Overview

| # | Touch | Purpose | Timing | CTA | Exit condition |
|---|-------|---------|--------|-----|----------------|

## Full drafts
[Touch 1 ... Touch N]

## Branching notes
- If they reply or book, exit immediately
- If they open but do not respond, use a softer re-ask
- If the trigger event becomes stale, refresh the hook before sending the next touch

## A/B tests
- subject line angle
- CTA wording
- send timing
```

Keep sales sequences short unless the user explicitly wants a longer nurture flow.

### D. Multi-format outreach package

Use this when the user wants channel options or when the same research should power email, LinkedIn, and a call opener.

```markdown
# Outreach Package: [Person] @ [Company]
**Goal:** [meeting / reply / referral / re-engagement]
**Primary hook:** [specific trigger with cited support]
**Style basis:** [style guide / recent sent emails / brand voice / approximate]

## Email
**Subject:** [primary subject]
**Alt subjects:** [2 options]

[Plain-text email body]

## Call opener
[Speakable opening and value bridge, usually 3-5 lines total]

## LinkedIn
**Connection request or DM:** [<=300 chars when used as a connection request]

## Signal notes
- **Signals used:** [which facts drove the drafts]
- **Assumptions:** [what was inferred]
- **Backup angle:** [next-best hook if the primary one is weak]
```

### E. Follow-up queue review

Use this when the user asks who needs a reply, who to bump, or what commitments are at risk of slipping.

```markdown
# Follow-Up Queue
**Scope:** [mailbox / CRM / sent mail / tasks]

## Needs response
1. [Person] — [subject or thread]
   - **Why it matters:** [question / request / deadline]
   - **Suggested action:** [reply now / draft bump / no action]

## Promises made
1. [Person] — ["I'll send..." or equivalent]
   - **Age:** [X days]
   - **Status:** [fulfilled / not found / unclear]
   - **Suggested action:** [send promised asset / close the loop]

## Stale threads
1. [Person] — [thread]
   - **Last outbound:** [X days ago]
   - **Suggested bump angle:** [new proof / softer CTA / close the loop]

## Recommended drafts
- [Which 1-3 items to draft immediately and why]
```

## Writing rules

- Research first, then draft.
- Match the sender's real voice before optimizing cleverness or persuasion.
- If the evidence is thin, say so and either research more or ask for more context.
- **Never open with "I", "We", "Our team", "I wanted to", or "Hope this finds you well."** Start with the prospect's company name, a specific market observation, a concrete finding, or a relevant trend. The first sentence earns the second.
- One clear CTA per touch. No options — singular and clear.
- Plain text only inside message bodies. No markdown emphasis inside emails or DMs.
- Short paragraphs, usually 1–3 sentences. Cold outbound Step 1 is 3 sentences maximum.
- Lead with a specific observation, not a boilerplate greeting.
- No feature dump. Pick one value angle.
- No invented proof, fabricated familiarity, or fake urgency.
- No links in Step 1. Maximum 1 link in Steps 2–3 and only if genuinely useful.
- Prefer hooks the recipient would recognize as public or plausibly known to the sender.
- Prefer recent first-party wording over generic sales phrasing or trendy AI cadence.
- Keep channel voice distinct. Do not make email read like LinkedIn, or vice versa, without evidence the sender actually does that.
- When learning voice from prior messages, exclude quoted thread history, signatures, auto-footers, and legal boilerplate.
- If a claim is not supported by user context or cited research, do not use it.
- Match the stakeholder level. Executives get shorter, outcome-first notes. Practitioners can handle more specifics.
- For high-stakes or campaign-scale sequences, load `references/copy-rules.md` and apply the full rules including deliverability signals and expert panel check.

## Quality bar

Before finalizing, check:

- Is the opening genuinely specific? Does it start with the prospect, not the sender?
- Does this sound like the sender, not a generic outbound template?
- Is the ask proportional to the relationship stage? (Soft ask in Steps 1–3; harder ask only after engagement)
- Does the message avoid claims the sender cannot defend?
- Would the recipient understand why they were contacted now?
- Is the message short enough for the channel? (Step 1: max 3 sentences)
- Did the draft avoid copied private phrasing or details that came only from historical samples?
- If this is a reply, does it answer the actual question before pivoting to a CTA?
- If this is a follow-up, does it add a fresh angle instead of repeating the prior touch?
- If this is a call script, would it sound natural if spoken aloud?
- **Deliverability:** Does the body contain spam trigger words, HTML formatting, images, or more than 1 link? If yes, fix before sending.

## When data is sparse

If you only have a name, title, or company and the user still wants personalized outreach:

1. Use `prospect-research` or do a lightweight external search for recent, public hooks.
2. If you still do not have a credible hook, present the limited facts plainly.
3. Ask for missing context such as prior conversation history, reason for outreach now, or approved proof points.
4. Only draft a generic template if the user explicitly accepts that tradeoff.

## Default sales patterns

### Cold outbound

- Use one research-backed hook
- Tie it to a likely pain or initiative
- Add one proof point
- Ask for one low-friction next step

### Warm outbound

- Lead with shared context
- Bridge to why now
- Make the CTA feel like continuation, not a fresh pitch

### Follow-up

- Do not resend the same message with new wording only
- Add a new angle: new proof, sharper problem framing, lighter CTA, or a resource

### Breakup note

- Keep it respectful and brief
- Acknowledge timing may be off
- Leave the door open without guilt-tripping

### Reply to an engaged prospect

- Answer first
- Clarify what is known vs. what needs confirmation
- Then propose the next step

## When to escalate to another skill

- Use `prospect-research` when the message lacks enough evidence to personalize responsibly
- Use `go-to-market` when the user is really asking for segment messaging, positioning, or broader campaign strategy
- Use `sales-pipeline` when the problem is deal hygiene, stage confidence, or forecast realism rather than copy
- If repeated drafts need to sound like a specific sender and there is no stable voice source yet, create or refresh `writing-style-guide.md` using `references/writing-style-calibration.md` before scaling the outreach
