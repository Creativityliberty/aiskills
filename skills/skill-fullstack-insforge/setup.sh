#!/bin/bash
# script d'installation rapide pour Next.js + InsForge
echo "🚀 Initialisation du projet Next.js App Router avec InsForge SDK"

# Nom du projet
PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
  echo "Veuillez fournir un nom de projet. Exemple: ./setup.sh mon-app-insforge"
  exit 1
fi

# 1. Création de l'application Next.js 
npx create-next-app@latest -y "$PROJECT_NAME" --ts --eslint --app --tailwind --src-dir=false --import-alias "@/*"
cd "$PROJECT_NAME" || exit

# 2. Installation du SDK InsForge
echo "📦 Installation de @insforge/sdk..."
npm install @insforge/sdk

# 3. Message de réussite
echo "✅ Projet scaffoldé avec succès dans $PROJECT_NAME"
echo ""
echo "🔥 Prochaines étapes de configuration (Voir SKILL.md) :"
echo "1. Configurez vos clés dans un fichier .env.local (NEXT_PUBLIC_INSFORGE_URL et NEXT_PUBLIC_INSFORGE_ANON_KEY)"
echo "2. Initialisez le client dans lib/insforge.ts"
echo "3. Lancer: cd $PROJECT_NAME && npm run dev"
