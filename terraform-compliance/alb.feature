Feature: AWS LoadBalancer Test
  Scenario Outline: AWS aws_lb Scan
    Given I have aws_lb defined
     When it contains <key>
     And it contains "<value>" regex
     Examples:
        | key          | value |
        | name         | "*devops*" |
        | internal     | ^(false\|true)$ |
        | load_balancer_type | ^(application\|network)$ |
     

Feature: AWS Load Balancer listener Test
  Scenario Outline: AWS aws_lb_listener Scan
    Given I have aws_lb_listener defined
     When it contains load_balancer_arn
     And it contains <key>
     And it contains "<value>" regex
     Examples:
     | key | value |
     | port | ^(80\|443)$ |
     | protocol | ^(HTTP\|HTTPS\|TLS\|TCP\|UDP\|TCP_UDP)$ |
    
     Then it contains default_action 

Feature: AWS Load Balancer Target Group Test
  Scenario Outline: AWS aws_lb_target_group Scan
    Given I have aws_lb_target_group defined
     When it contains name
     And it contains <key>
     And it contains "<value>" regex
     Examples:
     | key      | value |
     | port     | ^(80\|443)$ |
     | protocol | ^(HTTP\|HTTPS\|TLS\|TCP\|UDP\|TCP_UDP)$ |
     | target_type | ^(instance\|ip\|lambda)$ |
 