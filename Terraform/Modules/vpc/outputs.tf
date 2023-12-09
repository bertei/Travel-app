output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnets_id" {
  value = aws_subnet.public_subnets.*.id
}