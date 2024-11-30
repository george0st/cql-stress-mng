#!/bin/sh
# GENERATED: 2024-11-30 15:59:57
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\compareV4V5_separateTHR\_cass_v4_1_local_one.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 1/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 2/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 3/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 4/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 5/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 6/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 7/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 8/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 9/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 10/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 11/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 12/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 13/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 14/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 15/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 16/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 17/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 18/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 19/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 20/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_separateTHR\_cass_v4_2_local_quorum.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 21/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 22/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 23/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 24/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 25/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 26/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 27/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 28/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 29/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 30/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 31/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 32/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 33/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 34/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 35/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 36/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 37/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 38/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 39/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 40/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_separateTHR\_cass_v5_1_local_one.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 41/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 42/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 43/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 44/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 45/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 46/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 47/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 48/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 49/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 50/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 51/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 52/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 53/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 54/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 55/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 56/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 57/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 58/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 59/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 60/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 61/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 62/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 63/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 64/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 65/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 66/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 67/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 68/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 69/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 70/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 71/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_4xTHR.txt"
echo 'START write, 8x thread: 72/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_8xTHR.txt"
echo 'START write, 16x thread: 73/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_16xTHR.txt"
echo 'START write, 32x thread: 74/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_32xTHR.txt"
echo 'START write, 64x thread: 75/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_64xTHR.txt"

echo 'START read, 4x thread: 76/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_4xTHR.txt"
echo 'START read, 8x thread: 77/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_8xTHR.txt"
echo 'START read, 16x thread: 78/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_16xTHR.txt"
echo 'START read, 32x thread: 79/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_32xTHR.txt"
echo 'START read, 64x thread: 80/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 81/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 82/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 83/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 84/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 85/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 86/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 87/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 88/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 89/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 90/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\compareV4V5_separateTHR\_cass_v5_2_local_quorum.env'
echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 91/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 92/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 93/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 94/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 95/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 96/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 97/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 98/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 99/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 100/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 101/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 102/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 103/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 104/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 105/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 106/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 107/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 108/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 109/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 110/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 111/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 112/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 113/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 114/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 115/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 116/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 117/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 118/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 119/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 120/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 121/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_4xTHR.txt"
echo 'START write, 8x thread: 122/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_8xTHR.txt"
echo 'START write, 16x thread: 123/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_16xTHR.txt"
echo 'START write, 32x thread: 124/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_32xTHR.txt"
echo 'START write, 64x thread: 125/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_64xTHR.txt"

echo 'START read, 4x thread: 126/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_4xTHR.txt"
echo 'START read, 8x thread: 127/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_8xTHR.txt"
echo 'START read, 16x thread: 128/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_16xTHR.txt"
echo 'START read, 32x thread: 129/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_32xTHR.txt"
echo 'START read, 64x thread: 130/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 131/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 132/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 133/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 134/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 135/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 136/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=4" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 137/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=8" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 138/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=16" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 139/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=32" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 140/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate "threads=64" -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START remove: ...'
python3.11 stress/stress_mng.py remove -e compareV4V5_separateTHR/_cass_v5_2_local_quorum.env -k keyspace1 -d stress -s 8

