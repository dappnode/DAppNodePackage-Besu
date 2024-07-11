# Besu Mainnet Execution Client Important Info

You can limit resource usage (eg. RAM) in BESU_OPTS in the Advanced Configuration. Just pass it standard JVM memory arguments.

Looks like this:

```bash
-Xms8G -Xmx12G
```

This package by default uses the newer BONSAI storage structure. You can switch it to the older FOREST one in the Config, but note very few users will want or need to use FOREST of Tries, the primary usage is for users running archive nodes, but Erigon and Reth are both far better suited to running full archive nodes on any EVM network. This does require a resync and potentially a volume removal.

## Used Ports

| Port | Used For | Exposed |
| ---- | -------- | ------- |
| 8545 | JSON-RPC | No      |
| 8546 | WebSocket| No      |
| 8551 | Engine API | No      |
| 9545 | Metrics  | No      |
| 30414 | Peer Traffic| Yes  |

### License

This repository is offered under the Apache 2.0 license. See [LICENSE](LICENSE) for details.
