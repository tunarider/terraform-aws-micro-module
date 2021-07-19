resource "aws_route53_zone" "private" {
  name = var.private_dns

  vpc {
    vpc_id = aws_vpc.main.id
  }

  tags = { Name = "${title(var.project)}Private" }
}
