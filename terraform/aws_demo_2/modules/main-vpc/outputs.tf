output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_public_ids" {
  value = aws_subnet.public_subnets.*.id
}
