---
name: skill-combo-self-healing
description: The "Self-Healing" Master Workflow. Ensures an architecture change or bug fix reaches production safely by combining core modification, dependency tree checks, atomic commits, and PR reviews. Use when the user says "fix this bug safely", "do a safe refactor", "self-heal", "/self-healing".
---

# Combo: Self-Healing Master Workflow

A safety loop mega-skill utilized for risky codebase modifications, heavy refactoring, or deep bug fixes, guaranteeing auto-repair without regressions.

## When to use

- User makes a **risky source code modification**.
- User requests a **safe refactor** or fixing a deep-rooted bug.
- User wants assurances that changes won't break the build.

## Step 1: Surgical Intervention (kernel-forge / orchestra-forge)

1. **Mental Model**: Embody `kernel-forge`.
2. **Action**: Launch the low-level modification process in the application core. Modify target files to resolve the initial issue.
3. **Output**: Locally modified source code.

## Step 2: Impact Verification (task-tree)

1. **Mental Model**: Take on the role of `task-tree`.
2. **Action**: Generate a dependency tree of the modified code. What other files, components, or services rely on the altered code?
3. **Output**: Automatic execution of affected test scripts or manual validation of dependent nodes. Immediate rollback/resolution if Step 1 broke the tree.

## Step 3: Commit History (commit)

1. **Mental Model**: Read `skill-commit`.
2. **Action**: Gather the modifications in a clean environment once tests are green.
3. **Output**: Create atomic, readable Git commits conforming to Conventional Commits. One issue = one commit.

## Step 4: Quality Assurance (review-pr)

1. **Mental Model**: Activate the `review-pr` CTO/Lead Tech hat.
2. **Action**: Review the generated changes (the global "diff" of the local PR) critically to detect vulnerabilities or anti-patterns.
3. **Output**: Final approval or return to Step 1 if anomalies are detected.
