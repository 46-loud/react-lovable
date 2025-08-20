PROJECT=frontend
COMPOSE_FILE=./infrastructure/compose.yml
COMPOSE=docker compose -f ${COMPOSE_FILE} -p ${PROJECT}
CONTAINER?=frontend
DIR?=./src

clean:
	${COMPOSE} down --rmi all

clean-all:
	@if [ ! -z "$(shell docker container ls -aq)" ]; then \
		docker container rm -f $(shell docker container ls -aq); \
	fi;
	@docker container prune -f
	@docker image prune -a -f
	@docker network prune -f
	@docker volume prune -f
	@docker system prune -f

debug:
	@${COMPOSE} exec ${CONTAINER} sh

logs:
	@${COMPOSE} logs ${CONTAINER} -f

lint:
	@${COMPOSE} exec ${CONTAINER} npm run lint ${DIR}

start: clean
	${COMPOSE} up --build --force-recreate -d

stop:
	@${COMPOSE} down
