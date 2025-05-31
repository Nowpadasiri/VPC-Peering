#!/bin/bash

AMI_ID="ami-0abcdef1234567890"
INSTANCE_TYPE="t2.micro"
KEY_NAME="your-key-pair"
SECURITY_GROUP_ID="sg-xxxxxxxx"
SUBNET_ID="subnet-xxxxxxxx"

echo "Launching EC2 instance as Bastion Host..."
aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_NAME \
    --security-group-ids $SECURITY_GROUP_ID \
    --subnet-id $SUBNET_ID \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=BastionHost}]'
