# Used to define key-value pair
# Useful when defining project environment


provider "aws" {
        region     = "us-east-1"
        access_key = ""
        secret_key = ""

}

 resource "aws_instance" "ec2_example" {

   ami           = "ami-02d7fd1c2af6eead0"
   instance_type =  "t2.micro"

   tags = var.project_environment

}


variable "project_environment" {
  description = "project name and environment"
  type        = map(string)
  default     = {
    project     = "map_variable_type",
    environment = "dev"
  }
}
