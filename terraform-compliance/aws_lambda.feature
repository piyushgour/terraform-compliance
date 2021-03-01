Feature: Scan Lambda Functions
    
    Scenario Outline: 
      Given I have aws_lambda_function defines
       Then it must have function_name 
       Then its must contains "<runtime>" regex
       Examples:
         | runtime |
         | python2.7 |
         | python3.6 |
         | python3.7 |
         | python3.8 |
         | nodejs10.x |
         | nodejs12.x |
         | java8 |
         | java11 |

       Then its contains handler
       Then its contains role
       Then its contains timeout
       And its value must not be null 


Feature: AWS Lambda Permission Test
  Scenario: AWS Lambda Permission Scan
    Given I have aws_lambda_permission defined
     When it must have function_name
     Then it contains action
     And its value must match the "*InvokeFunction*" regex
     Then it contains principal 




#Path for adding new service name in Compliance
#C:\Users\Username\AppData\Local\Programs\Python\Python38\Lib\site-packages\terraform_compliance\steps\__init__.py
    