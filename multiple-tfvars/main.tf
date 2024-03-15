# Creating a variable.tf file that will be used besides this main.tf file


provider "aws" {
        region     = "us-east-1"
        access_key = ""
        secret_key = ""

}

 resource "aws_instance" "ec2_example" {

   ami           = "ami-02d7fd1c2af6eead0"
   instance_type =  var.instance_type
	tags = {
		Name= var.environment_name
}

}

