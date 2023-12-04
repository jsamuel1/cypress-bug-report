.PHONY: run
run: build-image run-container

.PHONY: build-image
build-image:
	docker build . -t cypress-m1-bug
	docker build - -t cypress-m1-bug-rhel8 < Dockerfile8
	docker build - -t cypress-m1-bug-rhel9 < Dockerfile9
	docker build - -t cypress-m1-bug-cypress < DockerfileCypress

.PHONY: run-container
run-container:
	docker run --rm -i --mount type=bind,src=./,dst=/app cypress-m1-bug bash -c "npm install && ./node_modules/.bin/cypress run --spec cypress/e2e/spec.cy.js"

it: build-image
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug bash 

it8: build-image
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-rhel8 bash 

it9: build-image
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-rhel9 bash 

itcyp: build-image
	docker run --rm -it --mount type=bind,src=./,dst=/app cypress-m1-bug-cypress bash 
