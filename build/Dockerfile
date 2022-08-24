ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

USER root
RUN mkdir /var/lib/besu

COPY jwtsecret.hex /jwtsecret
COPY entrypoint.sh /var/lib/besu/entrypoint.sh

RUN chown -R root:root /var/lib/besu && chmod 777 /var/lib/besu/entrypoint.sh && chown -R root:root /jwtsecret && chmod 666 /jwtsecret

ENV BESU_OPTS=$BESU_OPTS

ENTRYPOINT [ "/var/lib/besu/entrypoint.sh" ]
