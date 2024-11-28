#!/bin/sh
# GENERATED: 2024-11-28 15:25:40
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\_cass_v4_1_local_one.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 3/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 4/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 5/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 6/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 7/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 8/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 9/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 10/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 11/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: 12/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 14/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 15/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 16/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 17/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 18/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 19/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 20/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 21/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 22/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: 23/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v4_2_local_quorum.env'
echo 'START remove: 24/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 25/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 26/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 27/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 28/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 29/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 30/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 31/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 32/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 33/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 34/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 35/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 36/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 37/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 38/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 39/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 40/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 41/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 42/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 43/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 44/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 45/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=384 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 46/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

