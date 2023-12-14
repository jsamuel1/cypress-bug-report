.PHONY: run
run: build-image run-container

.PHONY: official
official: build-official run-official

.PHONY: build-image
build-image:
	docker build . -f centos7/Dockerfile -t cypress-m1-bug

build-official:
	docker build . -f cypress-dockerimg/Dockerfile -t cypress-m1-bug-cypress 

.PHONY: run-container
run-container:
	docker run --rm -i cypress-m1-bug 

.PHONY: run-official
run-official: 
	docker run --rm -i cypress-m1-bug-cypress

it: build-image
	docker run --rm -it cypress-m1-bug bash 

it8: build-image
	docker build . -f rhel8/Dockerfile -t cypress-m1-bug-rhel8 
	docker run --rm -it cypress-m1-bug-rhel8 bash 

it9: build-image
	docker build . -f rhel9/Dockerfile -t cypress-m1-bug-rhel9 
	docker run --rm -it cypress-m1-bug-rhel9 bash 

itcyp: build-official
	docker run --rm -it cypress-m1-bug-cypress bash 
