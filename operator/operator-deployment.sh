#!/bin/bash

OPERATOR_VERSION=$1

if [[ ${OPERATOR_VERSION} == "" ]]; then
    echo "Please pass in operator version, e.g. 1.0.5"
    exit -1
fi

${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/crds/broker_activemqartemis_crd.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/crds/broker_activemqartemisaddress_crd.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/crds/broker_activemqartemisscaledown_crd.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/crds/broker_activemqartemissecurity_crd.yaml

${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/service_account.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/role.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/role_binding.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/election_role.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/election_role_binding.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/operator_config.yaml
${KUBE_CLI} create -f https://raw.githubusercontent.com/artemiscloud/activemq-artemis-operator/${OPERATOR_VERSION}/deploy/operator.yaml

echo "Done."
