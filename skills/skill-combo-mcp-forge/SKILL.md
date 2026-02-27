---
name: skill-combo-mcp-forge
description: A mega-skill orchestrating the complete creation, design, and implementation of a Model Context Protocol (MCP) server. Combines Architect, Builder, Artifact Maker, and Flow Orchestrator. Use when the user says "create an mcp server", "forge an mcp", "build mcp for", "/mcp-forge".
---

# Combo: MCP Forge

A unified workflow deployed to scaffold an entire Model Context Protocol (MCP) server in a single coherent instruction by chaining multiple specialized skills.

## When to use

- User asks to **forge an MCP** or **create an MCP server** from scratch.
- The user provides an idea for a Context Protocol (e.g., "I want an MCP to read Jira tickets").

## Step 1: Architecture (skill-architect)

1. **Mental Model**: Act as the Analyst defined in `skill-architect`.
2. **Action**: Analyze the user's needs. List the "Tools" and "Resources" the MCP server will expose.
3. **Output**: Create a `.md` design file (e.g., `mcp_design.md`) outlining the target API (tool names, parameters, utility).

## Step 2: Skeleton Generation (mcp-builder)

1. **Mental Model**: Adopt the Builder mindset.
2. **Action**: Initialize a Node.js/TypeScript (or Python) project for the MCP. Install the Official SDK (e.g., `@modelcontextprotocol/sdk`).
3. **Output**: Set up the server shell (entry point `index.ts`, stdio or HTTP connection).

## Step 3: Atomic Implementation (artifact-maker)

1. **Mental Model**: Read the rules of `artifact-maker`.
2. **Action**: For each "Tool" defined by the Architect in Step 1, generate the exact business source file (e.g., `jira_client.ts`). Ensure pure error handling.
3. **Output**: Full implementation of MCP endpoints wired to business logic.

## Step 4: Routing and Exposition (flow-orchestrator)

1. **Mental Model**: Apply the rules of `flow-orchestrator`.
2. **Action**: Configure how the server handles asynchronous tasks, dynamic resource registration, and CI.
3. **Output**: A final `README.md` explaining how to connect Claude to this new MCP server in its `claude_desktop_config.json`.
