#!/bin/sh
# GENERATED: 2024-11-24 19:27:29
echo 'Based on: .\config\_cass_v5_2_local_quorum.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 3/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 4/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 5/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 6/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 7/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 8/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 9/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 10/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 11/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 12/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 14/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 15/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 16/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 17/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 18/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 19/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 20/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 21/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 22/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 23/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 24/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 25/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 26/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 27/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 28/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 29/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 30/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 31/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 32/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 33/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START remove: 34/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 35/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 36/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 37/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 38/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 39/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 40/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 41/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 42/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 43/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 44/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START remove: 45/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 46/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 47/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 48/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 49/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 50/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_write_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 51/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 52/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 53/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 54/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 55/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_29_read_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START remove: 56/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

