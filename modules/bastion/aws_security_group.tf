resource "aws_security_group" "public_ssh" {
  name = "public_ssh"

  vpc_id = var.aws_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}PublicSSH" }
  )
}
