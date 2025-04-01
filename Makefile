MAKEFLAGS += --silent

include .env

all: docker-build up

docker-build:
	# docker buildx build --builder $(BUILDER) --build-arg BUILDPLATFORM=$(BUILDPLATFORM) --build-arg TARGETPLATFORM=$(TARGETPLATFORM) --platform linux/arm/v6 --tag javi-jimenez/dht22_project:latest --progress plain --load .
	# docker buildx build --platform linux/arm/v6 .
	docker buildx build --platform linux/arm/v6 --tag javi-jimenez/dht22_project:latest --progress plain --load .

up:
	docker service create dht22


.PHONY: all
