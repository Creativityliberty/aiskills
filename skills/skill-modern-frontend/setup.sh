#!/bin/bash
# script d'installation rapide pour le scaffold du frontend (standards 2026)
echo "🚀 Initialisation du projet Next.js App Router (TypeScript, Material UI v6/v7)"

# Nom du projet
PROJECT_NAME=$1
if [ -z "$PROJECT_NAME" ]; then
  echo "Veuillez fournir un nom de projet. Exemple: ./setup.sh mon-app"
  exit 1
fi

# 1. Création de l'application Next.js (Désactive src/ dir et Tailwind optionnel)
npx create-next-app@latest -y "$PROJECT_NAME" --ts --eslint --app --tailwind --src-dir=false --import-alias "@/*"
cd "$PROJECT_NAME" || exit

# 2. Installation des paquets Material UI
echo "📦 Installation de Material UI, Emotion et Icons..."
npm install @mui/material @mui/material-nextjs @emotion/cache @emotion/react @emotion/styled @mui/icons-material

# 3. Message de réussite
echo "✅ Projet scaffoldé avec succès dans $PROJECT_NAME"
echo ""
echo "🔥 Prochaines étapes de configuration (Voir SKILL.md) :"
echo "1. Ajoutez le ThemeRegistry et l'AppRouterCacheProvider dans app/layout.tsx"
echo "2. Initialisez le thème avec CssVarsProvider et InitColorSchemeScript"
echo "3. Lancer: cd $PROJECT_NAME && npm run dev"
