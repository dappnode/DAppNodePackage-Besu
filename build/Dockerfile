ARG UPSTREAM_VERSION

FROM hyperledger/besu:${UPSTREAM_VERSION}

COPY security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

USER root

# curl install throws error in ARM64 arch. It should not prevent build
RUN apt update && apt install -y curl || true

RUN mkdir /var/lib/besu
RUN chown -R besu:besu /var/lib/besu

USER besu

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]