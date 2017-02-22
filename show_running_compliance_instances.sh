#!/bin/sh

AMI_ID=ami-614d7476

aws ec2 describe-instances --query  'Reservations[*].Instances[*].[InstanceId,ImageId,PublicIpAddress,State.Name,Tags[?Key==`Name`].Value | [0]]' --output text | grep running | grep $AMI_ID
