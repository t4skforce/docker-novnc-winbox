.PHONY: all clean build run

all: build run

clean:
	@echo "cleaning things"
	docker kill docker-novnc-winbox && echo "stopped container" || /bin/true
	docker rm docker-novnc-winbox && echo "removed container" || /bin/true
	docker rmi t4skforce/docker-novnc-winbox:latest && echo "removed container image" || /bin/true

build:
	@echo "building things"
	docker build -t t4skforce/docker-novnc-winbox:latest .

run:
	@echo "runing things"
	docker run --name docker-novnc-winbox -it -p 127.0.0.1:8080:8080/tcp -e REVERSE_PROXY=no -v ~/Downloads:/data/.wine:rw --rm t4skforce/docker-novnc-winbox:latest
