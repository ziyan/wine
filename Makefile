.PHONY: all
all: run

.PHONY: run
run: build
	./bin/run.bash

.PHONY: build
build:
	mkdir -p build
	cp bin/entrypoint.bash build/entrypoint.bash
	./bin/dockerfile.bash > build/Dockerfile
	docker build -t ziyan/wine:$(USER) --rm build
