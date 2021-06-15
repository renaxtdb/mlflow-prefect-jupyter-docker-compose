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
clean-cache:
	docker system prune;
clean-all:
	make down;
	docker system prune -f;
hist:
	docker-compose logs -f;
