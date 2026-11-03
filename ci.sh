#!/bin/bash

set -e

echo "Verification des scripts Bash..."

for fichier in backup.sh check_disk.sh script.sh ci.sh
do
    bash -n "$fichier"
    echo "$fichier : OK"
done

echo "Tous les scripts sont valides."
