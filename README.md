# cql-stress-mng
An easy management of CQL stress tests with the official 'cassandra-stress' tool. You can use
the solution for tests not only cassandra, but also Scylla and AstraDB.

Key benefits:
 - generation scripts for 'cassandra-stress'
 - remove keyspace/table remove from CQL
 - generate test summaries
 - compare test results
 - generate graphs

Pre-requisites:
 - python >= 3.11
 - installed 'cassandra-stress' tool (part of cassandra distribution)
 - access to cassandra cluster (open port 9042, list of IP addresses 
   for connection, login information e.g. username/password)

## Usage

You can see description, see standard commandline: 
```sh
python3.11 stress/stress_mng.py --help

Usage: stress_mng.py [OPTIONS] COMMAND [ARGS]...

Options:
  --help  Show this message and exit.

Commands:
  compare   Compare data from TXT(JSON) to the sub-dir 'extract'
  extract   Extract data from 'cassandra-stress' output to the sub-dir...
  generate  Generate performance tests as *.sh for 'cassandra-stress'
  remove    Remove keyspace or table from CQL solution
  version   Print current version of key components
```

### 1. Generate

The generation of shell scripts.

#### 1.1 Generate shell script based on 'compareV4V5_separateTHR\_cass_*.env'

```sh
python3.11 stress/stress_mng.py generate -e compareV4V5_separateTHR\_cass_*.env -l stress-cmd/_cass_all.sh
```
The output ~140 calls with READ/WRITE tests with exact
logic for thread growing (4, 8, 6, 32, ...)

```sh
#!/bin/sh
# GENERATED: 2024-12-05 16:23:20
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

```
#### 1.2 Generate shell scripts based on 'compareV4V5_sequenceTHR\_cass_*.env'

```sh
python3.11 stress/stress_mng.py generate -e compareV4V5_sequenceTHR\_cass_*.env -l stress-cmd/_cass_seq_all.sh
```
The output ~28 calls with READ/WRITE tests with gradual 
thread growing (till <=100 thread) based on default 
'cassandra-stress' logic

```sh
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
```
### 2. Extract

The extract data from cassandra-stress output in format CSV and TXT(JSON).

#### 2.1 Extract from 'cassandra-stress' output

```sh
extract -d "C:/Python/.NEW Compare V4 vs V5/FULLFinal/"
```

### 3. Compare

The Compare data from TXT(JSON) to the console and as graphs to the sub-dir 'graph'

#### 3.1 Compare

```sh
compare -d "C:/Python/.NEW Compare V4 vs V5/FULLFinal/"
```



## Sample of outputs
#### Performance/Throughput & Response time
![graph](https://github.com/george0st/qgate-graph/blob/main/assets/PRF-Calc-2023-05-06_18-22-19-bulk-1x10.png?raw=true)
![graph](https://github.com/george0st/qgate-graph/blob/main/assets/PRF-NoSQL_igz_nonprod-2023-04-23_14-41-18-bulk-100x50.png?raw=true)

#### Executors in time
![graph](https://github.com/george0st/qgate-graph/blob/main/assets/EXE-Calc-2023-05-06_18-22-19-bulk-1x10-plan-128x4.png?raw=true)
![graph](https://github.com/george0st/qgate-graph/blob/main/assets/EXE-NoSQL-2023-05-04_19-33-30-bulk-1x50-plan-8x2.png?raw=true)

#### Performance/Throughput & Response time in [TXT form](https://github.com/george0st/qgate-graph/blob/main/assets/TXT-cassandra-163551-W1-low-RAW-2024-10-11_14-36-07-bulk-200x10.txt?raw=true)
![Performance in TXT](https://github.com/george0st/qgate-graph/blob/main/assets/TXT-cassandra-163551-W1-low-RAW-2024-10-11_14-36-07-bulk-200x10.png?raw=true)

#### Performance/Throughput & Response time in [CSV form](https://github.com/george0st/qgate-graph/blob/main/assets/CSV-cassandra-235115-W2-med-RAW-2024-10-11_22-14-47-bulk-200x20.csv?raw=true)
![Performance in CSV](https://github.com/george0st/qgate-graph/blob/main/assets/CSV-cassandra-235115-W2-med-RAW-2024-10-11_22-14-47-bulk-200x20.png?raw=true)
