# Important Info

You can limit the resource usage (eg. RAM) in BESU_OPTS in the Advanced Configuration. Just pass it the standard JVM memory arguments. 

Looks like this:
```
-Xms8G -Xmx12G
```

This package by default uses the newer BONSAI storage structure. You can switch it to the older FOREST one in the Settings. Does require a resync and potentially a volume removal. 
# Used Ports

| Port | Used For | Exposed |
| ---- | -------- | ------- |
| 8545 | JSON-RPC | No      |
| 8546 | WebSocket| No      |
| 8551 | Engine API | No      |
| 9545 | Metrics  | No      |
| 30414 | Peer Traffic| Yes  |

# General

This DAppNode package uses the Besu Execution Client. 

# License

This repository is offered under the Apache 2.0 license. See LICENSE for details.
