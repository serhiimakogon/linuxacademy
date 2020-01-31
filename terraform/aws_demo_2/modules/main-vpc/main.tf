#--- module/main-vpc ---

data "aws_availability_zones" "az" {}

# --- VPC ---
resource "aws_vpc" "main" {
  cidr_block    = var.vpc_cidr

  tags = {
    Name        = "main_vpc"
    Project     = var.project
    Terraform   = "true"
  }
}

# --- Subnets ---
resource "aws_subnet" "public_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                  = "public_${count.index + 1}"
    Project               = var.project
    Terraform             = "true"
  }
}

resource "aws_subnet" "private_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name                  = "private_${count.index + 1}"
    Project               = var.project
    Terraform             = "true"
  }
}

# --- Internet Gateway ---
resource "aws_internet_gateway" "gw" {
  vpc_id        = aws_vpc.main.id

  tags = {
    Name        = "main_igw"
    Project     = var.project
    Terraform   = "true"
  }
}

# --- Route tables ---
resource "aws_route_table" "public_rt" {
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name                  = "public_rt"
    Project               = var.project
    Terraform             = "true"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name                  = "private_rt"
    Project               = var.project
    Terraform             = "true"
  }
}

# --- Routes ---
resource "aws_route" "default_public_route" {
  route_table_id          = aws_route_table.public_rt.id
  gateway_id              = aws_internet_gateway.gw.id
  destination_cidr_block  = "0.0.0.0/0"
}

resource "aws_route" "default_private_route" {
  route_table_id          = aws_route_table.private_rt.id
  gateway_id              = aws_internet_gateway.gw.id
  destination_cidr_block  = "0.0.0.0/0"
}

# --- Route tables associations ---
resource "aws_route_table_association" "public_rt_to_public_subnets" {
  count          = 2
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt_to_private_subnets" {
  count          = 2
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_rt.id
}