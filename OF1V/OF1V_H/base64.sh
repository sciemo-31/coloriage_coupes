#!/usr/bin/env bash

# Liste de mots à encoder
mots=(
"marche"
"saturne"
"brut"
"chaise"
"ninja"
"ponctuel"
"rateau"
"canyon"
"fouet"
"choix"
"pince"
"nid"
"terre"
"octobre"
"agiter"
"citerne"
"saison"
"boucle"
"couvert"
"janvier"
"fixer"
"principe"
"population"
"climatisation"
"bazooka"
"campagne"
"collection"

	)


# Encodage en Base64
encoded=()
for mot in "${mots[@]}"; do
    encoded+=( "$(echo -n "$mot" | base64)" )
done

# Mélange des indices
indices=($(seq 0 $((${#encoded[@]} - 1))))
shuffled=($(shuf -e "${indices[@]}"))

# Création du tableau mélangé
encoded_shuffled=()
for idx in "${shuffled[@]}"; do
    encoded_shuffled+=("${encoded[$idx]}")
done

# Calcul de la clé ordreOriginal
ordre_original=()
for i in "${indices[@]}"; do
    for j in "${!shuffled[@]}"; do
        if [[ "${shuffled[$j]}" -eq "$i" ]]; then
            ordre_original+=("$j")
            break
        fi
    done
done

# Affichage du résultat
echo "Tableau mélangé Base64 :"
printf '"%s", ' "${encoded_shuffled[@]}"
echo
echo
echo "clé ordreOriginal :"
printf '%s, ' "${ordre_original[@]}"
echo

