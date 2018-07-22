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

const uuidv1 = require('uuid/v1');

/* App */
function main() {
    const url = __WS_URL__;

    const sessionId = uuidv1();

    // This Proteus object acts as our gateway to both send messages to services and to register services that we support
    const proteus = Proteus.create({
        setup: {
            group: 'proteus-console',
            destination: sessionId,
            accessKey: 9007199254740991,
            accessToken: 'kTBDVtfRBO4tHOnZzSyY5ym2kfY=',
        },
        transport: {
            url,
        },
    });
    
    const brokerInfoService = new BrokerInfoServiceClient(
        proteus.group('com.netifi.proteus.brokerServices'),
    );

    brokerInfoService.brokers(new Empty(), Buffer.alloc(0)).subscribe({
        onComplete: () => console.log('complete'),
        onError: error => console.error(error),
        onNext: broker => {
            var pretty = JSON.stringify(broker.toObject());
            console.log(pretty);
            addBrokerToList(broker);
        },
        onSubscribe: subscription => {
            subscription.request(100);
        },
    });
}

function addBrokerToList(broker) {

}

document.addEventListener('DOMContentLoaded', main);
