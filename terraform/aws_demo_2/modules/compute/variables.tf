variable "project" {}

variable "instance_type" {}

variable "key_pair_name" {}

variable "admin_cidr" {}

variable "vpc_id" {}

variable "vpc_zone_identifier" {
  type = list
}