Feature: AWS ElastiCache Subnet Group Test
  Scenario: AWS ElastiCache Subnet Group Scan
    Given I have aws_elasticache_subnet_group defined
     Then its contains name
     And its contains subnet_ids 
     And its must not contain 0.0.0.0/0 


Feature: AWS  Security Group Test
    Scenario Outline: Well-known insecure protocol exposure on Public Network for ingress traffic
    Given I have aws_security_group defined
  	When it contains ingress
    Then it must not have <proto> protocol and port <portNumber> for 0.0.0.0/0
    Examples:
    | ProtocolName | proto | portNumber |
    | HTTP         | tcp   | 80         |
    | Telnet       | tcp   | 23         |
    | SSH          | tcp   | 22         |
    | MySQL        | tcp   | 3306       |
    | MSSQL        | tcp   | 1443       |
    | NetBIOS      | tcp   | 139        |
    | RDP          | tcp   | 3389       |



Feature: AWS  Security Group Rule Test
    Scenario Outline: AWS Security Rule Scan
    Given I have aws_security_group defined
  	When it contains security_group_id
    Then it contains <key>
    And it contains "<value>" ragex
    Examples:
    | Key       | value |
    | type      | ^(ingress\|egress)$ |
    | from_port | 0-65535 |
    | to_port   | 0-65535 |
    | protocol  | ^(tcp\|udp)$ |