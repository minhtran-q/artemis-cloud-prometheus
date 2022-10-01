# ArtemisCloud Prometheus

Here's the tutorial example following the [guideline](https://artemiscloud.io/docs/tutorials/initcontainer/) to expose metrics in ArtemisCloud.

## Prerequisites

Before you start, you need to set up a general environment like the ArtemisCloud [tutorial](https://artemiscloud.io/docs/help/building/).

+ Docker
+ Minikube
+ operator-sdk
+ Go v1.17.x

Note: Install Go v1.17.x instead of v1.16, as v1.16 has a reported issue.

## Get started
### Deploy ArtemisCloud Operator
Get code
```
git clone https://github.com/artemiscloud/activemq-artemis-operator
cd activemq-artemis-operator
git checkout main
```
### Build a custom Init Container image
### Deploy Artemis borker
### Get metrics
