terraform {
  required_version = ">= 1.0.0, < 1.1.0"
}

module "base" {
  source              = "./modules/base"
  project             = var.project
  owner               = var.owner
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnets      = var.public_subnets
  private_was_subnets = var.private_was_subnets
  private_db_subnets  = var.private_db_subnets
  private_dns         = var.private_dns
  private_was_nat     = var.private_was_nat
  private_db_nat      = var.private_db_nat
  aws_resource_tags   = local.aws_resource_tags
}

module "mgmt" {
  source            = "./modules/mgmt"
  project           = var.project
  aws_resource_tags = local.aws_resource_tags
}

module "bastion" {
  source                                = "./modules/bastion"
  project                               = var.project
  aws_subnet_az                         = var.public_subnets[0].az
  private_dns                           = var.private_dns
  aws_vpc_id                            = module.base.aws_vpc_id
  aws_subnet_id                         = module.base.aws_public_subnets[var.public_subnets[0].az].id
  aws_default_security_group_default_id = module.base.aws_default_security_group_default_id
  aws_route53_private_id                = module.base.aws_route53_private_id
  aws_iam_policy_s3_mgmt_read_write_arn = module.mgmt.aws_iam_policy_s3_mgmt_read_write_arn
  aws_resource_tags                     = local.aws_resource_tags
  aws_key_pair_bastion_public_key       = var.aws_key_pair_bastion_public_key
  aws_key_pair_default_public_key       = var.aws_key_pair_default_public_key
}
