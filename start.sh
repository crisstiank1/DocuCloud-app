#!/bin/bash

# Este script se usa para iniciar la aplicación DocuCloud en diferentes modos.

# --- Variables y Colores ---
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# --- Funciones ---
function usage() {
    echo -e "Uso: $0 [dev|prod]"
    echo -e "Inicia DocuCloud en modo desarrollo o producción."
    echo -e "  ${GREEN}dev${NC} : Usa docker-compose.dev.yml con volúmenes para desarrollo rápido."
    echo -e "  ${RED}prod${NC}: Usa docker-compose.prod.yml para un despliegue optimizado."
    exit 1
}

function start_dev() {
    echo -e "${GREEN}--- Iniciando DocuCloud en modo DESARROLLO (dev) ---${NC}"
    # Usamos --build para asegurar que las imágenes se actualicen con el código local
    docker-compose -f docker-compose.dev.yml up --build -d
    echo -e "${GREEN}Desarrollo iniciado. Accede a http://localhost:${FRONTEND_PORT} (o puerto 80 si no está en .env)${NC}"
}

function start_prod() {
    echo -e "${RED}--- Iniciando DocuCloud en modo PRODUCCIÓN (prod) ---${NC}"
    # En producción, primero reconstruimos todo
    docker-compose -f docker-compose.prod.yml build
    # Luego levantamos los contenedores
    docker-compose -f docker-compose.prod.yml up -d
    echo -e "${RED}Producción iniciada. Accede a http://localhost (o el host del servidor)${NC}"
}

# --- Ejecución ---
if [ "$#" -ne 1 ]; then
    usage
fi

MODE=$1

case $MODE in
    dev)
        start_dev
        ;;
    prod)
        start_prod
        ;;
    *)
        usage
        ;;
esac
