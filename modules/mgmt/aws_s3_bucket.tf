resource "random_string" "s3_mgmt_id" {
  length      = 16
  lower       = true
  upper       = false
  number      = true
  special     = false
  min_lower   = 1
  min_numeric = 1
}

resource "aws_s3_bucket" "mgmt" {
  bucket = "${lower(var.project)}-mgmt-${random_string.s3_mgmt_id.result}"
  acl    = "private"

  tags = merge(
    var.aws_resource_tags,
    { Name = title(var.project) }
  )
}
