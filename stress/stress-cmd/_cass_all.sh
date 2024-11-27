#!/bin/sh
# GENERATED: 2024-11-27 17:03:01
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
echo 'START remove: 47/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 48/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 49/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 50/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 51/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 52/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 53/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 54/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 55/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 56/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 57/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: 58/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 59/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 60/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 61/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 62/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 63/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 64/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 65/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 66/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 67/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 68/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: 69/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 70/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 71/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 72/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 73/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 74/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 75/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 76/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 77/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 78/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 79/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START remove: 80/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 81/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 82/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 83/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 84/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 85/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 86/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 87/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 88/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 89/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 90/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START remove: 91/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 92/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 93/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 94/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 95/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 96/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 97/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 98/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 99/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 100/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 101/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START remove: 102/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v5_2_local_quorum.env'
echo 'START remove: 103/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 104/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 105/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 106/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 107/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 108/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 109/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 110/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 111/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 112/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 113/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 114/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 115/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 116/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 117/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 118/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 119/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 120/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 121/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 122/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 123/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 124/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 125/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 126/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 127/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 128/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 129/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 130/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 131/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 132/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 133/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 134/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 135/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START remove: 136/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 137/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 138/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 139/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 140/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 141/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 142/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 143/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 144/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 145/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 146/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START remove: 147/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 148/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 149/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 150/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 151/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 152/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 write_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 153/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 154/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 155/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 156/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 157/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/$curr_date/$curr_date v5 read_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START remove: 158/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

