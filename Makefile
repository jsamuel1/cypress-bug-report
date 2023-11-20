.PHONY: run
run: build-image run-container

.PHONY: build-image
build-image:
	docker build . -t cypress-m1-bug

.PHONY: run-container
run-container:
	docker run --rm -i --mount type=bind,src=./,dst=/app cypress-m1-bug bash -c "npm install && ./node_modules/.bin/cypress run --spec cypress/e2e/spec.cy.js"