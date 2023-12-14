To run the test (forked/modified from DmytroPolavis/cypress-bug-report):
* Just execute in your terminal `make run`

To run expected results test (Cypress bullseye image):
* Just execute in your terminal `make official`

For RHEL8/9/Cypress tests, interactive shell to do test runs:
* `make it`, `make it8`,`make it9` or `make itcyp`
* This will give you an interactive shell on the image
* RHEL8/9 - run `pre-rhel.sh`
* * You may need to register your RHEL subscription, if not running on a RHEL host
* `runme.sh` will execute the test.

