# ArtemisCloud Prometheus

Here's the tutorial example following the [guideline](https://artemiscloud.io/docs/tutorials/initcontainer/) to expose metrics in ArtemisCloud.

## Prerequisites

Before you start, you need to set up a general environment like the ArtemisCloud [tutorial](https://artemiscloud.io/docs/help/building/).

+ Docker
+ Minikube
+ operator-sdk
+ Go v1.17.x

_Note:_ Install **Go v1.17.x** instead of **v1.16**, as **v1.16** has a reported issue.

## Get started
### Deploy ArtemisCloud Operator
Get code
```
git clone https://github.com/artemiscloud/activemq-artemis-operator
cd activemq-artemis-operator
git checkout main
```
Execute the command to deploy the Artemis operator
```
make OPERATOR_IMAGE_REPO=quay.io/artemiscloud/activemq-artemis-operator OPERATOR_VERSION=1.0.5 deploy
```
After executing the above command, you can check the operator instance in minikube
```
$ kubectl get pod -n activemq-artemis-operator
NAME                                                   READY   STATUS    RESTARTS   AGE
activemq-artemis-controller-manager-5ff459cd95-kn22k   1/1     Running   0          70m
```
### Build a custom Init Container image

You need to build a new Init Container image with [Dockerfile](Dockerfile)

```
docker build . -t <image-name>:<version>
docker push <image-name>:<version>
```
### Deploy Artemis broker

In broker deployment file you have to add some configurations as follows:
```
apiVersion: broker.amq.io/v1beta1
kind: ActiveMQArtemis
metadata:
  name: ex-aao
spec:
  deploymentPlan:
    size: 1
    image: quay.io/artemiscloud/activemq-artemis-broker-kubernetes:1.0.8
    initImage: minhtrqn/activemq-artemis-broker-init:1.0.8
    enableMetricsPlugin: true
```
_artemis-basic-deployment.yaml_

+ `enableMetricsPlugin`: Whether or not to install the artemis metrics plugin.
+ `initImage`: The custom Init Container image you built on above.

Deploy the broker
```
kubectl apply -f examples/artemis-basic-deployment.yaml -n activemq-artemis-operator
```
and you will get two pods in the cluster.
```
$ kubectl get pod
NAME                                                   READY   STATUS    RESTARTS   AGE
activemq-artemis-controller-manager-5ff459cd95-kn22m   1/1     Running   0          128m
ex-aao-ss-0                                            1/1     Running   0          23m
```
### Get metrics
Create NodePort service to test the metrics API
```
kubectl apply -f testing/artemis-broker-nodeport-service.yaml
```
Create a shortcut for fetching the minikube IP and a service's NodePort
```
$ minikube service artemis-broker-nodeport-service --url --namespace=activemq-artemis-operator
http://127.0.0.1:33685
```
Navigate to http://127.0.0.1:33685/metrics/ to get the metrics.
