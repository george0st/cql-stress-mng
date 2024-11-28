#!/bin/sh
# GENERATED: 2024-11-28 10:51:47
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\_cass_v5_1_local_one.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 3/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 4/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 5/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 6/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_64xTHR.txt"
echo 'START write, 128x thread: 7/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_128xTHR.txt"

echo 'START read, 4x thread: 8/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 9/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 10/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 11/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 12/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_64xTHR.txt"
echo 'START read, 128x thread: 13/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_128xTHR.txt"

echo 'START remove: 14/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 15/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 16/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 17/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 18/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 19/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_64xTHR.txt"
echo 'START write, 128x thread: 20/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_128xTHR.txt"

echo 'START read, 4x thread: 21/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 22/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 23/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 24/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 25/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_64xTHR.txt"
echo 'START read, 128x thread: 26/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_128xTHR.txt"

echo 'START remove: 27/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 28/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 29/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 30/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 31/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 32/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_64xTHR.txt"
echo 'START write, 128x thread: 33/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_128xTHR.txt"

echo 'START read, 4x thread: 34/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 35/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 36/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 37/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 38/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_64xTHR.txt"
echo 'START read, 128x thread: 39/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_128xTHR.txt"

echo 'START remove: 40/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 41/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_4xTHR.txt"
echo 'START write, 8x thread: 42/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_8xTHR.txt"
echo 'START write, 16x thread: 43/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_16xTHR.txt"
echo 'START write, 32x thread: 44/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_32xTHR.txt"
echo 'START write, 64x thread: 45/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_64xTHR.txt"
echo 'START write, 128x thread: 46/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS8_128xTHR.txt"

echo 'START read, 4x thread: 47/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_4xTHR.txt"
echo 'START read, 8x thread: 48/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_8xTHR.txt"
echo 'START read, 16x thread: 49/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_16xTHR.txt"
echo 'START read, 32x thread: 50/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_32xTHR.txt"
echo 'START read, 64x thread: 51/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_64xTHR.txt"
echo 'START read, 128x thread: 52/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS8_128xTHR.txt"

echo 'START remove: 53/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 54/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 55/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 56/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 57/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 58/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_64xTHR.txt"
echo 'START write, 128x thread: 59/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_128xTHR.txt"

echo 'START read, 4x thread: 60/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 61/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 62/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 63/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 64/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_64xTHR.txt"
echo 'START read, 128x thread: 65/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_128xTHR.txt"

echo 'START remove: 66/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v5_2_local_quorum.env'
echo 'START remove: 67/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 68/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 69/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 70/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 71/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 72/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_64xTHR.txt"
echo 'START write, 128x thread: 73/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_128xTHR.txt"

echo 'START read, 4x thread: 74/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 75/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 76/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 77/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 78/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_64xTHR.txt"
echo 'START read, 128x thread: 79/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_128xTHR.txt"

echo 'START remove: 80/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 81/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 82/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 83/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 84/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 85/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_64xTHR.txt"
echo 'START write, 128x thread: 86/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_128xTHR.txt"

echo 'START read, 4x thread: 87/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 88/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 89/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 90/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 91/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_64xTHR.txt"
echo 'START read, 128x thread: 92/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_128xTHR.txt"

echo 'START remove: 93/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 94/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 95/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 96/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 97/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 98/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_64xTHR.txt"
echo 'START write, 128x thread: 99/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_128xTHR.txt"

echo 'START read, 4x thread: 100/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 101/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 102/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 103/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 104/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_64xTHR.txt"
echo 'START read, 128x thread: 105/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_128xTHR.txt"

echo 'START remove: 106/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 107/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_4xTHR.txt"
echo 'START write, 8x thread: 108/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_8xTHR.txt"
echo 'START write, 16x thread: 109/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_16xTHR.txt"
echo 'START write, 32x thread: 110/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_32xTHR.txt"
echo 'START write, 64x thread: 111/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_64xTHR.txt"
echo 'START write, 128x thread: 112/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=8)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS8_128xTHR.txt"

echo 'START read, 4x thread: 113/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_4xTHR.txt"
echo 'START read, 8x thread: 114/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_8xTHR.txt"
echo 'START read, 16x thread: 115/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_16xTHR.txt"
echo 'START read, 32x thread: 116/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_32xTHR.txt"
echo 'START read, 64x thread: 117/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_64xTHR.txt"
echo 'START read, 128x thread: 118/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS8_128xTHR.txt"

echo 'START remove: 119/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 120/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 121/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 122/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 123/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 124/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_64xTHR.txt"
echo 'START write, 128x thread: 125/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_128xTHR.txt"

echo 'START read, 4x thread: 126/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 127/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 128/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 129/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 130/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_64xTHR.txt"
echo 'START read, 128x thread: 131/6...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 connectionsPerHost=24 maxPending=512 -rate threads=128 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_128xTHR.txt"

echo 'START remove: 132/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

