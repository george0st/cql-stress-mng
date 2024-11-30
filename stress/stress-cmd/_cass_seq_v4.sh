#!/bin/sh
# GENERATED: 2024-11-30 15:36:18
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v4_1_local_one.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 128x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_128xTHR.txt"

echo 'START read, 128x thread: 3/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_128xTHR.txt"

echo 'START remove: 4/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 128x thread: 5/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_128xTHR.txt"

echo 'START read, 128x thread: 6/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_128xTHR.txt"

echo 'START remove: 7/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v4_2_local_quorum.env'
echo 'START remove: 8/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 128x thread: 9/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_128xTHR.txt"

echo 'START read, 128x thread: 10/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_128xTHR.txt"

echo 'START remove: 11/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 128x thread: 12/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_128xTHR.txt"

echo 'START read, 128x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=128" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_128xTHR.txt"

echo 'START remove: 14/1...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

