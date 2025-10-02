Detiene y limpia los contenedores de producción (si están corriendo)
stop-prod:
@echo "--- Deteniendo contenedores de Docker (Producción) ---"
docker-compose -f $(COMPOSE_PROD) down

Detiene y ELIMINA los volúmenes de datos (RESET total)
clean:
@echo "--- Limpieza completa: Deteniendo y eliminando contenedores, redes y volúmenes de datos ---"
docker-compose -f $(COMPOSE_DEV) down -v
docker-compose -f $(COMPOSE_PROD) down -v

Muestra el estado actual de los contenedores
status:
@echo "--- Estado de los servicios DocuCloud ---"
docker-compose -f $(COMPOSE_DEV) ps