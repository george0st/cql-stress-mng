# cql-stress-mng
An easy management of CQL stress tests with the official 'cassandra-stress' tool. You can use
the solution for tests not only cassandra, but also Scylla and AstraDB.

Key benefits:
 - generation bundle of tests for 'cassandra-stress'
 - support keyspace/table remove
 - generate test summaries
 - compare results 
 - generate graphs

Pre-requisities:
 - python >= 3.11
 - install 'cassandra-stress' tool
 - access to cassandra cluster (list of IP addresses and username/password)
