dkc := "docker-compose.yml"

up: 

	docker-compose -f ${dkc} build
	docker-compose -f ${dkc} up

build:
	docker-compose -f ${dkc} build


clean:
	docker-compose -f ${dkc} kill
	docker-compose -f ${dkc} stop
	docker-compose -f ${dkc} down --rmi local --volumes
	docker-compose -f ${dkc} rm -f
	@echo "Containers Docker foram parados e deletados."
migrate:
	docker exec product-api  python ./Product-api/manage.py  makemigrations
	docker exec product-api  python ./Product-api/manage.py  migrate
