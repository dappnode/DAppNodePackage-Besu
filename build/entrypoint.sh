#!/bin/bash

if [[ ! -f "/jwtsecret" ]]; then
    echo "jwtsecret does not exist!"
else
    echo "Using supplied jwtsecret!"
fi

exec besu --rpc-ws-host=0.0.0.0 --rpc-ws-enabled=$WS_ENABLED --rpc-http-host=0.0.0.0 --rpc-http-enabled=$RPC_ENABLED --host-allowlist="*" --rpc-http-cors-origins="*" --engine-rpc-port=8551 --engine-host-allowlist="*" --engine-jwt-secret="/jwtsecret" --engine-rpc-enabled=$ENGINE_API_ENABLED --data-storage-format=$STORAGE_FORMAT --metrics-enabled --metrics-host=0.0.0.0 --data-path="/var/lib/besu" --sync-mode=$SYNC_MODE --rpc-http-max-active-connections=$MAX_HTTP_CONNECTIONS --p2p-port=$P2P_PORT $EXTRA_OPTS