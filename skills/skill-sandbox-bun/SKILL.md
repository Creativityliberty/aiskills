---
name: skill-sandbox-bun
description: High-Speed Laboratory. A Bun-powered sandbox skill optimized for ultra-fast asynchronous execution and code evaluation by multiple simultaneous agents. Features native TypeScript support. Use when the user says "multi-agent test", "fast bun sandbox", "concurrent poc", "/sandbox-bun".
---

# Sandbox Bun (High Speed & Multi-Agent)

The "Formula 1" version of the Laboratory. Bun is a blazing-fast JavaScript/TypeScript runtime perfect for **multiple agents** working in parallel to execute, validate, and iteratively test code without overhead (`node_modules` complexity, TS compilation).

## When to use

- User needs **ultra-fast execution** of experimental code.
- User has **multiple agents** interacting or generating code concurrently.
- User requests **native TypeScript execution** without compilation delays.

## Step 1: Workspace Generation

1. **Create the isolated workspace**: Create a dedicated temporary folder for the current agent.
   - `mkdir /tmp/bun-sandbox-agent1-XYZ`
2. **Lightning Initialization**: Initialize the project directly with Bun.
   - `cd /tmp/bun-sandbox-agent1-XYZ && bun init -y`
3. **Zero TS Config**: Remember that Bun executes TypeScript (`.ts`) natively. There is no need for `tsc` or `ts-node`.

## Step 2: Multi-Agent Code and Fast Testing

1. **Agentic Implementation**: The agent writes its algorithm or proof of concept in `index.ts`. For quick databases, use the native, in-memory `bun:sqlite` API, ideal for ephemeral experiments.
2. **Test Driven by Agent**: The agent must write tests in `index.test.ts` (or any `*.test.ts` file).
3. **Instant Execution**:
   - Run the raw file: `bun run index.ts`
   - Validate tests: `bun test`

## Step 3: Collection and Convergence

1. **Flow Orchestrator Role**: If several agents are coding in multiple `/tmp/bun-sandbox-*` folders in parallel, the coordinator collects the results (the `stdout` of `bun test`).
2. **Merging**: As soon as the algorithm is perfect, performant, and passes the tests, extract the pure TS code from the Bun sandbox and insert it into the user's main Node/Next.js architecture.
3. **Automatic Cleanup**: Run `rm -rf /tmp/bun-sandbox-*` to instantly free memory.
