## To run the test ##
* From an ARM64 based machine, eg. AWS Graviton2 or Graviton3 instances
* ensure docker is installed and working
* Execute in your terminal
  
  ```bash
  make run
  ```

To run expected results test (Cypress bullseye image):
* Execute in your terminal
  
  ```bash
  make official
  ```

## Interactive Containers for Testing different OS's

Interactive shell to do test runs:
Choose one of:
* `make it` - Centos7 (will fail)
* `make it8` - RHEL8 (will fail)
* `make it9` - RHEL9 (will pass tests)
* `make itcyp` - Cypress official image (will pass tests)

To run the tests in one of the above interactive shells:

* On RHEL8 or RHEL9, first run the following:
  * run `./pre-rhel.sh`
  * You may need to register your RHEL subscription, if not running on a RHEL host
    * Enter your redhat username/password when prompted to register
      
* `./runme.sh` will execute the test.

## Acknowledgements ##
This repo was forked and then modified from DmytroPolavis/cypress-bug-report , who created a similar bug report
