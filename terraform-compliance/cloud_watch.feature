Feature: AWS Cloud Watch Event_Rule Test 
  Scenario: AWS Cloud Watch Event_Rule Scan 
    Given I have aws_cloudwatch_event_rule define
     When It contains <key>
     Then It contains "<value>" regex
      Examples:
      | key | value |
      | name | ^(dev\|uat\|prod)$-rule |
      | role_arn | ".*role/devops*" |

Feature: AWS Cloud Watch Event Target Test 
  Scenario: AWS Cloud Watch Event Target Scan 
    Given I have aws_cloudwatch_event_target define
     When It contains rule
     And It contains arn
     And It contains target_id
     And It contains run_command_targets


Feature: AWS Cloud Watch Log Group Test 
  Scenario: AWS Cloud Watch Log Group Scan 
    Given I have aws_cloudwatch_log_group define
     When It contains name
     Then It contains retention_in_days
     And its value must not null
     

