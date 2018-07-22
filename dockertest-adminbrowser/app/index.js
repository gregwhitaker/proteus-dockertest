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

    // Get Stream of All Brokers
    brokerInfoService.brokers(new Empty(), Buffer.alloc(0)).subscribe({
        onComplete: () => console.log('complete'),
        onError: error => console.error(error),
        onNext: broker => {
            var pretty = JSON.stringify(broker.toObject());
            console.log(pretty);
            addBrokerToList(broker);

            // Get Stream of All Destinations on Broker
            brokerInfoService.destinations(broker, Buffer.alloc(0)).subscribe({
                onComplete: () => console.log('complete'),
                onError: error => console.error(error),
                onNext: destination => {
                    var pretty = JSON.stringify(destination.toObject());
                    console.log(pretty);
                    addDestinationToList(broker, destination);
                },
                onSubscribe: subscription => {
                    subscription.request(100);
                },
            });
        },
        onSubscribe: subscription => {
            subscription.request(100);
        },
    });
}

function addBrokerToList(broker) {
    var t = document.getElementById("brokerList");
    var row = t.insertRow();

    var idCell = row.insertCell();
    idCell.innerText = broker.getBrokerid();

    var ipAddressCell = row.insertCell();
    ipAddressCell.innerText = broker.getIpaddress();

    var portCell = row.insertCell();
    portCell.innerText = broker.getPort();

    var clusterPortCell = row.insertCell();
    clusterPortCell.innerText = broker.getClusterport();

    var adminPortCell = row.insertCell();
    adminPortCell.innerText = broker.getAdminport();
}

function addDestinationToList(broker, destination) {
    var t = document.getElementById("destinationList");
    var row = t.insertRow();

    var idCell = row.insertCell();
    idCell.innerText = broker.getBrokerid();

    var groupCell = row.insertCell();
    groupCell.innerText = destination.getGroup();

    var destinationCell = row.insertCell();
    destinationCell.innerText = destination.getDestination();
}

document.addEventListener('DOMContentLoaded', main);
