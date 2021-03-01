Feature: AWS API Gateway rest api Test
  Scenario: AWS api Scan
    Given I have aws_api_gateway_rest_api defined
     When it contains name
     Then its value must match the "^(prod|uat|dev)$-api-gateway" regex


Feature: AWS API Gateway resource Test
  Scenario: AWS api gateway resource Scan
    Given I have aws_api_gateway_resource defined
     Then its contains rest_api_id
     And its contains parent_id
     And its contains path_part

Feature: AWS API Gateway Method
  Scenario Outline: AWS api gateway method Scan
    Given I have aws_api_gateway_method defined
    When its contains rest_api_id
    And its contains resource_id
    Then its contains <key>
    And its value "<value>" regex
     Examples:
     | key          | value |
     | http_method  | ^(GET\|POST\|PUT\|DELETE\|HEAD\|OPTIONS\|ANY)$ |
     | authorization| ^(NONE\|CUSTOM\|AWS_IAM\|COGNITO_USER_POOLS)$  |


Feature: AWS API Gateway Method Response
  Scenario Outline: AWS api gateway method response Scan
    Given I have aws_api_gateway_method_response defined
     When its contains rest_api_id
     And its contains resource_id
     Then its contains <key>
     And its value "<value>" regex
      Examples:
      | key          | value |
      | http_method  | ^(GET\|POST\|PUT\|DELETE\|HEAD\|OPTIONS\|ANY)$ |
      | status_code  | ^(200\|404\|503)$  |


Feature: AWS API Gateway Integration Test
  Scenario Outline: AWS api gateway integration Scan
    Given I have aws_api_gateway_integration defined
     When its contains rest_api_id
     And its contains resource_id
     Then its contains <key>
     And its value "<value>" regex
      Examples:
      | key         | value |
      | http_method | ^(GET\|POST\|PUT\|DELETE\|HEAD\|OPTIONS\|ANY)$ |
      | type        | ^(HTTP\|HTTP_PROXY\|AWS\|AWS_PROXY\|MOCK)$  |
      | connection_type | ^(INTERNET\|VPC_LINK)$ |


Feature: AWS API Gateway Integration Response
  Scenario Outline: AWS api gateway integration response Scan
    Given I have aws_api_gateway_integration_response defined
     When its contains rest_api_id
     And its contains resource_id
     Then its contains <key>
     And its value "<value>" regex
      Examples:
      | key          | value |
      | http_method  | ^(GET\|POST\|PUT\|DELETE\|HEAD\|OPTIONS\|ANY)$ |
      | status_code  | ^(200\|404\|503)$  |


Feature: AWS API Gateway Authorizer Test
  Scenario: AWS aws_api_gateway_authorizer Scan
    Given I have aws_api_gateway_authorizer defined
     When it contains name
     And it contains rest_api_id
     Then it contains type resource_id
     And its value must match the "(TOKEN|REQUEST|COGNITO_USER_POOLS)" regex
     

Feature: AWS API Gateway Deployment Test
  Scenario: AWS aws_api_gateway_deployment Scan
    Given I have aws_api_gateway_deployment defined
     When it contains rest_api_id
     And it contains stage_name