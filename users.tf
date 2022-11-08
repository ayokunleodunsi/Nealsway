

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

resource "aws_iam_user" "typemanusers" {
  count = length(var.user_name)
  name  = var.user_name[count.index]
  
  tags = {
    name  = "tag-value"
  }
}

variable "user_name" {
  description = "IAM USERNAME"
  type        = list(string)
  default     = ["koyokoyo", "mralex", "bambam"]
}

