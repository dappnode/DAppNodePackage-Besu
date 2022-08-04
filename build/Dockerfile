ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

COPY jwtsecret.hex /jwtsecret.hex

USER root
RUN mkdir /var/lib/besu
RUN chown -R besu:besu /var/lib/besu
USER besu

ENV BESU_OPTS=$BESU_OPTS

ENTRYPOINT besu --rpc-ws-host='0.0.0.0' --rpc-ws-enabled=$WS_ENABLED --rpc-http-host='0.0.0.0' --rpc-http-enabled=$RPC_ENABLED --host-allowlist=* --rpc-http-cors-origins=* --engine-rpc-port=8551 --engine-host-allowlist=* --engine-jwt-secret='/jwtsecret.hex' --engine-rpc-enabled=$ENGINE_API_ENABLED --data-storage-format=$STORAGE_FORMAT --metrics-enabled --metrics-host='0.0.0.0' --data-path=/var/lib/besu --sync-mode=$SYNC_MODE --rpc-http-max-active-connections=$MAX_HTTP_CONNECTIONS $EXTRA_OPTS
