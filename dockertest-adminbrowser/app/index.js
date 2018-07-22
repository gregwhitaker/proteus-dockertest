import _ from 'lodash';

const {
    Proteus,
        BrokerInfoServiceClient,
} = require('proteus-js-client');

const {
    Empty
} = require('google-protobuf/google/protobuf/empty_pb');

const {
    encodeProteusMetadata
} = require('proteus-js-frames');

const {
    ReactiveSocket,
    Encodable
} = require('rsocket-types');

const {
    Flowable,
    Single
} = require('rsocket-flowable');

function main() {
    const url = __WS_URL__;

    const sessionId = generateName();
    addMessage(sessionId, 'destination');

    // This Proteus object acts as our gateway to both send messages to services and to register services that we support
    const proteus = Proteus.create({
        setup: {
            group: 'proteus-console',
            destination: sessionId,
            accessKey: 3006839580103245170,
            accessToken: 'SkOlZxqQcTboZE3fni4OVXVC0e0=',
        },
        transport: {
            url,
        },
    });

    // This section is how one would query information about available brokers. The BrokerInfoService client is packaged
    // with the proteus client library and has several query functions to find the status of active brokers and services
    const brokerInfoService = new BrokerInfoServiceClient(
        proteus.group('com.netifi.proteus.brokerServices'),
    );

    brokerInfoService.brokers(new Empty(), Buffer.alloc(0)).subscribe({
        onComplete: () => console.log('complete'),
        onError: error => console.error(error),
        onNext: broker => {
            var pretty = JSON.stringify(broker.toObject());
            console.log(pretty);
            addMessage(pretty, 'messages');
        },
        onSubscribe: subscription => {
            subscription.request(100);
        },
    });
}

function component () {
    var element = document.createElement('div');

    /* lodash is used here for bundling demonstration purposes */
    element.innerHTML = _.join(['Build', 'together;', 'not', 'alone'], ' ');

    return element;
}

document.body.appendChild(component());
