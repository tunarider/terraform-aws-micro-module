resource "aws_route53_record" "bastion_private" {
  zone_id = var.aws_route53_private_zone_id
  name    = "bastion.${var.private_dns}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.bastion.private_ip]
}
