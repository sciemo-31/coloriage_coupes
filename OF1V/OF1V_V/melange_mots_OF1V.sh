#!/bin/bash

# Liste des mots
mots=(
soleil
lunette
calculatrice
champ
verre
nuage
plante
rose
voiture
fouet
hiver
mur
ballon
cahier
prise
mars
voyager
saturne
cartouche
touche
gant
feu
sac
climat
carton
)

# Mélange les mots
mots_melanges=($(printf "%s\n" "${mots[@]}" | shuf))

# Affiche les mots mélangés avec les commentaires dans l'ordre d'origine
for i in "${!mots_melanges[@]}"; do
  suffix="erreur"
  [[ $i -ne 0 ]] && suffix="erreurs"
  printf '          "%s", //%d %s\n' "${mots_melanges[$i]}" "$i" "$suffix"
done
