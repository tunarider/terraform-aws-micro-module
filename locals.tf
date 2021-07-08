locals {
  aws_resource_tags = {
    Provisioner = "Terraform"
    Project     = title(var.project)
    Onwer       = title(var.owner)
  }
}
