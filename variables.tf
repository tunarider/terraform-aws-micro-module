variable "project" {
  type = string
}

variable "region" {
  type = string
}

variable "owner" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(object({
    az   = string
    cidr = string
  }))
}

variable "private_was_subnets" {
  type = list(object({
    az   = string
    cidr = string
  }))
}

variable "private_db_subnets" {
  type = list(object({
    az   = string
    cidr = string
  }))
}

variable "private_dns" {
  type = string
}

variable "private_was_nat" {
  type    = bool
  default = false
}

variable "private_db_nat" {
  type    = bool
  default = false
}

variable "aws_key_pair_bastion_public_key" {
  type = string
}

variable "aws_key_pair_default_public_key" {
  type = string
}
