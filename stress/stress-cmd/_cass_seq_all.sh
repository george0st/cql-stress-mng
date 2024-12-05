#!/bin/sh
# GENERATED: 2024-12-05 16:24:10
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v4_1_local_one.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 1/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_100xTHR.txt"

echo 'START read, 100x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 3/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_100xTHR.txt"

echo 'START read, 100x thread: 4/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v4_2_local_quorum.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 5/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_100xTHR.txt"

echo 'START read, 100x thread: 6/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 7/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_100xTHR.txt"

echo 'START read, 100x thread: 8/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v5_1_local_one.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 9/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_100xTHR.txt"

echo 'START read, 100x thread: 10/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 11/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_100xTHR.txt"

echo 'START read, 100x thread: 12/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_100xTHR.txt"

echo 'START read, 100x thread: 14/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 15/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_100xTHR.txt"

echo 'START read, 100x thread: 16/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 17/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_100xTHR.txt"

echo 'START read, 100x thread: 18/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_sequenceTHR\_cass_v5_2_local_quorum.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 19/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_100xTHR.txt"

echo 'START read, 100x thread: 20/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 21/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_100xTHR.txt"

echo 'START read, 100x thread: 22/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 23/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_100xTHR.txt"

echo 'START read, 100x thread: 24/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 25/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_100xTHR.txt"

echo 'START read, 100x thread: 26/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 100x thread: 27/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_100xTHR.txt"

echo 'START read, 100x thread: 28/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads<=100" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_100xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_sequenceTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

