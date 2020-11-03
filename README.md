# Karate framework automation tests project 

## Table of Contents
- [Objective](#objective)
- [Tech Stack](#tech-stack)
- [External Dependencies and Versions](#external-dependencies-and-versions)
- [Structure](#structure)
  - [Preconditions](#Preconditions)

## Objective
Objective was defined to provide automated functional Karate+MQTT tests for [cpi](https://github.com/) project.

## Tech Stack
- [maven](https://hub.docker.com/_/maven)
- [karate](https://github.com/intuit/karate)

## Setup
After cloning the project, from the root directory execute *docker-compose run karate-tests*.
Docker container will be created and tests run with html report as outup in mounted /results folder.

## Structure

#### HTML Report
- `./results`: HTML report

#### Preconditions
* Env variables defined:
      - GIT_BRANCH=${GIT_BRANCH} (this var will be fetched from Jenkins server)
should be supplied with required values for the test using td-cli:
      - DEVICES_OAUTH_CLIENT_ID_QA=${DEVICES_OAUTH_CLIENT_ID_QA}
      - DEVICES_OAUTH_CLIENT_SECRET_QA=${DEVICES_OAUTH_CLIENT_SECRET_QA}
      - DEVICES_USERNAME_QA=${DEVICES_USERNAME_QA}
      - DEVICES_PASSWORD_QA=${DEVICES_PASSWORD_QA}
for more info regarding required variables for other environmnets please look at the docker-compose.yml file into section karate-tests 

## Acknowledgments

* Thanks to the 

