---
name: skill-combo-saas-factory
description: The "Zero-to-Prod" SaaS Factory. A mega-combo orchestrating the entire lifecycle of a SaaS application from a single prompt. Chains Blueprint Maker (Business Logic), InsForge (Database/Auth Backend), and Modern Frontend (Next.js/MUI). Use when the user says "build a saas", "create a startup app", "zero to prod", "/saas-factory".
---

# Combo: SaaS Factory (L'Usine à SaaS "Zero-to-Prod")

A towering achievement in orchestration. This mega-skill takes a vague user idea (e.g., "A competitive intelligence dashboard for real estate") and autonomously spins up the business plan, the backend database, the authentication, and the ultra-premium frontend.

## When to use

- User has a rapid **startup idea** or needs a complete SaaS built from scratch.
- The project requires a complete **Frontend + Backend + Database** architecture instantly.
- The goal is an immediate Proof of Value ready for production.

## Step 1: Ideation & Architecture (`blueprint-maker`)

1. **Mental Model**: The Product Manager / Solution Architect.
2. **Action**: Prompt the user for the 1-sentence goal of the SaaS.
3. **Execution**: Invoke the core logic of `blueprint-maker` to generate a `saas_blueprint.md`.
   - Define the Core Features (MVP).
   - Define the Data Models required (Users, Subscriptions, Core Entities).

## Step 2: The Data & API Backbone (`skill-fullstack-insforge`)

1. **Mental Model**: The Backend Engineer.
2. **Action**: Read the Data Models from the `saas_blueprint.md`.
3. **Execution**:
   - Initialize the Next.js target directory.
   - Configure the `@insforge/sdk`.
   - Send prompts to the InsForge MCP to generate the exact database tables, columns, and relations defined in the Blueprint. Set up Row-Level Security (RLS) rules and Authentication logic.

## Step 3: The Premium UI Shell (`skill-modern-frontend`)

1. **Mental Model**: The 2026 Frontend Lead Designer.
2. **Action**: Build the interface over the InsForge backend.
3. **Execution**:
   - Inject the Google Material UI (MUI v6/v7) setup into the Next.js App Router.
   - Implement the `ThemeProvider` with zero-flicker dark mode and premium HSL color tokens.
   - Generate the Server Components (RSC) to fetch the data directly from the InsForge database, displaying it in Glassmorphism cards and responsive data grids.

## Step 4: The Final Polish (`skill-roast-my-ui` & `seo-audit`)

1. **Mental Model**: The ruthless Quality Assurance Auditor.
2. **Action**: Review the generated application.
3. **Execution**:
   - Ensure the Next.js HTML contains proper meta tags and semantic structure.
   - Do a final UX pass to guarantee perfect spacing, WCAG contrast, and interactive hover states on all newly generated components.

## Output

Present the user with the starting command (`npm run dev`) and a summary of what the SaaS Factory has built:
- The Database Schema URL (InsForge dashboard).
- The Application Structure.
- The Next Steps for Deployment (Vercel/Netlify).
