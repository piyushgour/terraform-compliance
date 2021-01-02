

#VPC Creation
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default" 
  enable_dns_support   = "true" 
  enable_dns_hostnames = "true"
    tags = {
        Name = "Test_VPC"
    }
} 

#Subnet Creation
resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" 
  availability_zone       = "us-east-1a"
    tags = {
        Name = "Test VPC Subnet"
    }
}

#Internet-gateway creation 
resource "aws_internet_gateway" "gateway" {
 vpc_id = aws_vpc.my_vpc.id
 tags = {
        Name = "VPC Internet Gateway"
    }
}

# Create the Route Table
resource "aws_route_table" "route_table" {
 vpc_id = aws_vpc.my_vpc.id
 tags = {
        Name = "Route Table"
    }
}

# Create the Internet Access
resource "aws_route" "My_VPC_internet_access" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gateway.id
} 


# Associate the Route Table with the Subnet
resource "aws_route_table_association" "My_VPC_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}


# Create the Security Group
resource "aws_security_group" "security_group" {
  vpc_id       = aws_vpc.my_vpc.id
  name         = "Allow_SSH_Only"
  description  = "My Security Group"
  
  # allow ingress of port 22
  ingress {
    cidr_blocks = ["0.0.0.0/0"] 
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  } 
  
  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
        Name = "Allow_SSH_Only"
        Description = "Security Group"
    }
}
