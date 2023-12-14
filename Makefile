.PHONY: run
run: build-image run-container

.PHONY: build-image
build-image:
	docker build . -t cypress-m1-bug

.PHONY: run-container
run-container:
	docker run --rm -i cypress-m1-bug ./runme.sh

it: build-image
	docker run --rm -it cypress-m1-bug bash 

it8: build-image
	docker build - -t cypress-m1-bug-rhel8 < Dockerfile8
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-rhel8 bash 

it9: build-image
	docker build - -t cypress-m1-bug-rhel9 < Dockerfile9
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-rhel9 bash 

itcyp: build-image
	docker build - -t cypress-m1-bug-cypress < DockerfileCypress
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-cypress bash 
