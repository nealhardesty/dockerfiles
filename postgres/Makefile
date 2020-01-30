default: build

build:
	docker build -t postgres .

run: build
	docker run -d --name postgres -p 5432:5432 postgres:latest 

stop:
	docker stop postgres

clean: stop
	docker rm postgres
	docker rmi postgres

