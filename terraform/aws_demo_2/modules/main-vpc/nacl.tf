# --- Network ACLs ---
resource "aws_network_acl" "public_nacl" {
  vpc_id        = aws_vpc.main.id
  subnet_ids    = aws_subnet.public_subnets.*.id

  tags = {
    Name        = "public_nacl"
    Project     = var.project
    Terraform   = "true"
  }
}

resource "aws_network_acl_rule" "ssh_pub_in_100"{
  network_acl_id        = aws_network_acl.public_nacl.id
  rule_number           = 105
  egress                = false
  protocol              = "tcp"
  rule_action           = "allow"
  cidr_block            = var.admin_cidr
  from_port             = 22
  to_port               = 22
}

resource "aws_network_acl_rule" "ephemeral_pub_in_110"{
  network_acl_id        = aws_network_acl.public_nacl.id
  rule_number           = 110
  egress                = false
  protocol              = "tcp"
  rule_action           = "allow"
  cidr_block            = "0.0.0.0/0"
  from_port             = 1024
  to_port               = 65535
}

resource "aws_network_acl_rule" "ephemeral_pub_out_100"{
  network_acl_id        = aws_network_acl.public_nacl.id
  rule_number           = 100
  egress                = true
  protocol              = "-1"
  rule_action           = "allow"
  cidr_block            = "0.0.0.0/0"
  from_port             = 0
  to_port               = 0
}

resource "aws_network_acl" "private_nacl" {
  vpc_id        = aws_vpc.main.id
  subnet_ids    = aws_subnet.private_subnets.*.id

  tags = {
    Name        = "private_nacl"
    Project     = var.project
    Terraform   = "true"
  }
}