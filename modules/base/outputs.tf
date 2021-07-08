output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "aws_default_security_group_default_id" {
  value = aws_default_security_group.default.id
}

output "aws_public_subnets" {
  value = aws_subnet.public
}

output "aws_route53_private_id" {
  value = aws_route53_zone.private.id
}
