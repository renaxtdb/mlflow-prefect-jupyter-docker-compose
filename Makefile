agent_num = 1

build:
	docker-compose build;
up:
	docker-compose up --scale prefect_agent=${agent_num};
up-background:
	docker-compose up -d --scale prefect_agent=${agent_num};
agent-scale:
	docker-compose up -d --scale prefect_agent=${agent_num} prefect_agent;
stop:
	docker-compose stop;
down:
	docker-compose down;
clear-cache:
	docker system prune;
all-clean:
	make down;
	docker system prune -f;
hist:
	docker-compose logs -f;
remve-dbs:
	rm -rf logs/db;
	rm -rf logs/artifacts/*;
init-prefect-server:
	prefect backend server;
	prefect server create-tenant -n default;

