resource "aws_key_pair" "default" {
  key_name   = "${title(var.project)}Default"
  public_key = var.aws_key_pair_default_public_key

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}Default" }
  )
}

resource "aws_key_pair" "bastion" {
  key_name   = "${title(var.project)}Bastion"
  public_key = var.aws_key_pair_bastion_public_key

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}Bastion" }
  )
}
