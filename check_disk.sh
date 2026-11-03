
#!/bin/bash

# Recuperer le seuil (80 par defaut)
SEUIL=${1:-80}

# Recuperer le pourcentage d'utilisation du disque
UTILISATION=$(df / | awk 'NR==2 {print $(NF-1)}' | tr -d '%')

# Afficher les informations
echo "Utilisation du disque : ${UTILISATION}%"
echo "Seuil : ${SEUIL}%"

# Comparer les deux valeurs
if [ "$UTILISATION" -gt "$SEUIL" ]; then
    echo "ALERTE : espace disque utilise trop important !"
    exit 1
else
    echo "OK : espace disque normal."
    exit 0
fi

