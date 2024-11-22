
### 1.1 User profile with Write & Read
./apache-cassandra-5.0.2/tools/bin/cassandra-stress user profile=cqlstress-example.yaml duration=1m "ops(insert=1,simple1=1)" cl=LOCAL_ONE 
-node 10.129.53.159,10.129.53.154,10.129.53.153 
-mode user=perf password=perf prepared protocolVersion=4 
-rate "threads>=4" "threads<=8" 
-graph "file=v5_read_1_local_one_$(date +%Y%m%d_%H%M%S).html" title=v5_read_1_local_one
-reporting output-frequency=5s > "xxxv5_write_1_local_one_$(date +%Y%m%d_%H%M%S).txt"