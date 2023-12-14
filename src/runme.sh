#!/bin/bash
#

source ~/.nvm/nvm.sh

npx cypress install

npx neofetch

npx cypress run --spec cypress/e2e/spec.cy.js
