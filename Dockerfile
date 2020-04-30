FROM boykoalex/eduk8s-initializr-test as initializr

FROM quay.io/eduk8s/jdk11-environment:master

RUN cd /opt && \
    mkdir initializr
COPY --from=initializr /opt/initializr/initializr.jar /opt/initializr/initializr.jar

#RUN curl https://raw.githubusercontent.com/theia-ide/theia-apps/master/theia-java-docker/latest.package.json > /opt/theia/package.json
COPY theia/package.json /opt/theia/package.json
RUN HOME=/opt/theia && \
    cd /opt/theia && \
    rm -fr node_modules && \
    yarn --cache-folder ./ycache && rm -rf ./ycache && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build ; \
    yarn theia download:plugins && \
    rm -rf ./ycache

COPY theia/start-theia /opt/eduk8s/sbin/start-theia

RUN cd /opt/eduk8s/etc && \
    mkdir setup.d
COPY initializr/start-initializr.sh /opt/eduk8s/etc/setup.d/start-initializr.sh

ENV THEIA_DEFAULT_PLUGINS=local-dir:/opt/theia/plugins