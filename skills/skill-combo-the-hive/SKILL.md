---
name: skill-combo-the-hive
description: The Specialized Agent Factory. A mega-skill to deploy a fleet of asynchronous agents (via Pocketflow or CrewAI) to accomplish a complex research or coding project. Use when the user says "create an agent swarm", "build the hive", "multi-agent system for", "/the-hive".
---

# Combo: The Hive (Multi-Agent Factory)

Orchestrates the creation and deployment of a swarm of cooperative artificial intelligence agents, combining Blueprints, DAG Taskviews, Agent Instantiation, and Morsel Tasks.

## When to use

- User requests an **autonomous multi-agent system**.
- User has a large project requiring **specialization** (e.g., "Create a competitive intelligence system").

## Step 1: Planning (blueprint-maker)

1. **Mental Model**: Take on the role of `blueprint-maker`.
2. **Action**: Analyze the grand project. Identify necessary roles (e.g., The Researcher, The Writer, The Reviewer).
3. **Output**: A design document (e.g., `hive_blueprint.md`) explaining who does what and the global flow.

## Step 2: Workflow Modeling (dag-taskview)

1. **Mental Model**: Read the rules of `dag-taskview`.
2. **Action**: Model the business workflow from Step 1 as a Directed Acyclic Graph (DAG). Who depends on whom? Who runs in parallel?
3. **Output**: A task graph defining strict execution order (Crawler -> Analyzer -> Report Writer).

## Step 3: Fleet Instantiation (agent-pocketflow / num-agents)

1. **Mental Model**: Use the mindset from `agent-pocketflow`.
2. **Action**: Write the instantiation code for each specific agent identified in the DAG.
3. **Output**: Network source code (e.g., `agents.ts` or `agents.py`) containing configurations and system prompts for the entire fleet.

## Step 4: Task Distribution (morsel-tasks)

1. **Mental Model**: Apply the rules of `morsel-tasks`.
2. **Action**: Define ultra-precise asynchronous prompts (work units) for each agent to prevent hallucinations.
3. **Output**: Final integration of task payloads into The Hive's execution workflow.
