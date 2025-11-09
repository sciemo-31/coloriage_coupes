#!/bin/bash

# Vérifie qu'un fichier est donné en argument
if [ $# -ne 1 ]; then
  echo "Usage : $0 fichier.txt"
  exit 1
fi

file="$1"

# Vérifie que le fichier existe
if [ ! -f "$file" ]; then
  echo "Erreur : fichier '$file' introuvable."
  exit 1
fi

# Lire les lignes du fichier dans un tableau
mapfile -t words < "$file"

total=${#words[@]}
if (( total < 2 )); then
  echo "Pas assez de mots (au moins 2 requis)."
  exit 1
fi

# Créer un fichier temporaire
tmpfile=$(mktemp)

# Écrire le contenu modifié dans le fichier temporaire
for i in "${!words[@]}"; do
  percent=$(awk -v i="$i" -v total="$total" 'BEGIN { printf("%.2f", 100 - (100 * i / (total - 1))) }')
  echo "%$percent% ${words[i]}" >> "$tmpfile"
done

# Remplacer le fichier d'origine
mv "$tmpfile" "$file"
echo "✅ Fichier modifié : $file"


