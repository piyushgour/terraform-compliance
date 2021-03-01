Feature: AWS ECR Repository Test
  Scenario: AWS aws_ecr_repository Scan
    Given I have aws_ecr_repository defined
     When it contains name
     And it image_tag_mutability="(MUTABLE|IMMUTABLE)" regex
     Then it contains image_scanning_configuration
     And it scan_on_push="(true|false)" regex

Feature: AWS ECS Cluster Test
  Scenario: AWS aws_ecs_cluster Scan
    Given I have aws_ecs_cluster defined
     When it contains name
     And it contains capacity_providers

Feature: AWS ECS Task Defination Test
  Scenario Outline: AWS aws_ecs_task_definition Scan
    Given I have aws_ecs_task_definition defined
     When it contains family
     And it contains container_definitions
     Then it contains volume
     Then it contains <key>
     And it contains "<value>" regex
     Examples:
     | key | value |
     | name | ^(*storage*)$ |
     | host_path | ^(*/ecs/*)$ |

Feature: AWS ECS Service Test
  Scenario Outline: AWS aws_ecs_service Scan
    Given I have aws_ecs_service defined
     When it contains name
     And it contains cluster
     Then it contains deployment_controller
     And its value must be "^(CODE_DEPLOY\|ECS\|EXTERNAL)$" 
