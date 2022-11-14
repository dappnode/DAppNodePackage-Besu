ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

COPY security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

USER root
RUN apt update && apt install curl -y

RUN mkdir /var/lib/besu
RUN chown -R besu:besu /var/lib/besu

USER besu

ENV BESU_OPTS=$BESU_OPTS

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]