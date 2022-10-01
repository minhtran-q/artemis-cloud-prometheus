FROM quay.io/artemiscloud/activemq-artemis-broker-init:1.0.1

### ADD DEPENDENCIES & CONFIGURATIONS
COPY config/post-config.sh /amq/scripts/post-config.sh
COPY config/bootstrap.xml /amq/config/bootstrap.xml
COPY dependencies /amq/dependencies

RUN chmod -R 755 /amq/scripts
RUN chmod -R 755 /amq/config
RUN chmod -R 755 /amq/dependencies