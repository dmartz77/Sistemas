#!/bin/bash

# Directorio del repositorio
REPO_DIR="/root/playbooks/Sistemas"
cd "$REPO_DIR" || exit 1

# Fecha para el commit
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

# Verificamos si hay cambios
if git status --porcelain | grep .; then
    echo "📦 Cambios detectados. Subiendo al repositorio..."

    git add .
    git commit -m "Actualización automática: $FECHA"
    git push origin main

    echo "✅ Cambios subidos correctamente a GitHub."
else
    echo "🔄 No hay cambios para subir."
fi
