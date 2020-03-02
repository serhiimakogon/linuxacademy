resource "aws_security_group" "admin" {
  name          = "allow_admin"
  description   = "Allow admin"
  vpc_id        = var.vpc_id

  ingress {
    protocol      = "tcp"
    from_port     = 22
    to_port       = 22
    cidr_blocks   = [var.admin_cidr]
  }

  egress {
    protocol      = "-1"
    from_port     = 0
    to_port       = 0
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "public_nacl"
    Project     = var.project
    Terraform   = "true"
  }
}