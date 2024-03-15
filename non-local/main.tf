# Local variables


provider "aws" {
        region     = "us-east-1"
        access_key = ""
        secret_key = ""

}

resource "aws_vpc" "staging-vpc" {
        cidr_block = "10.5.0.0/16"

        tags = {
                Name = "staging-vpc-tag"
        }
}


resource "aws_subnet" "staging_subnet"{
        vpc_id = aws_vpc.staging-vpc.id
        cidr_block = "10.5.0.0/16"

        tags = {
                Name = "staging_subnet_tag"
        }
}

 resource "aws_instance" "ec2_example" {

   ami           = "ami-02d7fd1c2af6eead0"
   instance_type =  "t2.micro"
	tags = {
                Name = "staging Terraform EC2"
        }

}


