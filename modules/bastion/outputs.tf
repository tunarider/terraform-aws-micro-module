output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}

output "aws_key_pair_bastion_key_name" {
  value = aws_key_pair.bastion.key_name
}

output "aws_key_pair_default_key_name" {
  value = aws_key_pair.default.key_name
}
