ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

USER root
RUN mkdir /var/lib/besu

COPY jwtsecret.hex /jwtsecret
COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN chown -R besu:besu /var/lib/besu && chmod 777 /usr/bin/entrypoint.sh && chown -R besu:besu /jwtsecret && chmod 666 /jwtsecret

ENV BESU_OPTS=$BESU_OPTS

USER besu

ENTRYPOINT [ "entrypoint.sh" ]
