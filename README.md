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
| [`commit`](./skills/commit/) | Create well-formatted git commits with staging, message writing, and conventional commits |
| [`review-pr`](./skills/review-pr/) | Review GitHub Pull Requests — bugs, security, design, tests — with structured output |
| [`skill-creator`](./skills/skill-creator/) | Guide for creating new skills: structure, frontmatter, bundled resources, best practices |
| [`pocketflow`](./skills/pocketflow/) | Build LLM-powered workflows with PocketFlow — nodes, flows, async, batch, retries |
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
    ├── commit/
    │   └── SKILL.md
    ├── review-pr/
    │   └── SKILL.md
    ├── skill-creator/
    │   └── SKILL.md
    ├── pocketflow/
    │   ├── SKILL.md
    │   └── scripts/
    │       └── pocketflow.py   ← bundled library
    ├── session-start-hook/
    │   └── SKILL.md
    └── keybindings-help/
        └── SKILL.md
```
