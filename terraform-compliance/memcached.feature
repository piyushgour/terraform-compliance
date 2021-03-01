Feature: AWS Memcached Cluster test
  Scenario Outline: AWS Memcached Scan
    Given I have aws_elasticache_cluster defined 
     When its must have <key> 
     Then its value must match the "<value>" regex
     Examples:
     | key      | value    |
     | cluster_id | ^[a-z-]$|
     | engine     | ^(memcached\|redis)$  |
     | engine_version | ^(1.5.16\|1.1.1)$ |
     | port       |^(11211\|6379)$|
     | num_cache_nodes| 1 |
     
     And it must contains <tags>
     And its value must match the "<value>" regex
     Examples:
     | tags        | value              |
     | Name        | Memcached          |
     | environment | ^(prod\|uat\|dev)$ |


