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
Execute the command
```
make deploy
```
After executing the above command, you can check the operator instance in minikube
```
$ kubectl get pod
NAME                               READY   STATUS    RESTARTS   AGE
mysql-deployment-c67646cd4-qvxc2   1/1     Running   0          7s
```
### Build a custom Init Container image



### Deploy Artemis borker
### Get metrics
