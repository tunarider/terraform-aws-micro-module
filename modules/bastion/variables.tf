variable "project" {
  type = string
}

variable "aws_vpc_id" {
  type = string
}

variable "private_dns" {
  type = string
}

variable "aws_subnet_id" {
  type = string
}

variable "aws_subnet_az" {
  type = string
}

variable "aws_iam_policy_s3_mgmt_read_write_arn" {
  type = string
}

variable "aws_default_security_group_default_id" {
  type = string
}

variable "aws_route53_private_id" {
  type = string
}

variable "aws_resource_tags" {
  type = object({
    Provisioner = string
    Project     = string
    Onwer       = string
  })
}

variable "aws_key_pair_bastion_public_key" {
  type = string
}

variable "aws_key_pair_default_public_key" {
  type = string
}
