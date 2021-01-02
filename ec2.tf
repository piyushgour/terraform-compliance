provider "aws" {
    profile = "default"
    region = "us-east-1"
  }

resource "aws_key_pair" "test-key" {
  key_name   = "test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBRuVeqeTVnZekymihXjcVAsbl7dKSRi5z2DdLEXkiEW4muKKp81P3ZL3g2pVn8SuehFZOKCbVaQLFRpsI8TyKXlRC01ewrJTbqK8AUpSxwKiIAG7VYzbX2P7S+SW+idNefCwHMBd6g7YiGl2imAB/mUw99U26br5KZypeGSiCepn9a6GgrvJEARpRVmSMw/00s5LSRteyQ4zWaOtEYgYOK5CAuGXVxYguHfir4xjMmsaraaJTsuqCtpoeAU1tAIMjoWceUX7W0T+3SxXo2pe65I4A2ndkKCnJFou8pjeYRXN9gTkenleoj8sCLiqq447Z4XQbC7cPhzFRit2zFkFU6VIHFJZpH/WhBZv6XpE8qbxZfbxlqOrfLWjU8kKuzm+MmA68+y6O+Jc9mlw3X19RzcfudwFmHyHc7b2KYsFJMyCNChzXx+VQsr8bDf9Jp7ZmbXl5OE0lwv8xWiQafF1Ct4DwBEXptPQaHsKFYikJhFzwsciB9FxHuABcga1vOSs= piyush.gour"
}

locals {
  ami              = "ami-0ff8a91507f77f867"
  name             = "Test-Instance"
  instance_type    = "t2.micro"
  associate_public_ip_address = "true"
  key_name         = "test-key"
  subnet_id        = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  
}

resource "aws_instance" "ec2" {
    ami             = local.ami
    instance_type   = local.instance_type
    key_name        = local.key_name
    vpc_security_group_ids = local.vpc_security_group_ids
    subnet_id       = local.subnet_id
    ebs_optimized          = "false"

    tags = {
      Name = local.name
    }

    // root_block_device = [{
    //   volume_type           = "gp2"
    //    volume_size           = 10
    //    delete_on_termination = "true"
    // }]

}

output "instance_id" {
  value = "${aws_instance.ec2.id}"
}

output "public_ip" {
  value = "${aws_instance.ec2.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.ec2.public_dns}"
}
