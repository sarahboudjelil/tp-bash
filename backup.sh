
#!/bin/bash

# Gestion des erreurs
set -Eeuo pipefail

# Nom du dossier a sauvegarder
DOSSIER="documents"

# Nom du dossier de sauvegarde
DESTINATION="backups"

# Verifier si le dossier existe
if [ ! -d "$DOSSIER" ]; then
    echo "ERREUR : le dossier documents n'existe pas !" >&2
    exit 1
fi

# Creer le dossier backups
mkdir -p "$DESTINATION"

# Recuperer la date et l'heure
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Nom de la sauvegarde
ARCHIVE="$DESTINATION/backup_$DATE.tar.gz"

# Creer la sauvegarde
tar -czf "$ARCHIVE" "$DOSSIER"

# Afficher un message
echo "Sauvegarde reussie !"

# Supprimer les anciennes sauvegardes
for fichier in "$DESTINATION"/*.tar.gz; do
    if [ -f "$fichier" ]; then
        find "$fichier" -type f -mtime +7 -exec rm {} \;
    fi
done

echo "Nettoyage termine !"


