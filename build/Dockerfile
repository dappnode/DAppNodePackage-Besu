ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

USER root
RUN mkdir /var/lib/besu
RUN chown -R besu:besu /var/lib/besu
USER besu

ENTRYPOINT besu --rpc-ws-host='0.0.0.0' --rpc-ws-enabled=true --rpc-http-host='0.0.0.0' --rpc-http-enabled=true --host-allowlist="*" --data-storage-format=$STORAGE_FORMAT --data-path=/var/lib/besu $EXTRA_OPTS
