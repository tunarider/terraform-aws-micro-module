resource "aws_iam_policy" "ec2_describe_tags" {
  name = "${title(var.project)}EC2DescribeTags"
  path = "/"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "ec2:DescribeTags",
        "Resource" : "*"
      }
    ]
  })

  tags = merge(
    var.aws_resource_tags,
    { Name = "${title(var.project)}EC2DescribeTags" }
  )
}

