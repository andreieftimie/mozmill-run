You need

## Prerequisites

* [mozmill](https://github.com/mozilla/mozmill)
* mozdownload (pip install mozdownload)
* [mozmill-automation](https://github.com/whimboo/mozmill-automation)

## Install

1. Create a Virtualenv and activate it
2. cd into mozmill
3. run > ./setup_development.py
4. cd into mozmill-automation
5. run > python setup.py install
6. install mozdownload > pip install mozdownload
7. cd into mozmill-run
8. run > . run_all_mozmill2_tests.sh

## What mozmill-run does

mozmill-run will

1. download latest Firefox versions for all branches (using mozdownlaod)
    * nightly
    * aurora
    * beta
    * release
    * esr
2. run mozmill automation test against all of them (using mozmill-automation)
    * l10n
    * addons
    * remote
    * endurance

## ToDo

* update testrun
* might change it later to a python lib (from a shell script)
