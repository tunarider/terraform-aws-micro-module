resource "aws_eip" "private_was_nat" {
  for_each = { for key, value in aws_subnet.private_was : value.availability_zone => value if var.private_was_nat }

  vpc = true

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}PrivateWASNAT-${each.value.availability_zone}" }
  )
}

resource "aws_eip" "private_db_nat" {
  for_each = { for key, value in aws_subnet.private_db : value.availability_zone => value if var.private_db_nat }

  vpc = true

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}PrivateDBNAT-${each.value.availability_zone}" }
  )
}
