#!/bin/bash
# Variables pour la connexion à la bdd
USER="sio"
PASSWORD="btsinfo"
DB="MyGest"

# Le nom du fichier généré
fichier_de_sortie="liste_ip.txt"

# Récupération de toutes les adressses IP des équipements
mysql -u $USER -p $PASSWORD -D $DB -se "SELECT adIP FROM Equipement;" > $fichier_de_sortie

# Sert à verifier si le fichier à pu être créé
if [[ -s $fichier_de_sortie ]]; then
	echo "Le fichier $fichier_de_sortie à bien été généré."
else
	echo "Aucune adresse IP trouvée dans la base de données."
fi 


