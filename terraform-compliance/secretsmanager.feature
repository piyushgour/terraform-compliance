Feature: AWS Secrets Manager Service Test
  Scenario: AWS secretsmanager Scan
    Given I have aws_secretsmanager_secret defined
     When it contains name
     Then its value must match the "(prod|uat|dev)-abc-kms-key" regex


Feature:  AWS Secrets Manager Secret Version Test
  Scenario: AWS aws_secretsmanager_secret_version Scan 
    Given I have aws_secretsmanager_secret_version defined
     When its must contains secret_id



