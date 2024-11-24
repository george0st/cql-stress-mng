#!/bin/sh
# GENERATED: 2024-11-24 19:27:41
echo 'Based on: .\config\_cass_v5_1_local_one.env'
echo 'START remove: 1/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 2/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START write, 8x thread: 3/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START write, 16x thread: 4/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START write, 32x thread: 5/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START write, 64x thread: 6/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START read, 4x thread: 7/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_LCS_4xTHR.txt"
echo 'START read, 8x thread: 8/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_LCS_8xTHR.txt"
echo 'START read, 16x thread: 9/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_LCS_16xTHR.txt"
echo 'START read, 32x thread: 10/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_LCS_32xTHR.txt"
echo 'START read, 64x thread: 11/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_LCS_64xTHR.txt"

echo 'START remove: 12/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 13/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START write, 8x thread: 14/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START write, 16x thread: 15/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START write, 32x thread: 16/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START write, 64x thread: 17/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START read, 4x thread: 18/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_STCS_4xTHR.txt"
echo 'START read, 8x thread: 19/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_STCS_8xTHR.txt"
echo 'START read, 16x thread: 20/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_STCS_16xTHR.txt"
echo 'START read, 32x thread: 21/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_STCS_32xTHR.txt"
echo 'START read, 64x thread: 22/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_STCS_64xTHR.txt"

echo 'START remove: 23/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 24/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 25/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 26/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 27/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 28/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 29/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 30/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 31/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 32/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 33/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS2_64xTHR.txt"

echo 'START remove: 34/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 35/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 36/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 37/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 38/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 39/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 40/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 41/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 42/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 43/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 44/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS4_64xTHR.txt"

echo 'START remove: 45/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 46/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 47/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 48/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 49/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 50/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 51/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 52/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 53/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 54/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 55/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_ONE_UCS10_64xTHR.txt"

echo 'START remove: 56/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_1_local_one.env -k keyspace1 -d stress -s 8

echo 'Based on: .\config\_cass_v5_2_local_quorum.env'
echo 'START remove: 57/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 58/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START write, 8x thread: 59/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START write, 16x thread: 60/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START write, 32x thread: 61/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START write, 64x thread: 62/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START read, 4x thread: 63/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_LCS_4xTHR.txt"
echo 'START read, 8x thread: 64/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_LCS_8xTHR.txt"
echo 'START read, 16x thread: 65/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_LCS_16xTHR.txt"
echo 'START read, 32x thread: 66/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_LCS_32xTHR.txt"
echo 'START read, 64x thread: 67/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_LCS_64xTHR.txt"

echo 'START remove: 68/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 69/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START write, 8x thread: 70/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START write, 16x thread: 71/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START write, 32x thread: 72/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START write, 64x thread: 73/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START read, 4x thread: 74/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_STCS_4xTHR.txt"
echo 'START read, 8x thread: 75/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_STCS_8xTHR.txt"
echo 'START read, 16x thread: 76/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_STCS_16xTHR.txt"
echo 'START read, 32x thread: 77/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_STCS_32xTHR.txt"
echo 'START read, 64x thread: 78/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_STCS_64xTHR.txt"

echo 'START remove: 79/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 80/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START write, 8x thread: 81/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START write, 16x thread: 82/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START write, 32x thread: 83/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START write, 64x thread: 84/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=2)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START read, 4x thread: 85/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS2_4xTHR.txt"
echo 'START read, 8x thread: 86/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS2_8xTHR.txt"
echo 'START read, 16x thread: 87/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS2_16xTHR.txt"
echo 'START read, 32x thread: 88/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS2_32xTHR.txt"
echo 'START read, 64x thread: 89/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS2_64xTHR.txt"

echo 'START remove: 90/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 91/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START write, 8x thread: 92/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START write, 16x thread: 93/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START write, 32x thread: 94/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START write, 64x thread: 95/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=4)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START read, 4x thread: 96/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS4_4xTHR.txt"
echo 'START read, 8x thread: 97/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS4_8xTHR.txt"
echo 'START read, 16x thread: 98/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS4_16xTHR.txt"
echo 'START read, 32x thread: 99/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS4_32xTHR.txt"
echo 'START read, 64x thread: 100/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS4_64xTHR.txt"

echo 'START remove: 101/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

echo 'START write, 4x thread: 102/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START write, 8x thread: 103/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START write, 16x thread: 104/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START write, 32x thread: 105/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START write, 64x thread: 106/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=UnifiedCompactionStrategy,scaling_parameters=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_write_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START read, 4x thread: 107/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS10_4xTHR.txt"
echo 'START read, 8x thread: 108/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS10_8xTHR.txt"
echo 'START read, 16x thread: 109/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS10_16xTHR.txt"
echo 'START read, 32x thread: 110/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS10_32xTHR.txt"
echo 'START read, 64x thread: 111/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_QUORUM no-warmup -node 10.129.53.159,10.129.53.154,10.129.53.153 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v5-2024-11-24 19_27_41_read_LOCAL_QUORUM_UCS10_64xTHR.txt"

echo 'START remove: 112/1...'
python3.11 stress/stress_mng.py remove -e _cass_v5_2_local_one.env -k keyspace1 -d stress -s 8

