Feature: AWS Tags Check
Scenario Outline: Ensure that specific tags are defined
   Given I have resource that supports tags defined
   When I have <Resource_Name> defined
   Examples:
    | Resource_Name |
    | aws_lambda_function |
    | aws_iam_role |
    | aws_api_gateway_resource |
    | aws_cloudwatch_log_group |
    | aws_lb |
    | aws_rds_cluster |
    | aws_ecs_service |
    | aws_s3_bucket |
    | aws_instance |
    | aws_route53_record |
    | aws_secretsmanager_secret |
    | aws_vpc |

   When it contains tags
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags                        | value              |
      | "Application Name"          | "^(ABC\|XYZ\|PQS)$"   |
      | "Environment"               | "^(Pre-Production\|Devlopement\|Production\|Test)$" |
      | "Line of Business"          | "^(Operation\|Service Delivery)$"    |
      | "Information Classification"| "^(Infernal\|External)$"     |
      | "Support level"             | "^(app-owner\|tech-support\|operation-support)$" |

   When it contains aws_vpc
   Then it must contain name
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags                        | value              |
      | "location"                  | "^(us-east-2)$"    |
      | "type"                      | "^(internal)$" |
     
   When it contains aws_rds_cluster
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags                        | value              |
      | "Business Unit"             | "^(ABC\|XYZ\|PQR)$"           |
      | "Resource Owner"            | "^(SoftwareEngineer\|OperationEngineer\|InfraEngineer)$" |
      | "Application Name"          | "^(ABC\|XYZ\|PQS)$"   |


   When it contains aws_instacne
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags          | value             |
      | "PatchGroup"  | "^(linux\|Windows)$"           |
      | "PatchOrder"  | "^(0)$"           |
      | "Billing*"    | "^(Devlopment\|Foundations)$" |

   When it contains aws_lambda_function
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags                        | value              |
      | "Business Unit"             | "^(ABC\|XYZ\|PQR)$"           |
      | "Resource Owner"            | "^(SoftwareEngineer\|OperationEngineer\|InfraEngineer)$" |
      | "Application Name"          | "^(ABC\|XYZ\|PQS)$"   |
      | "Name"                      | "^(dev\|prod\|stage)-lambda-AppName-*$" |


   When it contains aws_ebs_volume
   Then it must contains <tags>
   And its value must match the "<value>" regex

   Examples:
      | tags              | value              |
      | "Name"            | "^(dev\|prod\|stage)-EBS-AppName-*$" |



Scenario Outline: Naming Standard for all KMS key aliases
    Given I have aws_kms_alias defined
    When it contains name_prefix
    Then its value must match the "alias/^(dev\|prod\|stage)$-*" regex
    Then its pass
    And 
    Examples:
    | resource_name             | name_key    |
    | aws_kms_alias             | name_prefix |
