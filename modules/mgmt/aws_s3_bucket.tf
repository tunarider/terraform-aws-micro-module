resource "random_id" "s3_mgmt_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "mgmt" {
  bucket = "${lower(var.project)}-mgmt-${lower(random_id.s3_mgmt_id.id)}"
  acl    = "private"

  tags = merge(
    var.aws_resource_tags,
    { Name = title(var.project) }
  )
}
