.PHONY: all
all: build

.PHONY: build
build:
	docker build -t ziyan/wine --rm .

.PHONY: push
push:
	docker push ziyan/wine
