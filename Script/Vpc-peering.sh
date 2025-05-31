#!/bin/bash

# Create VPC Peering Connection
VPC_ID_1="vpc-xxxxxxxx"
VPC_ID_2="vpc-yyyyyyyy"
REGION="us-west-2"

echo "Creating VPC peering connection..."
PEERING_ID=$(aws ec2 create-vpc-peering-connection \
    --vpc-id $VPC_ID_1 \
    --peer-vpc-id $VPC_ID_2 \
    --region $REGION \
    --query 'VpcPeeringConnection.VpcPeeringConnectionId' \
    --output text)

echo "Peering connection created: $PEERING_ID"

echo "Accepting peering connection..."
aws ec2 accept-vpc-peering-connection \
    --vpc-peering-connection-id $PEERING_ID \
    --region $REGION

echo "VPC peering connection accepted."
