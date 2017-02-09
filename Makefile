.PHONY: default
default: up;

.PHONY: start
start: up;

.PHONY: stop
stop: down;	

.PHONY: up
# Run d4m-nfs and docker-compose up -d
up:
	./d4m-nfs/d4m-nfs.sh && docker-compose up -d

.PHONY: down
# Run docker-compose down
down:
	docker-compose down