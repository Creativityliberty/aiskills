---
name: skill-sandbox-runner
description: The Laboratory. A sandbox skill that allows the agent to create an isolated environment to test a library, validate a Proof of Concept (PoC), or execute uncertain code safely without polluting the main project. Use when the user says "test this", "build a poc", "experiment with", "/sandbox".
---

# Sandbox Runner (The Laboratory)

Safely write, execute, and evaluate proof-of-concept code in isolated environments without risking the integrity of the main project structure.

## When to use

- User asks to **experiment** with a new feature.
- User wants to **test if an API responds correctly**.
- User requests to create a **"PoC" (Proof of Concept)**.
- Absolute isolation and cleanup are required.

## Step 1: Sandbox Preparation

1. **Create the Airlock**: NEVER work in the target project folders (`src/` or `app/`). Create an isolated temporary folder.
   - *Command*: `mkdir /tmp/sandbox-poc-xyz` (or `%TEMP%\sandbox-poc-xyz` on Windows).
2. **Minimalist Initialization**: Initialize the environment lightly.
   - For Node.js: `npm init -y` and install only necessary dependencies.
   - For Python: Create a disposable `venv`.

## Step 2: Experimentation (Proof of Concept)

1. **Write Disposable Code**: Draft a single script (e.g., `test_api.ts`) aiming straight for the goal. No architecture, just "Quick & Dirty" code to validate the technical brick.
2. **Execution**: Run the script using the command execution tool. Use Deno or Docker if maximum security is needed.
3. **Observation**: Carefully analyze the standard output (`stdout`) and errors (`stderr`).

## Step 3: Reporting and Cleanup (or Integration)

1. **Feedback**: Clearly explain to the user if the experiment succeeded or failed, including relevant log excerpts.
2. **Decision**:
   - **Integration**: If the PoC is validated by the user, use skills like `blueprint-maker` or `artifact-maker` to rewrite this code cleanly into the main project (`src/`).
   - **Destruction**: If the observation is complete, ruthlessly delete the temporary folder: `rm -rf /tmp/sandbox-poc-xyz`. Leave no trace.
