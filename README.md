# proteus-dockertest
[![Build Status](https://travis-ci.org/gregwhitaker/proteus-dockertest.svg?branch=master)](https://travis-ci.org/gregwhitaker/proteus-dockertest)

A set of services, clients, and Docker Compose files that can be used for setting up arbitrary [Netifi Proteus](https://www.netifi.com) 
environments for the purposes of testing the Proteus Broker and other Proteus components.

## Prerequisites
This project requires that you have [Docker Compose](https://docs.docker.com/compose/) installed.

## Running the Test Environments
### Single Broker
Running the following command will start a single broker with a client and service attached:

    $ docker-compose pull && docker-compose up

### Broker Cluster
Running the following command will start a cluster of three brokers with a client and service attached:

    $ docker-compose pull && docker-compose -f docker-compose-cluster.yml up

## Development
### Publishing Containers to Docker Hub
Follow the steps below to publish new dockertest containers to Docker Hub:

1. Add a `gradle-local.properties` file to the root project.

    The gradle-local.properties file is a user-specific Gradle configuration file
    that will contain your DockerHub credentials.
    
2. Add your Docker Hub credentials to the `gradle-local.properties` file as follows:

        dockerUsername={username}
        dockerPassword={password}
        
3. Run the following Gradle command:

        $ ./gradlew clean build pushImage

## Bugs and Feedback
For bugs, questions, and discussions please use the [Github Issues](https://github.com/gregwhitaker/proteus-dockertest/issues).

## License
Copyright 2018 Greg Whitaker

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.