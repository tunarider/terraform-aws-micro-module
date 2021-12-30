output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "aws_default_security_group_default_id" {
  value = aws_default_security_group.default.id
}

output "aws_public_subnet_ids" {
  value = values(aws_subnet.public)[*].id
}

output "aws_private_was_subnet_ids" {
  value = values(aws_subnet.private_was)[*].id
}

output "aws_private_db_subnet_ids" {
  value = values(aws_subnet.private_db)[*].id
}

output "aws_route53_private_zone_id" {
  value = aws_route53_zone.private.id
}

output "aws_public_route_table_id" {
  value = aws_route_table.public.id
}
