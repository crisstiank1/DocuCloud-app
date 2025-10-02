#!/bin/bash

# Este script detiene y elimina los contenedores de la aplicación DocuCloud.

# --- Variables y Colores ---
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# --- Funciones ---
function usage() {
    echo -e "Uso: $0 [dev|prod|clean]"
    echo -e "Detiene los contenedores."
    echo -e "  ${GREEN}dev${NC} : Detiene los servicios definidos en docker-compose.dev.yml."
    echo -e "  ${RED}prod${NC}: Detiene los servicios definidos en docker-compose.prod.yml."
    echo -e "  ${RED}clean${NC}: Detiene y ELIMINA los volúmenes de datos (¡Cuidado con los datos!)."
    exit 1
}

function stop_services() {
    COMPOSE_FILE=$1
    echo -e "--- Deteniendo servicios en $COMPOSE_FILE ---"
    docker-compose -f $COMPOSE_FILE down
    echo -e "${GREEN}Servicios detenidos.${NC}"
}

function clean_services() {
    COMPOSE_FILE=$1
    echo -e "--- DETENIENDO y ELIMINANDO contenedores, redes y VOLÚMENES de datos en $COMPOSE_FILE ---"
    # La bandera -v elimina los volúmenes, eliminando la persistencia de la DB
    docker-compose -f $COMPOSE_FILE down -v
    echo -e "${RED}Limpieza completa. Los datos de la base de datos han sido eliminados.${NC}"
}

# --- Ejecución ---
if [ "$#" -ne 1 ]; then
    usage
fi

ACTION=$1

case $ACTION in
    dev)
        stop_services "docker-compose.dev.yml"
        ;;
    prod)
        stop_services "docker-compose.prod.yml"
        ;;
    clean)
        clean_services "docker-compose.dev.yml"
        clean_services "docker-compose.prod.yml"
        ;;
    *)
        usage
        ;;
esac