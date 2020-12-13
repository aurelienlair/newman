ARG NODE_VERSION=12-alpine

FROM node:${NODE_VERSION}

USER root

ARG NEWMAN_VERSION="5.0.1"

RUN mkdir /opt/newman
COPY . /opt/newman
RUN chown -R node:node /opt/newman

RUN apk update \
    ; apk add --no-cache ca-certificates \
              curl \
              jq \
              make \
              wget \
    ; cd /opt \
    ; wget https://yarnpkg.com/latest.tar.gz \
    ; tar zvxf latest.tar.gz \
    ; rm -rf latest.tar.gz \
    ; mkdir -p /usr/local/share/npm-global \
    ; chown node:node /usr/local/share/npm-global \
    ; npm config -g set prefix /usr/local/share/npm-global \
    ; npm install -g newman@${NEWMAN_VERSION}

USER node

WORKDIR /opt/newman

RUN chmod a+x *.sh
ENTRYPOINT [ "./entrypoint.sh" ]