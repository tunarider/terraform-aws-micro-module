resource "aws_instance" "bastion" {
  ami                  = "ami-09282971cf2faa4c9"
  availability_zone    = var.aws_subnet_az
  instance_type        = "t3.nano"
  key_name             = aws_key_pair.bastion.key_name
  iam_instance_profile = aws_iam_instance_profile.bastion_instance_profile.name

  user_data = file("${path.module}/assets/bastion_user_data.sh")

  vpc_security_group_ids = [
    var.aws_default_security_group_default_id,
    aws_security_group.public_ssh.id,
  ]

  subnet_id                   = var.aws_subnet_id
  associate_public_ip_address = true

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}Bastion" }
  )

  root_block_device {
    tags = merge(
      var.aws_resource_tags,
      { Name = "${title(var.project)}BastionRoot" }
    )
  }
}

resource "aws_route53_record" "bastion_private" {
  zone_id = var.aws_route53_private_id
  name    = "bastion.${var.private_dns}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.bastion.private_ip]
}