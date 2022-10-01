#!/bin/bash

ls ${CONFIG_INSTANCE_DIR}

cp /amq/config/bootstrap.xml ${CONFIG_INSTANCE_DIR}/etc/bootstrap.xml
#cp /amq/config/bootstrap.xml /amq/init/config/amq-broker/etc/bootstrap.xml
cp /amq/dependencies/artemis-prometheus-metrics-plugin-1.1.0.jar ${CONFIG_INSTANCE_DIR}/lib/artemis-prometheus-metrics-plugin-1.1.0.jar

#Using custom configuration. Copy from /amq/init/config to /home/jboss/amq-broker
mkdir /amq/init/config/amq-broker/web
cp /amq/dependencies/metrics.war /amq/init/config/amq-broker/web/metrics.war