# AI Skills Collection

A collection of skills for [Claude Code](https://claude.ai/code) — importable directly into your IDE, similar to how [BMAD-METHOD](https://github.com/bmadcode/BMAD-METHOD) works for AI agents.

## What are Skills?

Skills are reusable prompt workflows for Claude Code. They live in `~/.claude/skills/` and are triggered automatically by Claude when your request matches the skill's description.

Each skill is a folder with a `SKILL.md` file:

```
~/.claude/skills/
└── my-skill/
    └── SKILL.md    ← frontmatter (name + description) + workflow
```

## Available Skills

| Skill | Description |
|-------|-------------|
| [`session-start-hook`](./skills/session-start-hook/) | Creates SessionStart hooks to install dependencies in Claude Code on the web |
| [`keybindings-help`](./skills/keybindings-help/) | Customize keyboard shortcuts in `~/.claude/keybindings.json` |

## Install

### All skills

```bash
git clone <this-repo> aiskills
cd aiskills
chmod +x install.sh
./install.sh --all
```

### One specific skill

```bash
./install.sh session-start-hook
```

### Manual install

Copy any skill folder into `~/.claude/skills/`:

```bash
cp -r skills/session-start-hook ~/.claude/skills/
```

Then restart Claude Code.

## Add a Skill

1. Create a folder: `skills/your-skill-name/`
2. Add `SKILL.md` with this format:

```markdown
---
name: your-skill-name
description: One sentence describing when Claude should use this skill.
---

# Your Skill Title

Detailed workflow instructions for Claude...
```

3. PR welcome!

## Structure

```
aiskills/
├── README.md
├── install.sh
└── skills/
    ├── session-start-hook/
    │   └── SKILL.md
    └── keybindings-help/
        └── SKILL.md
```
