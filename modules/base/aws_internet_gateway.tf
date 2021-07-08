resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.aws_resource_tags,
    { Name = title(var.project) }
  )
}
