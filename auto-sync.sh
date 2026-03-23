#!/bin/bash

# Script de auto-sincronización con GitHub
# Monitorea cambios y hace pull/push automáticos

cd /workspaces/SuccubusIslandPage

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}[Auto-Sync] Iniciado${NC}"

while true; do
    # Esperar 2 segundos antes de verificar cambios
    sleep 2
    
    # Verificar si hay cambios sin stagear
    if ! git diff-index --quiet HEAD --; then
        echo -e "${YELLOW}[$(date '+%H:%M:%S')] Cambios detectados, sincronizando...${NC}"
        
        # Agregar todos los cambios
        git add -A
        
        # Crear commit con timestamp
        git commit -m "Auto-sync: $(date '+%Y-%m-%d %H:%M:%S')"
        
        # Hacer push
        if git push origin main; then
            echo -e "${GREEN}[$(date '+%H:%M:%S')] ✓ Sincronized con GitHub${NC}"
        else
            echo -e "${RED}[$(date '+%H:%M:%S')] ✗ Error en push${NC}"
        fi
    fi
done
