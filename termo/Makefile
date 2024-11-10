IMAGE_NAME = termo

.PHONY: all build run clean build-run

all: build-run

build:
	sudo docker build -t $(IMAGE_NAME) .

run:
	sudo docker run --rm -it $(IMAGE_NAME)

build-run: build run

clean:
	sudo docker rmi $(IMAGE_NAME) || true
