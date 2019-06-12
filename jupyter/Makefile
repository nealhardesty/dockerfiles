default: build

PASSWORD?=password
DIR:=$(dirname $0)

.PHONY: build

build:
	docker build --build-arg PASSWORD=${PASSWORD} -t nealhardesty/jupyter:latest -t jupyter .

push: build
	docker login
	docker push nealhardesty/jupyter

stop: 
	docker stop jupyter || echo was not running
	docker rm -f jupyter || echo did not exist

run: stop 
	docker run -d -ti --init --rm --name jupyter -v ~:/home/jupyter/home -v ~/.kube:/home/jupyter/.kube -v ~/.aws:/home/jupyter/.aws -v ~/Dropbox/notebooks:/home/jupyter/notebooks -p 8888:8888 jupyter
	
