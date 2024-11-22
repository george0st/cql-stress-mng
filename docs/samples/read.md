
# 1. Version 5

### 1.1 READ LOCAL_ONE (with SizeTieredCompactionStrategy)
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE 
-node 10.129.53.159,10.129.53.154,10.129.53.153 
-mode user=perf password=perf prepared protocolVersion=4 
-schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" 
-rate "threads>=4" "threads<=200"
-graph "file=v5_read_1_local_one_$(date +%Y%m%d_%H%M%S).html" title=v5_read_1_local_one
-reporting output-frequency=5s > "bbbv5_write_1_local_one_$(date +%Y%m%d_%H%M%S).txt"

### 1.2 READ LOCAL_ONE
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE
-node 10.129.53.159,10.129.53.154,10.129.53.153 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=200"
-graph "file=v5_read_1_local_one_$(date +%Y%m%d_%H%M%S).html" title=v5_read_1_local_one
-reporting output-frequency=5s > "v5_read_1_local_one_$(date +%Y%m%d_%H%M%S).txt"

### 1.3 READ LOCAL_QUORUM
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM 
-node 10.129.53.159,10.129.53.154,10.129.53.153 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=200" 
-reporting output-frequency=5s > "v5_read_2_local_quorum_$(date +%Y%m%d_%H%M%S).txt"

### 1.4 READ EACH_QUORUM
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=EACH_QUORUM 
-node 10.129.53.159,10.129.53.154,10.129.53.153,10.117.19.6,10.117.19.5,10.117.19.4 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=200" 
-reporting output-frequency=5s > "v5_read_3_each_quorum_$(date +%Y%m%d_%H%M%S).txt"

 
# 2. Verze 4

### 2.1 READ LOCAL_ONE
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE 
-node 10.129.52.58,10.129.53.21,10.129.52.57 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=100" 
-reporting output-frequency=5s > "v4_read_1_local_one_$(date +%Y%m%d_%H%M%S).txt"

### 2.2 READ LOCAL_QUORUM
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM 
-node 10.129.52.58,10.129.53.21,10.129.52.57 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=100" 
-reporting output-frequency=5s > "v4_read_2_local_quorum_$(date +%Y%m%d_%H%M%S).txt"

### 2.3 READ EACH_QUORUM
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=ALL 
-node 10.129.52.58,10.129.53.21,10.129.52.57,10.117.19.9,10.117.19.8,10.117.19.11 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=100" 
-reporting output-frequency=5s > "aaav4_read_3_each_quorum_$(date +%Y%m%d_%H%M%S).txt"

