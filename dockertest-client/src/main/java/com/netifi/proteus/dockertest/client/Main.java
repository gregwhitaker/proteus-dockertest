/**
 * Copyright 2018 Greg Whitaker
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.netifi.proteus.dockertest.client;

import com.netifi.proteus.dockertest.service.DockerTestRequest;
import com.netifi.proteus.dockertest.service.DockerTestServiceClient;
import com.netifi.proteus.springboot.EnableProteus;
import io.netifi.proteus.annotations.ProteusClient;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
@EnableProteus(group = "dockertest.clients")
public class Main {

    public static void main(String... args) {
        SpringApplication.run(Main.class, args);
    }

    /**
     * Subscribes to the DockerTestService and prints responses.
     */
    @Component
    public class Runner implements CommandLineRunner {

        @ProteusClient(group = "dockertest.services")
        private DockerTestServiceClient client;

        @Override
        public void run(String... args) throws Exception {
            client.runTest(DockerTestRequest.newBuilder().build())
                    .subscribe(response -> System.out.println(response.getNumber()));

            Thread.currentThread().join();
        }
    }
}
