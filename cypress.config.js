const { defineConfig } = require('cypress')

module.exports = defineConfig({
    video: false,
    viewportWidth: 1920,
    viewportHeight: 1080,
    defaultCommandTimeout: 10000,
    pageLoadTimeout: 60000,
    requestTimeout: 60000,
    responseTimeout: 60000,
    numTestsKeptInMemory: 5,
    e2e: {},
});
