variable "project" {}

variable "vpc_cidr" {}

variable "admin_cidr" {}

variable "public_subnet_cidrs" {
  type = list
}

variable "private_subnet_cidrs" {
  type = list
}
