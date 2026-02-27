---
name: skill-axon-diff
description: The Structural PR Reviewer. An advanced reviewer agent that uses Axon's graph comparison to provide semantic, architectural reviews of a branch diff instead of simple line-based textual diffs. Highlighting broken contracts and coupling changes. Use when the user says "review this PR structurally", "axon diff", "semantic review", "/axon-diff".
---

# Axon Diff (Le Reviewer Sémantique)

Standard `git diff` shows added and removed text lines, which is often insufficient for understanding structural impact. The Axon Diff skill runs a knowledge graph comparison between two branches (`main..feature`) to reveal the true architectural changes: altered signatures, broken dependencies, and new coupling.

## When to use

- User asks for a **PR review** or **Code review** that goes beyond syntax.
- User wants to understand the **architectural impact** of a feature branch.
- Validating a large refactoring branch before merging to `main`.

## Prerequisite: Axon Installation

1. The `axon` CLI must be installed globally or available in the environment.
2. If it's missing, instruct the user to install it (e.g., `pipx install axon` or `pip install ./axon` depending on their setup).

## Step 1: Structural Comparison

1. **Mental Model**: The Lead Architect reviewing a subordinate's Pull Request.
2. **Action**: Ask the user for the target branch range (e.g., `main..feat/auth-update`).
3. **Execution**: Run the comparison engine.
   - Run command: `axon diff "main..feat/auth-update"`
   - Note: The command assumes you are on the current feature branch and comparing against `main` (or whatever base branch is specified).

## Step 2: Semantic Analysis

1. **Mental Model**: The Context Decoder.
2. **Observation**: Parse the Axon Structural Diff output. Rather than looking for `+ const x = 2;`, look for:
   - **Modified Nodes (Signature Changes)**: Did `calculateTax(amount)` change to `calculateTax(amount, region)`?
   - **Removed Relationships (Broken Links)**: Did a module stop calling a specific database repository?
   - **Added Relationships (New Coupling)**: Did a Frontend component suddenly start importing a Backend utility directly (Anti-pattern)?

## Step 3: The Architectural Review Report

1. **Action**: Translate the raw graph diff into a human-readable, high-value technical review.
2. **Output**: Generate the Review Report. Point out hidden architectural flaws that standard text reviewers would miss.

```markdown
## 👁️ Axon Structural Review: `main..feature`

### 🏗️ Architectural Changes Detected

**⚠️ Broken Contracts (Warning):**
- The signature of `PaymentService.process()` was modified. Axon shows this node is called by 3 other modules (`Cart`, `Checkout`, `Admin`) which were NOT updated in this PR. This will cause a runtime crash.

**🔗 New Coupling (Info):**
- `src/ui/Button.tsx` now imports `src/lib/api.ts`. This breaks the purity of the UI component layer. Consider passing the callback as a prop instead.

**✅ Safe Deletions:**
- `OldAuthStrategy` class and its 5 relationships were cleanly excised from the graph.

### 🎯 Recommendation
[Block merge until contracts are fixed / Approve / Request Changes]
```

## Step 4: Next Action

Deliver the Structural Review to the user and suggest using `skill-combo-self-healing` if there are broken contracts that need automatic fixing.
