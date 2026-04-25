# Product Launch Spot Example

Use this example for a short branded launch video with custom scenes.

## Brief

- Objective: launch a new product or major release
- Audience: prospects and current customers
- Format: `1080x1920`, `30fps`, about `30s`
- Operating mode: `scene-first`
- Tone: bold, fast, premium
- CTA: "Book a demo"

## Suggested scenes

1. Hook:
   0:00-0:04. Strong headline over motion-heavy background.
2. Pain:
   0:04-0:09. One clear problem statement with supporting visual.
3. Product promise:
   0:09-0:16. Show the product in action with a hero screenshot or short clip.
4. Proof:
   0:16-0:24. Surface one metric, testimonial, or differentiator.
5. CTA:
   0:24-0:30. Branded end card with logo, URL, and CTA.

## Recommended implementation

- One component per scene.
- Shared timing constants for scene boundaries.
- Explicit transition windows instead of scattered delays.
- Hero frame of each scene built first, then animated.

## Rules to load

- `references/rules/compositions.md`
- `references/rules/timing.md`
- `references/rules/transitions.md`
- `references/rules/audio.md`
- `references/rules/fonts.md`

## Notes

- Keep the headline count low. One message per scene.
- If brand direction is missing, ask for mood, canvas direction, and brand references before defaulting.
- Lock the hook, product promise, and CTA hero frames before adding motion polish.
- Use a still render check on the hook and CTA scenes before final handoff.
