---
name: skill-modern-frontend
description: Scaffolds, styles, and audits Next.js 15+ App Router projects utilizing Google Material UI v6/v7 with modern 2026 best practices. Use when the user says "create a modern frontend", "setup Next.js with MUI", "build a new web app", "/modern-frontend".
---

# Modern Frontend Skill (2026 Standards)

A structured protocol to build an absolute performance, perfect accessibility, and zero-runtime CSS-in-JS frontend application using React/Next.js and Google Material UI (MUI).

## When to use

- User wants to **build a new frontend** from scratch.
- User requests a **React / Next.js** application UI.
- User explicitly asks for **Material UI** or modern frontend practices.

## Step 1: Foundation (Architecture & Setup)

1. Use `npx create-next-app@latest` to initialize a new Next.js App Router project (using TypeScript, Tailwind CSS is optional but MUI will be primary).
2. Install the required MUI packages:

   ```bash
   npm install @mui/material @mui/material-nextjs @emotion/cache @emotion/react @emotion/styled @mui/icons-material
   ```

3. Create a dedicated registry for Emotion cache specifically for the App Router as per `@mui/material-nextjs` documentation.
4. Wrap your `app/layout.tsx` `children` with both the `AppRouterCacheProvider` (from `@mui/material-nextjs/v15-appRouter`) and your `ThemeProvider`.

## Step 2: The Design System (Performance First)

Configure the theme for zero-flicker dark mode and ultimate performance:

1. Do NOT use traditional `createTheme` with manual mode switching.
2. Initialize the theme using CSS variables support: `const theme = extendTheme({ colorSchemes: { light: true, dark: true } });`
3. Use the `InitColorSchemeScript` in the root document `<head>` to prevent dark mode flickering during hydration (or its Next.js App Router equivalent).
4. Use modern fonts ('Inter' or 'Outfit') and subtle glassmorphism effects for floating elements (AppBars, Dialogs, Cards) using backdrop filters and semi-transparent MUI variables.

## Step 3: Component Assembly Rules

Craft components using these strict rules:

1. **Core Reusable Components**: For complex, highly customized UI pieces used everywhere, utilize the `styled()` API. It provides strong encapsulation.
2. **Layouts & One-offs**: For spacing, responsive layouts, and unique adjustments on a single page, heavily rely on the `sx` prop. Example: `sx={{ width: { xs: '100%', md: '50%' } }}`.
3. **Strict Tree-Shaking**: Never import from the index file if you don't have to. (Use `import Button from '@mui/material/Button';`)
4. **Micro-interactions**: Use `startTransition` from React 19+ for state updates that trigger complex MUI animations so the main thread remains unblocked.
5. **Accessibility (A11y)**: Every interactive element must be keyboard accessible. All Dialogs and Modals must have `aria-labelledby` and `aria-describedby` props correctly linked.

## Step 4: Quality & SEO Audit

Before finalizing the implementation, you must invoke the `seo-audit` skill.

1. Ensure semantic HTML blocks (`<main>`, `<section>`, `<article>`) are used alongside MUI's `<Box>` component (e.g., `<Box component="main">`).
2. Verify that Interaction to Next Paint (INP) best practices are respected (no heavy blocking operations on click events).

## Integration (Agent Synergy)

To forge an ultimate frontend mega-skill, combine this with:

| Skill | Chain |
|---|---|
| `skill-architect` | Define the Next.js routing and folder structure. |
| `ui-style-generator` | Initialize a global theme with HSL colors and typography. |
| `artifact-maker` | Craft each atomic component (Buttons, Cards). |
| `seo-audit` | Guard the performance and SEO standards. |
