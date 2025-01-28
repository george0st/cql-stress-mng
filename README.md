# cql-stress-mng
An easy management of CQL stress tests with the official 'cassandra-stress' tool. You can use
the solution for tests not only cassandra, but also other solutions with support CQL such as
Scylla, AstraDB, etc.

Key benefits:
 - **generate** scripts for performance tests (with 'cassandra-stress') based on templates
 - **extract** test summaries (from 'cassandra-stress' results)
 - **compare** test results (as text tables and/or graphs)
 - test cleaning/maintenance (ability to remove keyspace/table via CQL)

Pre-requisites:
 - installed Python >= 3.11
 - installed Java (java version based on cassandra-stress specification)
 - installed 'cassandra-stress' tool (part of Apache Cassandra distribution)
 - access to CQL solution (e.g. Cassandra, Scylla, Astra, etc.)
   - open port 9042
   - IP addresses for connection
   - login information e.g. username/password

Motivation for this tool/repo:
 - use the standard and verified official tool for testing CQL solutions
 - focus on your own tests (not on creating a tool for performance tests)
 - don't reinvent the wheel (unless necessary, the time is money)

## 1. Command line usage

You can see standard description: 

```sh
python3.11 stress/stress_mng.py --help
```
```txt
Usage: stress_mng.py [OPTIONS] COMMAND [ARGS]...

Options:
  --help  Show this message and exit.

Commands:
  compare   Compare data from TXT(JSON) to the sub-dir 'graph'
  extract   Extract data from 'cassandra-stress' output to the sub-dir...
  generate  Generate performance tests as *.sh for 'cassandra-stress'
  graph     Create graphs from TXT(JSON) to the sub-dir 'graph'
  remove    Remove keyspace or table from CQL solution
  version   Print current version of key components
```

### 1.1 Generate

You can generate shell scripts for 'cassandra-stress', see:

#### 1.1.1 Generate shell script based on 'compareV4V5_separateTHR\_cass_*.env'

```sh
python3.11 stress/stress_mng.py generate -e compareV4V5_separateTHR\_cass_*.env -l stress-cmd/_cass_all.sh
```
The output ~140 calls with READ/WRITE tests and exact
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
# ...
```
#### 1.1.2 Generate shell scripts based on 'compareV4V5_sequenceTHR\_cass_*.env'

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
# ...
```
### 1.2 Extract

The 'Extract' data from 'cassandra-stress' output in format CSV and TXT(JSON).

```sh
python3.11 stress/stress_mng.py extract -d "C:/Python/.NEW Compare V4 vs V5/FULLFinal/"
```

### 1.3 Compare

The 'Compare' data based on TXT(JSON) files to text (in console) or graphs (as PNG files)

```sh
python3.11 stress/stress_mng.py compare -d "C:/Python/.NEW Compare V4 vs V5/FULLFinal/"
```

### 1.4 Graph

The 'Create' graphs from TXT(JSON) to the sub-dir 'graph'. 

```sh
python3.11 stress/stress_mng.py graph -d "C:/Python/.4NEW Compare V5 NONPROD/"
```

or graphs plus graph summaries

```sh
python3.11 stress/stress_mng.py graph -d "C:/Python/.4NEW Compare V5 NONPROD/" -g aa
```

## 2. Sample of outputs
#### 2.1 Compare as graph

It is useful for visual check, the inputs are TXT(JSON) files from extract command.

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/PRF-v4_vs_v5_read_LOCAL_ONE_LCS-2024-12-01_12-18-17-bulk-1x1.png?raw=true)

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/PRF-v4_vs_v5_write_LOCAL_ONE_STCS-UCS8-2024-12-01_12-18-17-bulk-1x1.png?raw=true)

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/PRF-v4_vs_v5_write_LOCAL_QUORUM_STCS-UCS8-2024-12-01_12-18-17-bulk-1x1.png?raw=true)

#### 2.2 Compare as text

It is useful for table/excel compare (TAB as separator), the inputs are CSV files from extract command.

```txt
==== LOCAL_ONE===
Test case	4	8	16	24	36	54	81	4	8	16	24	36	54	81
v5 write_LOCAL_ONE_STCS	5938	11451	21774	29310	35638	39116	42557	0,7	0,7	0,7	0,8	1,0	1,4	1,9
v4 write_LOCAL_ONE_STCS	5874	11053	19690	26178	30213	28000	23091	0,7	0,7	0,8	0,9	1,2	1,9	3,4
...
==== LOCAL_QUORUM===
Test case	4	8	16	24	36	54	81	4	8	16	24	36	54	81
v5 write_LOCAL_QUORUM_STCS	3907	7058	12638	18065	23462	29958	32159	1,0	1,1	1,2	1,3	1,5	1,8	2,5
v4 write_LOCAL_QUORUM_STCS	3525	6394	10804	14313	18465	22709	25715	1,1	1,2	1,5	1,7	1,9	2,4	3,1
...
```

The usage in the excel see a few final outputs:

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/r2-local_quorum.png?raw=true)

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/r3-local_quorum.png?raw=true)

![graph](https://github.com/george0st/cql-stress-mng/blob/main/docs/assets/final-local_quorum.png?raw=true)
