echo 'Based on: .\config\_cass_v4_1_local_one.env'
echo 'START write, 4x thread: 1/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_LCS_4.txt"
echo 'START write, 8x thread: 2/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_LCS_8.txt"
echo 'START write, 16x thread: 3/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_LCS_16.txt"
echo 'START write, 32x thread: 4/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_LCS_32.txt"
echo 'START write, 64x thread: 5/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=LeveledCompactionStrategy,sstable_size_in_mb=160,fanout_size=10)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_LCS_64.txt"

echo 'START read, 4x thread: 6/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_LCS_4.txt"
echo 'START read, 8x thread: 7/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_LCS_8.txt"
echo 'START read, 16x thread: 8/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_LCS_16.txt"
echo 'START read, 32x thread: 9/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_LCS_32.txt"
echo 'START read, 64x thread: 10/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_LCS_64.txt"

echo 'START remove: 11/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 5

echo 'START write, 4x thread: 12/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" -rate threads=4 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_STCS_4.txt"
echo 'START write, 8x thread: 13/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" -rate threads=8 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_STCS_8.txt"
echo 'START write, 16x thread: 14/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" -rate threads=16 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_STCS_16.txt"
echo 'START write, 32x thread: 15/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" -rate threads=32 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_STCS_32.txt"
echo 'START write, 64x thread: 16/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress write duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -schema "replication(strategy=NetworkTopologyStrategy,factor=3)" "compaction(strategy=SizeTieredCompactionStrategy,max_threshold=32,min_threshold=6)" -rate threads=64 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_write_LOCAL_ONE_STCS_64.txt"

echo 'START read, 4x thread: 17/1...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=4 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_STCS_4.txt"
echo 'START read, 8x thread: 18/2...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=8 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_STCS_8.txt"
echo 'START read, 16x thread: 19/3...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=16 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_STCS_16.txt"
echo 'START read, 32x thread: 20/4...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=32 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_STCS_32.txt"
echo 'START read, 64x thread: 21/5...'
./apache-cassandra-5.0.2/tools/bin/cassandra-stress read duration=1m cl=LOCAL_ONE no-warmup -node 10.129.52.58,10.129.53.21,10.129.52.57 -mode user=perf password=perf prepared protocolVersion=4 -rate threads=64 -reporting output-frequency=5s > "./stress-output/v4-2024-11-24 13_01_06_read_LOCAL_ONE_STCS_64.txt"

echo 'START remove: 22/1...'
python3.11 stress/stress_mng.py remove -e _cass_v4_1_local_one.env -k keyspace1 -d stress -s 5

