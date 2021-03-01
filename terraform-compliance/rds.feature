Feature: AWS DB Subnet Group Test
  Scenario: AWS aws_db_subnet_group Scan
    Given I have aws_db_subnet_group defined
     When it contains name
     Then it contains subnet_ids 


Feature: AWS RDS Cluster Test
  Scenario Outline: AWS aws_rds_cluster only used for Aurora Scan
    Given I have aws_rds_cluster defined
     When it contains database_name
     Then it contains cluster_identifier
     Then it contains <key>
     Then it contains "<value>" regex
      Examples:
       | key | value |
       | engine          | "^(aurora\|aurora-mysql\|aurora-postgresql)$" |
       | engine_version  | "^(*.mysql_aurora.*\|*.postgresql.*)$" |
       | port            | "^(3306\|5432)$" |
       | skip_final_snapshot  | "^(true\|false)$" |

     And it contains master_username
     Then master_password value not null  
