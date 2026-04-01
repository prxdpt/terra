variable "aws_region" {
  type        = string
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "uat"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create"
}

variable "tags" {
  type        = map(string)
  description = "Tags for EC2 instances"
  default = {
    Name  = "demo1"
    Owned = "Pradipta"
  }
}
