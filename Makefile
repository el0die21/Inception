all: 
	mkdir -p /home/elrichar/data/mariadb
	mkdir -p /home/elrichar/data/wordpress
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker compose -f ./srcs/docker-compose.yml logs

clean:
	docker container stop nginx mariadb wordpress
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/elrichar/data/mariadb/*
	@sudo rm -rf /home/elrichar/data/wordpress/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean