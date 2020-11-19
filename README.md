# Karate framework automation tests project 

## Table of Contents
- [Objective](#objective)
- [Tech Stack](#tech-stack)
- [External Dependencies and Versions](#external-dependencies-and-versions)
- [Structure](#structure)
  - [Preconditions](#Preconditions)

## Objective
Objective was defined to provide automated functional Karate tests for [project](https://github.com/) project.

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
      other vars you can supply in docker-compose.yml file

## Acknowledgments

* Thanks to the 

