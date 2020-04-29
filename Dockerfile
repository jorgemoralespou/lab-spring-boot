FROM quay.io/eduk8s/jdk11-environment:master

RUN curl https://raw.githubusercontent.com/theia-ide/theia-apps/master/theia-java-docker/latest.package.json > /opt/theia/package.json
RUN HOME=/opt/theia && \
    cd /opt/theia && \
    rm -fr node_modules && \
    yarn --cache-folder ./ycache && rm -rf ./ycache && \
    NODE_OPTIONS="--max_old_space_size=4096" yarn theia build ; \
    yarn theia download:plugins && \
    rm -rf ./ycache

ENV THEIA_DEFAULT_PLUGINS=local-dir:/opt/theia/plugins