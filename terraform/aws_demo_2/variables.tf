variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "project" {
  description = "Project Name"
  type        = string
  default     = "aws_demo_2"
}

variable "main_vpc_cidr" {
  description = "Main VPC CIDR"
  type        = string
  default     = "192.168.0.0/24"
}

variable "main_public_subnet_cidrs" {
  description = "Main VPC public subnet cidrs"
  type        = list
  default     = [
    "192.168.0.0/26",
    "192.168.0.64/26"
  ]
}

variable "main_private_subnet_cidrs" {
  description = "Main VPC private subnet cidrs"
  type        = list
  default     = [
    "192.168.0.128/26",
    "192.168.0.192/26"
  ]
}

variable "main_admin_cidr" {
  description = "Main VPC admin cidr"
  type        = string
  default     = ""
}