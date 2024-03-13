#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_MAINNET" in
"prysm.dnp.dappnode.eth")
  echo "Using prysm.dnp.dappnode.eth"
  JWT_PATH="/security/prysm/jwtsecret.hex"
  ;;
"lighthouse.dnp.dappnode.eth")
  echo "Using lighthouse.dnp.dappnode.eth"
  JWT_PATH="/security/lighthouse/jwtsecret.hex"
  ;;
"lodestar.dnp.dappnode.eth")
  echo "Using lodestar.dnp.dappnode.eth"
  JWT_PATH="/security/lodestar/jwtsecret.hex"
  ;;
"teku.dnp.dappnode.eth")
  echo "Using teku.dnp.dappnode.eth"
  JWT_PATH="/security/teku/jwtsecret.hex"
  ;;
"nimbus.dnp.dappnode.eth")
  echo "Using nimbus.dnp.dappnode.eth"
  JWT_PATH="/security/nimbus/jwtsecret.hex"
  ;;
*)
  echo "Using default"
  JWT_PATH="/security/default/jwtsecret.hex"
  ;;
esac

# Check if curl is installed (not installed in ARM64 arch)
if command -v curl >/dev/null 2>&1; then
    # Print the jwt to the dappmanager
    JWT=$(cat $JWT_PATH)
    curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"
else
    echo "curl is not installed in ARM64 arch. Skipping the JWT post to package info."
fi

exec besu --rpc-ws-host='0.0.0.0' \
  --rpc-ws-enabled=true \
  --rpc-http-host='0.0.0.0' \
  --rpc-http-enabled=true \
  --host-allowlist=* \
  --rpc-http-cors-origins=* \
  --engine-rpc-port=8551 \
  --engine-host-allowlist=* \
  --engine-jwt-secret=$JWT_PATH \
  --engine-rpc-enabled=true \
  --data-storage-format=$STORAGE_FORMAT \
  --metrics-enabled \
  --metrics-host='0.0.0.0' \
  --data-path=/var/lib/besu \
  --sync-mode=$SYNC_MODE \
  --rpc-http-max-active-connections=$MAX_HTTP_CONNECTIONS \
  --p2p-port=$P2P_PORT \
  $EXTRA_OPTS
