---
name: skill-axon-impact
description: The Blast Radius Predictor. An architectural agent that leverages the Axon Knowledge Graph to map the exact impact ("blast radius") of modifying a specific code symbol. Generates a precision test plan for self-healing agents. Use when the user says "what happens if I change", "blast radius", "impact analysis", "axon impact", "/axon-impact".
---

# Axon Impact (The Blast Radius Predictor)

Before executing a risky refactor or modifying a core function, this skill queries the Axon Graph engine to determine the exact dependencies and dependents of a symbol. It guarantees you don't break the build blindly.

## When to use

- User asks for an **impact analysis** of a specific function, class, or variable.
- User wants to know the **"blast radius"** before a refactoring session.
- Pre-requisite step for safe deployments or engaging the `skill-combo-self-healing`.

## Prerequisite: Axon Installation

1. The `axon` CLI must be installed globally or available in the environment.
2. If it's missing, instruct the user to install it (e.g., `pipx install axon` or `pip install ./axon` depending on their setup).

## Step 1: Pre-flight Check (Axon Status)

1. **Mental Model**: Act as a meticulous Architect validating tools before surgery.
2. **Action**: Verify if the Axon Knowledge Graph is initialized in the current repository.
   - Run command: `axon status`
   - If it returns an error (no index found), run `axon analyze` to build the graph first.

## Step 2: The Blast Radius Analysis

1. **Mental Model**: The Data Scientist mapping a network graph.
2. **Action**: Query the impact of the designated symbol.
   - **Security Rule**: The symbol name must NOT contain any shell operators (`;&|<>`). Wrap the symbol in quotes to prevent injection.
   - Run command: `axon impact "<Symbol_Name>"` (e.g., `axon impact "AuthService.login"`)
   - *Optional*: If the codebase is massive, limit the depth `axon impact "<Symbol_Name>" --depth 2`.
3. **Observation**: Read the stdout output. Identify all files, classes, and functions that directly call or depend on the target symbol.

## Step 3: Test Plan Generation for Self-Healing

1. **Mental Model**: The Quality Assurance (QA) Lead.
2. **Action**: Based on the blast radius exposed in Step 2, isolate only the affected modules.
3. **Output**: Generate a minimal, highly targeted Markdown Test Plan.

```markdown
## 🧨 Blast Radius Report: `[Symbol_Name]`

**Directly affected core files:**
- `src/affected/file1.ts` (Calls `old_method`)
- `src/affected/file2.ts` (Depends on `InterfaceX`)

**Targeted Test Plan for Self-Healing:**
Do not run the entire test suite. Execute only these tests to validate the change:
1. `npm run test -- src/affected/file1.test.ts`
2. `npm run test -- src/affected/file2.test.ts`

**Recommendation:** Proceed with modification using `skill-combo-self-healing` executing the tests above.
```

## Step 4: Next Action

Present the Blast Radius Report to the user. Ask:
> "Do you want to proceed with the modification and let the `skill-combo-self-healing` agent take over using this targeted test plan?"
