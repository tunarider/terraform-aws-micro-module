resource "aws_subnet" "public" {
  for_each = { for subnet in var.public_subnets : subnet.az => subnet }

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = { Name = "${title(var.project)}Public-${each.value.az}" }
}

resource "aws_subnet" "private_was" {
  for_each = { for subnet in var.private_was_subnets : subnet.az => subnet }

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false

  tags = { Name = "${title(var.project)}PrivateWAS-${each.value.az}" }
}

resource "aws_subnet" "private_db" {
  for_each = { for subnet in var.private_db_subnets : subnet.az => subnet }

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false

  tags = { Name = "${title(var.project)}PrivateDB-${each.value.az}" }
}
