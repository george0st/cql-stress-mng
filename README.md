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

#### Generate scripts for cassandra-stress
```python

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
