#!/bin/bash

export AWS_DEFAULT_REGION=ap-northeast-2

instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)
instance_hostname=$(aws ec2 describe-tags --filters Name=resource-id,Values=$instance_id Name=key,Values=Hostname --query "Tags[*].Value" --output text)

echo "
preserve_hostname: true
" >> /etc/cloud/cloud.cfg

hostnamectl set-hostname $instance_hostname

echo "
HOSTNAME=$instance_hostname
" >> /etc/sysconfig/network
