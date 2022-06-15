# Terraform

  ## Terraform Templates

    - vpc.tf
    - ec2.tf
    
  ## VPC
    - I have create VPC, Subnet, Security Group, Internet Gateway, Route Table ect.

  ## EC2
    - For EC2 key_pair I have upload my public key in template. 
    - You can use your key pair or Delete "aws_key_pair" resource and update key_pair name in ec2.tf (line no. 16).

  ## Terraform Command 
    - terraform plan -out=plan.out
    - terraform-compliance -p plan.out -f terraform-compliance
    - terraform apply plan.out
    
    For Clean-up infra.
    - terraform destroy 

  ## How to add AWS resource list if Missing 
    - Linux/unix path -> /usr/local/lib/python<version>/dist-packages/terraform_compliance/steps/__init__.py
    - Windows path -> C:\Users\Username\AppData\Local\Programs\Python\Python38\Lib\site-packages\terraform_compliance\steps\__init__.py
