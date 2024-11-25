#!/bin/sh
# GENERATED: 2024-11-25 12:36:45
curr_date=$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ./stress-output/$curr_date/
echo 'Based on: .\config\_cass_v4_1_local_one.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 3/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 4/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 5/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 6/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 7/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 8/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 9/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 10/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 11/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: 12/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 14/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 15/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 16/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 17/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 18/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 19/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 20/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 21/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 22/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: 23/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v4_2_local_quorum.env'
echo 'START remove: 24/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 25/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 26/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 27/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 28/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 29/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 30/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 31/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 32/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 33/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 34/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 35/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 36/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 37/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 38/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 39/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 40/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 41/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 42/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 43/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 44/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 45/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 46/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_2_local_quorum.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v5_1_local_one.env'
echo 'START remove: 70/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 71/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 72/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 73/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 74/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 75/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 76/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 77/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 78/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 79/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 80/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: 81/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 82/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 83/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 84/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 85/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 86/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 87/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 88/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 89/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 90/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 91/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: 92/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 93/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 94/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 95/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 96/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 97/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 98/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 99/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 100/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 101/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 102/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START remove: 103/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 104/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 105/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 106/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 107/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 108/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 109/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 110/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 111/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 112/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 113/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START remove: 114/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 115/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 116/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 117/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 118/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 119/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 120/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 121/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 122/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 123/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 124/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START remove: 125/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v5_2_local_quorum.env'
echo 'START remove: 195/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 196/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 197/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 198/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 199/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 200/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 201/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 202/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 203/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 204/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 205/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 206/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 207/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 208/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 209/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 210/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 211/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 212/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 213/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 214/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 215/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 216/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 217/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 218/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 219/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 220/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 221/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 222/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 223/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 224/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 225/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 226/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 227/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START remove: 228/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 229/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 230/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 231/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 232/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 233/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 234/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 235/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 236/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 237/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 238/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START remove: 239/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 240/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 241/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 242/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 243/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 244/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 write_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 245/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 246/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 247/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 248/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 249/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v4 read_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START remove: 250/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

