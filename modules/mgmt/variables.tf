variable "project" {
  type = string
}

variable "aws_resource_tags" {
  type = object({
    Provisioner = string
    Project     = string
    Onwer       = string
  })
}
