# Local variables


provider "aws" {
        region     = "us-east-1"
        access_key = ""
        secret_key = ""

}

# DEFINING A LOCAL variables
# Reference the local variable this way: ${local.staging_env}

locals {
        staging_env = "staging"
}


resource "aws_vpc" "staging-vpc" {
        cidr_block = "10.5.0.0/16"

        tags = {
                Name = "${local.staging_env}-vpc-tag"
        }
}


resource "aws_subnet" "staging_subnet"{
        vpc_id = aws_vpc.staging-vpc.id
        cidr_block = "10.5.0.0/16"

        tags = {
                Name = "${local.staging_env}_subnet_tag"
        }
}

 resource "aws_instance" "ec2_example" {

   ami           = "ami-02d7fd1c2af6eead0"
   instance_type =  "t2.micro"
	tags = {
                Name = "${local.staging_env}Terraform EC2"
        }

}


