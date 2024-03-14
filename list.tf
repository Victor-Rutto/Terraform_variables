#This file creates a number of IAM users in AWS
#It uses variable-list
provider "aws" {
        region     = "us-east-1"
        access_key = ""
        secret_key = ""
 
}
resource "aws_instance" "ec2_example" {

   ami           = "ami-02d7fd1c2af6eead0"
   instance_type =  "t2.micro"
   count = 1

   tags = {
           Name = "Terraform EC2"
   }

}

resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

#Enaling console access for user1
resource "aws_iam_user_policy" "console_access_policy" {
  count  = length(var.user_names)
  name   = "ConsoleAccessPolicy-${var.user_names[count.index]}"
  user   = aws_iam_user.example[count.index].name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "iam:*"
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "ec2:*"
        Resource = "*"
      },
      # Add more permissions as needed for console access
    ]
  })
}

# Variable to create users

variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3s"]
}
