resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "${title(var.project)}BastionInstanceProfile"
  role = aws_iam_role.bastion_instance_profile.name

  tags = { Name = "${title(var.project)}S3MGMTReadWrite" }
}

resource "aws_iam_role_policy_attachment" "bastion_instance_profile_s3_mgmt" {
  role       = aws_iam_role.bastion_instance_profile.name
  policy_arn = var.aws_iam_policy_s3_mgmt_read_write_arn
}

resource "aws_iam_role_policy_attachment" "bastion_instance_profile_ec2_describe_tags" {
  role       = aws_iam_role.bastion_instance_profile.name
  policy_arn = aws_iam_policy.ec2_describe_tags.arn
}

resource "aws_iam_role" "bastion_instance_profile" {
  name = "${title(var.project)}BastionInstanceProfile"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
