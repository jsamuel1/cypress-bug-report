#!/bin/bash
#
npm install 
npx cypress install

neofetch

npx cypress run --spec cypress/e2e/spec.cy.js
