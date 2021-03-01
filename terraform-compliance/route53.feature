Feature: AWS Routr53 Record Test 
  Scenario Outline: AWS Route53 Record Scan 
    Given I have aws_route53_record define
     When It contains zone_id 
     Then It contains <key>
     Then It contains "<value>" regex
     Examples:
     | key | value |
     | name | "^(Domain_Name)$"|
     | type | "^(A\|AAAA\|CNAME\|MX\|NS\|PTR\|SOA\|SRV\|SPF\|TXT)$" |
     | ttl  | 300 | 