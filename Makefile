all: up configure_volumes

up: configure_volumes
	@echo "Lifting containers..."
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	@echo "!DONE!"

down:
	@echo "Dropping containers..."
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "!DONE!"

hard_down:
	@echo "Dropping containers and removing volumes..."
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@echo "!DONE!"

start:
	@echo "Starting containers..."
	@docker-compose -f ./srcs/docker-compose.yml start
	@echo "!DONE!"

stop:
	@echo "Stopping containers..."
	docker-compose -f ./srcs/docker-compose.yml stop
	@echo "!DONE!"

rm:
	@echo "Removing stopped service containers..."
	@docker-compose -f ./srcs/docker-compose.yml rm
	@echo "!DONE!"

clean:
	@echo "Cleaning docker containers..."
	@docker kill $(docker ps -q) 2> /dev/null || true
	@docker rm $(docker ps -aq) 2> /dev/null || true
	@echo "!DONE!"

fclean: clean
	@echo "Cleaning all docker images, networks, containers..."
	@docker system prune -a
	@echo "!DONE!"

hard_reset: hard_down fclean
	@echo "Cleaning all docker volumes...";
	@docker volume rm $(docker volume ls -q) 2> /dev/null || true
	@echo "!DONE!"

configure_volumes:
	@mkdir -p ./srcs/wp_volume
	@mkdir -p ./srcs/sql_volume

remove_volumes:
	@rm -rf ./srcs/wp_volume
	@rm -rf ./srcs/sql_volume