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
package com.netifi.proteus.dockertest.service;

import io.netty.buffer.ByteBuf;
import org.springframework.stereotype.Component;
import reactor.core.publisher.Flux;

import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

@Component
public class DefaultDockerTestService implements DockerTestService {
    private static final Random RANDOM = ThreadLocalRandom.current();

    @Override
    public Flux<DockerTestResponse> runTest(DockerTestRequest message, ByteBuf metadata) {
        return Flux.range(0, Integer.MAX_VALUE)
                .map(i -> {
                   return DockerTestResponse.newBuilder()
                           .setNumber(RANDOM.nextInt())
                           .build();
                });
    }
}
