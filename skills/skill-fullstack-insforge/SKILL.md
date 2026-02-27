---
name: skill-fullstack-insforge
description: Scaffolds a complete Next.js application integrating the InsForge SDK to dynamically generate the database, authentication, and UI components via AI. Use when the user says "create fullstack app", "use insforge", "scaffold backend and frontend together", "/insforge".
---

# InsForge Fullstack Skill

Creates ultra-fast fullstack applications by leveraging the [InsForge](https://insforge.dev) backend-as-a-service coupled with Next.js App Router and React Server Components.

## When to use

- User wants a **fullstack application** quickly.
- User needs a **database** paired with their Next.js UI out of the box.
- User explicitly requests **InsForge** integration.

## Step 1: Application Initialization

1. Use the provided installation script (`setup.sh`) or manually execute `npx create-next-app@latest` (with TypeScript and Tailwind CSS).
2. Install the InsForge SDK:

   ```bash
   npm install @insforge/sdk
   ```

## Step 2: InsForge Client Configuration

1. Create the client configuration file `lib/insforge.ts`.
2. Populate the file loading credentials from environment variables:

   ```typescript
   import { createClient } from '@insforge/sdk';

   const insforgeUrl = process.env.NEXT_PUBLIC_INSFORGE_URL || 'https://votre-projet.insforge.app';
   const insforgeKey = process.env.NEXT_PUBLIC_INSFORGE_ANON_KEY || 'votre-anon-key';

   export const insforge = createClient({
     baseUrl: insforgeUrl,
     anonKey: insforgeKey,
   });
   ```

## Step 3: Data Modeling via InsForge

Send instructions to the InsForge backend to create necessary data models.

- **Action**: Prompt the InsForge MCP to execute remote DB creation (e.g., "Create a `sports` table with `id` and `name` columns").
- The MCP will handle executing these backend schema changes.

## Step 4: Page and Component Generation (RSC)

Generate Next.js App Router pages using Server Components (RSC) to fetch data directly via the `insforge` instance.

Example Server Page (`app/sports/page.tsx`):

```typescript
import { insforge } from '@/lib/insforge';

export default async function SportsPage() {
  const { data: sports, error } = await insforge.database.from('sports').select();

  if (error) {
    return <div>Erreur de chargement: {error.message}</div>;
  }

  return (
    <div className="p-8">
      <h1 className="text-3xl font-bold mb-6">Object List</h1>
      <div className="grid gap-4 md:grid-cols-3">
        {sports?.map((item) => (
          <div key={item.id} className="p-4 border rounded shadow">
            {item.name}
          </div>
        ))}
      </div>
    </div>
  );
}
```

## Step 5: Follow-Up Prompts

Once the base setup is complete, suggest the following to the user:

- "Add a form with Next.js Server Actions to insert data into InsForge."
- "Implement OAuth authentication with InsForge and restrict page access."
