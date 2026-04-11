# No Direct useEffect

**Rule: never call `useEffect` directly in a component. Use `useMountEffect` for the rare case where you need to sync with an external system on mount. Everything else has a better primitive.**

This rule matters especially in agentic workflows: agents add `useEffect` "just in case", and that move is the seed of the next race condition or infinite loop. Banning the hook forces logic to be declarative and predictable.

---

## The Only Permitted Escape Hatch

```typescript
export function useMountEffect(effect: () => void | (() => void)) {
  // eslint-disable-next-line react-hooks/exhaustive-deps
  useEffect(effect, []);
}
```

Use `useMountEffect` only when you are genuinely synchronizing with an external system (DOM, third-party widget, browser API subscription). It makes the intent explicit and prevents ad-hoc `useEffect` usage. Any other use of `useEffect` is a signal to apply one of the five patterns below.

---

## The Five Replacement Patterns

### Rule 1 — Derive, don't sync

Most effects that set state from other state are unnecessary and add an extra render cycle.

```tsx
// ❌ BAD: Two render cycles — first stale, then filtered
function ProductList() {
  const [products, setProducts] = useState([]);
  const [filteredProducts, setFilteredProducts] = useState([]);

  useEffect(() => {
    setFilteredProducts(products.filter((p) => p.inStock));
  }, [products]);
}

// ✅ GOOD: Compute inline in one render
function ProductList() {
  const [products, setProducts] = useState([]);
  const filteredProducts = products.filter((p) => p.inStock);
}
```

Chained effects are also a loop hazard:

```tsx
// ❌ BAD: total in deps can loop
function Cart({ subtotal }) {
  const [tax, setTax] = useState(0);
  const [total, setTotal] = useState(0);

  useEffect(() => { setTax(subtotal * 0.1); }, [subtotal]);
  useEffect(() => { setTotal(subtotal + tax); }, [subtotal, tax, total]);
}

// ✅ GOOD: No effects required
function Cart({ subtotal }) {
  const tax = subtotal * 0.1;
  const total = subtotal + tax;
}
```

**Smell test:**
- You are about to write `useEffect(() => setX(deriveFromY(y)), [y])`
- You have state that only mirrors other state or props

---

### Rule 2 — Use a data-fetching library

Effect-based fetching creates race conditions and duplicated caching logic.

```tsx
// ❌ BAD: Race condition risk — no cancellation
function ProductPage({ productId }) {
  const [product, setProduct] = useState(null);

  useEffect(() => {
    fetchProduct(productId).then(setProduct);
  }, [productId]);
}

// ✅ GOOD: Query library handles cancellation, caching, staleness
function ProductPage({ productId }) {
  const { data: product } = useQuery(['product', productId], () =>
    fetchProduct(productId)
  );
}
```

**Smell test:**
- Your effect does `fetch(...)` then `setState(...)`
- You are re-implementing caching, retries, cancellation, or stale handling

---

### Rule 3 — Event handlers, not effects

If a user action triggers work, do the work in the handler.

```tsx
// ❌ BAD: Effect used as an action relay
function LikeButton() {
  const [liked, setLiked] = useState(false);

  useEffect(() => {
    if (liked) {
      postLike();
      setLiked(false);
    }
  }, [liked]);

  return <button onClick={() => setLiked(true)}>Like</button>;
}

// ✅ GOOD: Direct event-driven action
function LikeButton() {
  return <button onClick={() => postLike()}>Like</button>;
}
```

**Smell test:**
- State is used as a flag so an effect can do the real action
- You are building "set flag → effect runs → reset flag" mechanics

---

### Rule 4 — `useMountEffect` for one-time external sync

DOM integration, third-party widget lifecycles, and browser API subscriptions are valid use cases. Use conditional mounting to make preconditions explicit rather than guarding inside the effect.

```tsx
// ❌ BAD: Guard inside effect
function VideoPlayer({ isLoading }) {
  useEffect(() => {
    if (!isLoading) playVideo();
  }, [isLoading]);
}

// ✅ GOOD: Mount only when preconditions are met
function VideoPlayerWrapper({ isLoading }) {
  if (isLoading) return <LoadingScreen />;
  return <VideoPlayer />;
}

function VideoPlayer() {
  useMountEffect(() => playVideo());
}

// ✅ ALSO GOOD: Persistent shell + conditional instance
function VideoPlayerInstance() {
  useMountEffect(() => playVideo());
}

function VideoPlayerContainer({ isLoading }) {
  return (
    <>
      <VideoPlayerShell isLoading={isLoading} />
      {!isLoading && <VideoPlayerInstance />}
    </>
  );
}
```

**Smell test:**
- You are synchronizing with an external system
- The behavior is naturally "setup on mount, cleanup on unmount"

---

### Rule 5 — Reset with `key`, not dependency choreography

If the requirement is "start fresh when an ID changes", use React's remount semantics directly.

```tsx
// ❌ BAD: Effect attempting to emulate remount behavior
function VideoPlayer({ videoId }) {
  useEffect(() => {
    loadVideo(videoId);
  }, [videoId]);
}

// ✅ GOOD: key forces a clean remount
function VideoPlayer({ videoId }) {
  useMountEffect(() => {
    loadVideo(videoId);
  });
}

function VideoPlayerWrapper({ videoId }) {
  return <VideoPlayer key={videoId} videoId={videoId} />;
}
```

**Smell test:**
- Your effect's only job is to reset local state when an ID/prop changes
- You want the component to behave like a brand-new instance for each entity

---

## Why this matters for agentic code

- **Dependency arrays hide coupling.** A seemingly unrelated refactor can quietly change effect behavior.
- **Infinite loops are easy to create** — state update → render → effect → state update — especially when dependency lists are "fixed" incrementally.
- **Effect chains are time-based control flow.** They are hard to trace, hard to test, and easy to regress.
- **Debugging asks the wrong question.** "Why did this run?" / "Why did this not run?" has no clear entrypoint the way an event handler does.
- **Agents add `useEffect` defensively.** Without a lint gate, agentic code accumulates effects as safety nets, compounding all of the above.

## Enforcement

Add `no-restricted-syntax` (ESLint) to block direct `useEffect` calls in components. Allow it only inside `useMountEffect`. Reference this rule in `AGENTS.md` / `CLAUDE.md` so agents respect it from context.

## Reference

React's own guide: [You Might Not Need an Effect](https://react.dev/learn/you-might-not-need-an-effect)
