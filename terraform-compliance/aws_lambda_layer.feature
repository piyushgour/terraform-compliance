Feature: AWS Lambda Function Layer test
  Scenario: Scan Lambda Layer
    Given I have aws_lambda_layer_version defined 
     When its must have layer_name 
     Then its contains s3_bucket
     

