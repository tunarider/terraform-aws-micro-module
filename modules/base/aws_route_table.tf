resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = { Name = "${title(var.project)}Public" }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  for_each = { for subnet in var.public_subnets : subnet.az => subnet }

  subnet_id      = aws_subnet.public[each.value.az].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private_was" {
  for_each = { for subnet in var.private_was_subnets : subnet.az => subnet }

  vpc_id = aws_vpc.main.id

  tags = { Name = "${title(var.project)}PrivateWAS-${each.value.az}" }
}

resource "aws_route" "private_was_nat" {
  for_each = { for subnet in var.private_was_subnets : subnet.az => subnet if var.private_was_nat }

  route_table_id         = aws_route_table.private_was[each.value.az].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.private_was[each.value.az].id
}

resource "aws_route_table_association" "private_was" {
  for_each = { for subnet in var.private_was_subnets : subnet.az => subnet }

  subnet_id      = aws_subnet.private_was[each.value.az].id
  route_table_id = aws_route_table.private_was[each.value.az].id
}

resource "aws_route_table" "private_db" {
  for_each = { for subnet in var.private_db_subnets : subnet.az => subnet }

  vpc_id = aws_vpc.main.id

  dynamic "route" {
    for_each = var.private_db_nat ? [1] : []
    content {
      cidr_block     = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.private_db[each.value.az].id
    }
  }

  tags = { Name = "${title(var.project)}PrivateDB-${each.value.az}" }
}

resource "aws_route_table_association" "private_db" {
  for_each = { for subnet in var.private_db_subnets : subnet.az => subnet }

  subnet_id      = aws_subnet.private_db[each.value.az].id
  route_table_id = aws_route_table.private_db[each.value.az].id
}
