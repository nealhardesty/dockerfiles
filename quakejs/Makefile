default: build

build:
	#docker pull treyyoder/quakejs:latest
	docker build -t nealhardesty/quakejs:latest .

push: build
	docker push nealhardesty/quakejs:latest

run: stop build
	docker run --rm -d --name quakejs -p 80:80 -p 27960:27960 -e SERVER=127.0.0.1 -e HTTP_PORT=80 nealhardesty/quakejs:latest

play: run
	sleep 5
	-open 'http://www.quakejs.com/play?connect 127.0.0.1:27960'

stop:
	-docker kill quakejs

clean: stop
	-docker rm quakejs
    -docker rmi nealhardesty/quakejs:latest

