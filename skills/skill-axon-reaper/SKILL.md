---
name: skill-axon-reaper
description: The Dead Code Harvester. An architectural agent that navigates the project using Axon to identify and safely remove dead code (functions, classes) without breaking the build. Reduces technical debt. Use when the user says "find dead code", "clean legacy code", "prune unused functions", "axon reaper", "/axon-reaper".
---

# Axon Reaper (La Faucheuse de Code Mort)

A meticulous cleaner agent that relies on the Axon Knowledge Graph to perfectly identify parts of the codebase that are completely decoupled, unreferenced, and dead. It writes the precise Pull Request to prune this code securely.

## When to use

- User explicitly requests to **clean up dead code**.
- User wants to **reduce technical debt** before a major refactor.
- When performing a routine repository maintenance audit.

## Prerequisite: Axon Installation

1. The `axon` CLI must be installed globally or available in the environment.
2. If it's missing, instruct the user to install it (e.g., `pipx install axon` or `pip install ./axon` depending on their setup).

## Step 1: Pre-flight & Search

1. **Mental Model**: The meticulous Janitor with absolute knowledge of the building layout.
2. **Action**: Ensure Axon is ready (`axon status`). Then query the graph for dead code.
   - Run command: `axon dead-code`
3. **Observation**: Read the stdout. This will list symbols (classes, methods, variables) that have NO incoming references (`[:CALLS]`, `[:IMPORTS]`, etc.) according to the graph.

## Step 2: Verification (The Double Check)

1. **Mental Model**: The paranoid QA Tester.
2. **Action**: Do not trust the graph blindly (dynamic languages like Python/JS might have reflective calls).
   - For the top 5 largest chunks of dead code returned by Axon, run a quick global regex search (`grep_search` or `codebase_search`) for their names to ensure they aren't used dynamically (e.g., loaded via a string name in a factory).
3. **Output**: Filter out false positives. Create the final list of confirmed "Zombies."

## Step 3: Pruning and PR Generation

1. **Mental Model**: The precise Surgeon.
2. **Action**: Delete the confirmed dead code blocks from their respective files. Run local unit tests (`npm run test` or `pytest`) to ensure no side-effects were triggered.
3. **Output**: Generate a draft for a Pull Request (PR) explaining what was removed, why it was safe to remove, and the amount of lines saved.

```markdown
## 🪦 The Reaper's Log

**Status:** Tests Green ✅

**Removed Entities:**
- [x] `LegacyUserFactory` (src/factories/user.ts) - Unreferenced since API v2 migration.
- [x] `calculate_old_tax_rate()` (src/billing.py) - 0 incoming graph edges.

**Lines Saved:** 432 lines.

**Action:** Would you like me to commit these changes?
```

## Step 4: Next Action

Present the Reaper's Log to the user and wait for authorization to permanently delete the code via `skill-commit`.
