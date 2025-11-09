#!/bin/bash

# Liste des mots
mots=(
"terre"
"ponctuel"
"chaise"
"campagne"
"bazooka"
"nid"
"fixer"
"fouet"
"ninja"
"principe"
"saison"
"rateau"
"canyon"
"boucle"
"brut"
"octobre"
"saturne"
"citerne"
"population"
"pince"
"choix"
"marche"
"agiter"
"climatisation"
"collection"
"couvert"
"janvier"




	)


# Mélange les mots
mots_melanges=($(printf "%s\n" "${mots[@]}" | shuf))

# Affiche les mots mélangés avec les commentaires dans l'ordre d'origine
for i in "${!mots_melanges[@]}"; do
  suffix="erreur"
  [[ $i -ne 0 ]] && suffix="erreurs"
  printf '          "%s", //%d %s\n' "${mots_melanges[$i]}" "$i" "$suffix"
done
