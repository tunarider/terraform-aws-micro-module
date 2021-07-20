output "bastion_ip" {
  value = module.bastion.bastion_ip
}

output "aws_vpc_id" {
  value = module.base.aws_vpc_id
}

output "aws_default_security_group_default_id" {
  value = module.base.aws_default_security_group_default_id
}

output "aws_public_subnet_ids" {
  value = module.base.aws_public_subnet_ids
}

output "aws_private_was_subnet_ids" {
  value = module.base.aws_private_was_subnet_ids
}

output "aws_private_db_subnet_ids" {
  value = module.base.aws_private_db_subnet_ids
}

output "aws_route53_private_zone_id" {
  value = module.base.aws_route53_private_zone_id
}

output "aws_key_pair_bastion_key_name" {
  value = module.bastion.aws_key_pair_bastion_key_name
}

output "aws_key_pair_default_key_name" {
  value = module.bastion.aws_key_pair_default_key_name
}
