## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/alvarovillalbaa/agent-suite.git
cd agent-suite
```

### 2. Choose the department you want

- `learning-system`
- `marketing`
- `sales`
- `engineering`
- `product`
- `business-ops`

### 3. Install by platform

#### Claude

Use the root marketplace:

```text
/plugin marketplace add <owner>/<repo>
/plugin install engineering@agent-company
```

For local plugin development:

```bash
claude --plugin-dir "$(pwd)/engineering"
```

#### Codex

Use the department directory directly:

```bash
codex --plugin-dir "$(pwd)/engineering"
```

Or copy a single skill:

```bash
mkdir -p ~/.codex/skills
cp -R engineering/skills/agentic-development ~/.codex/skills/
```

#### Cursor

Use the department directory that contains `.cursor-plugin/plugin.json`.

### 4. Company-level entry points

- Company model: [COMPANY.md](/Users/alvipe/Desktop/plugins/COMPANY.md)
- Architecture: [references/docs/ARCHITECTURE.md](/Users/alvipe/Desktop/plugins/references/docs/ARCHITECTURE.md)
- Claude marketplace: [.claude-plugin/marketplace.json](/Users/alvipe/Desktop/plugins/.claude-plugin/marketplace.json)
