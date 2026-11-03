#!/bin/bash

echo "Exercice 2.1 : Navigation et recherche"

mkdir -p logs data

echo "Liste des fichiers log :"
find logs -type f -name "*.log"

echo "Fichiers modifies depuis plus de 7 jours :"
find . -type f -mtime +7

echo "Recherche du mot erreur :"
grep -ri --include="*.log" "erreur" logs || true

echo "erreur : test de recherche" >> logs/app1.log

echo "Verification :"
grep -ri --include="*.log" "erreur" logs

chmod 700 script.sh
