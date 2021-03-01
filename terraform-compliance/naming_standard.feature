Feature: Naming Standard of AWS Resources
  Scenario Outline: Naming Standard on all available resources
    Given I have <resource_name> defined
    When it contains <name_key>
    Then its value must match the "<value>" regex

    Examples:
    | resource_name           | name_key | value        |
    | aws_iam_role            | name     | ^(devops-(prod\|uat\|qa\|dev)-*)$ | 
    | aws_iam_policy          | name     | ^(devops-(prod\|uat\|qa\|dev)-*)$ |
    | aws_lambda_function     | name     | ^((prod\|uat\|qa\|dev)-lambda-fun)$ |
    | aws_sfn_state_machine   | name     | ^((prod\|uat\|qa\|dev)-sfn)$ |
    | aws_s3_bucket           | name     | ^((prod\|uat\|qa\|dev)-bucket)$ | 
    | aws_kms_key             | name     | ^((prod\|uat\|qa\|dev)-kms-key)$ |
    | aws_subnet              | name     | ^((prod\|uat\|qa\|dev)-subnet)$ |
    | aws_cloudwatch_log_group| name     | ^((prod\|uat\|qa\|dev)-log_group)$ |
    | aws_cloudwatch_log_stream| name    | ^((prod\|uat\|qa\|dev)-log_stream)$ |
    
    

