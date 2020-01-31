aws_region      = "us-east-1"
project         = "aws_demo_2"
main_vpc_cidr   = "192.168.0.0/24"
main_admin_cidr = ""

main_public_subnet_cidrs = [
  "192.168.0.0/26",
  "192.168.0.64/26"
]

main_private_subnet_cidrs = [
  "192.168.0.128/26",
  "192.168.0.192/26"
]