# Dockerfile derived from the one geenerated by the product with is_container.sh createDockerfile
ARG __from_img=centos:8

FROM alpine as packer

COPY --chown=1724:1724 ./jvm/jvm/ /tmp/sag-home-temp/jvm/jvm/
COPY --chown=1724:1724 ./install/products/ /tmp/sag-home-temp/install/products/


COPY --chown=1724:1724 ./common/bin/ /tmp/sag-home-temp/common/bin/
COPY --chown=1724:1724 ./common/conf/ /tmp/sag-home-temp/common/conf/
COPY --chown=1724:1724 ./common/db/ /tmp/sag-home-temp/common/db/
COPY --chown=1724:1724 ./common/metering/ /tmp/sag-home-temp/common/metering/
COPY --chown=1724:1724 ./common/lib/ /tmp/sag-home-temp/common/lib/
# excludeComponents input param = [${exclude.components}]
COPY --chown=1724:1724 ./WS-Stack/ /tmp/sag-home-temp/WS-Stack/

COPY --chown=1724:1724 ./IntegrationServer/bin/ /tmp/sag-home-temp/IntegrationServer/bin/
COPY --chown=1724:1724 ./IntegrationServer/lib/ /tmp/sag-home-temp/IntegrationServer/lib/
COPY --chown=1724:1724 ./IntegrationServer/updates/ /tmp/sag-home-temp/IntegrationServer/updates/
COPY --chown=1724:1724 ./IntegrationServer/web/ /tmp/sag-home-temp/IntegrationServer/web/
COPY --chown=1724:1724 ./IntegrationServer/docker/ /tmp/sag-home-temp/IntegrationServer/docker/
COPY --chown=1724:1724 ./IntegrationServer/replicate/ /tmp/sag-home-temp/IntegrationServer/replicate/

COPY --chown=1724:1724 ./IntegrationServer/.tc.custom.log4j2.properties /tmp/sag-home-temp/IntegrationServer/.tc.custom.log4j2.properties

COPY --chown=1724:1724 ./IntegrationServer/db/ /tmp/sag-home-temp/IntegrationServer/db/
COPY --chown=1724:1724 ./IntegrationServer/config/ /tmp/sag-home-temp/IntegrationServer/config/

COPY --chown=1724:1724 ./IntegrationServer/packages/Default/ /tmp/sag-home-temp/IntegrationServer/packages/Default/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmAS400/ /tmp/sag-home-temp/IntegrationServer/packages/WmAS400/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmSAP/ /tmp/sag-home-temp/IntegrationServer/packages/WmSAP/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmCloudStreams/ /tmp/sag-home-temp/IntegrationServer/packages/WmCloudStreams/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmARTExtDC/ /tmp/sag-home-temp/IntegrationServer/packages/WmARTExtDC/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmCloudStreamsAPI/ /tmp/sag-home-temp/IntegrationServer/packages/WmCloudStreamsAPI/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmJDBCAdapter/ /tmp/sag-home-temp/IntegrationServer/packages/WmJDBCAdapter/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmISExtDC/ /tmp/sag-home-temp/IntegrationServer/packages/WmISExtDC/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmConsul/ /tmp/sag-home-temp/IntegrationServer/packages/WmConsul/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmAdmin/ /tmp/sag-home-temp/IntegrationServer/packages/WmAdmin/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmCloudStreamsAnalytics/ /tmp/sag-home-temp/IntegrationServer/packages/WmCloudStreamsAnalytics/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmXSLT/ /tmp/sag-home-temp/IntegrationServer/packages/WmXSLT/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmRoot/ /tmp/sag-home-temp/IntegrationServer/packages/WmRoot/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmPublic/ /tmp/sag-home-temp/IntegrationServer/packages/WmPublic/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmKafkaAdapter/ /tmp/sag-home-temp/IntegrationServer/packages/WmKafkaAdapter/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmFlatFile/ /tmp/sag-home-temp/IntegrationServer/packages/WmFlatFile/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmHBaseAdapter/ /tmp/sag-home-temp/IntegrationServer/packages/WmHBaseAdapter/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmCloud/ /tmp/sag-home-temp/IntegrationServer/packages/WmCloud/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmJSONAPI/ /tmp/sag-home-temp/IntegrationServer/packages/WmJSONAPI/
COPY --chown=1724:1724 ./IntegrationServer/packages/WmART/ /tmp/sag-home-temp/IntegrationServer/packages/WmART/


FROM ${__from_img}
ARG __sag_home=/opt/softwareag
ENV SAG_HOME ${__sag_home}

RUN groupadd -g 1724 sagadmin; useradd -u 1724 -m -g 1724 -d ${SAG_HOME} sagadmin

COPY --from=packer --chown=1724:1724 /tmp/sag-home-temp/ ${SAG_HOME}/

USER 1724

ENV JAVA_HOME ${SAG_HOME}/jvm/jvm/
ENV JRE_HOME ${SAG_HOME}/jvm/jvm/


RUN cd /opt/softwareag/IntegrationServer/docker; ./is_container.sh updateDockerConfigFiles -Ddocker.isHomeDir=${SAG_HOME}/IntegrationServer -Ddocker.rootDir=${SAG_HOME};
EXPOSE 5555
EXPOSE 9999
EXPOSE 5553

ENTRYPOINT ["${SAG_HOME}/IntegrationServer/bin/startContainer.sh"] 