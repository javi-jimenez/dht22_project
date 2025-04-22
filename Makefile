MAKEFLAGS += --silent

include .env

all: docker-build up

docker-build:
	# docker buildx build --builder $(BUILDER) --build-arg BUILDPLATFORM=$(BUILDPLATFORM) --build-arg TARGETPLATFORM=$(TARGETPLATFORM) --platform linux/arm/v6 --tag javi-jimenez/dht22_project:latest --progress plain --load .
	# docker buildx build --platform linux/arm/v6 .
	docker buildx build --platform linux/arm/v6 --tag $(REGISTRY)/dht22_project:latest --progress plain --load . --push

up:
	# docker service create dht22 $(STACK_NAME)
	# docker stack deploy dht22 -c docker-compose.yml $(STACK_NAME)
	docker stack deploy dht22 -c docker-compose.yml

.PHONY: all
