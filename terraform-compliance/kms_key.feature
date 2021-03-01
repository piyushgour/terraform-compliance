Feature: AWS KMS key test
  Scenario: AWS KMS key Scan
   Given I have aws_kms_key
   When its must have key_usage

Feature: AWS KMS Key alias
  Scenario: AWS KMS Key alias Scan
    Given I have aws_kms_alias
     Then its must have target_key_id