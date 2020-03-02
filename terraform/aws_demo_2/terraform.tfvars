# --- General ---
aws_region      = "us-east-1"
project         = "aws_demo_2"

# --- VPC ---
main_vpc_cidr   = "192.168.0.0/24"
main_admin_cidr = "79.110.130.157/32"

main_public_subnet_cidrs = [
  "192.168.0.0/26",
  "192.168.0.64/26"
]

main_private_subnet_cidrs = [
  "192.168.0.128/26",
  "192.168.0.192/26"
]

# --- Compute ---
instance_type = "t2.micro"
key_pair_name = "almost_ready_demo"