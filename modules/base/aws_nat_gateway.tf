resource "aws_nat_gateway" "private_was" {
  for_each = { for key, value in aws_subnet.private_was : value.availability_zone => value if var.private_was_nat }

  allocation_id = aws_eip.private_was_nat[each.value.availability_zone].id
  subnet_id     = each.value.id

  tags = { Name = "${title(var.project)}PrivateWASNAT-${each.value.availability_zone}" }
}

resource "aws_nat_gateway" "private_db" {
  for_each = { for key, value in aws_subnet.private_db : value.availability_zone => value if var.private_db_nat }

  allocation_id = aws_eip.private_db_nat[each.value.availability_zone].id
  subnet_id     = each.value.id

  tags = { Name = "${title(var.project)}PrivateDBNAT-${each.value.availability_zone}" }
}
