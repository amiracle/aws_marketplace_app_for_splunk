#!/bin/sh

# This script will help setup your matketplace.sh file

# Set your local directories
awscli=$HOME/.aws
awsvar=awsvars
awscommand=`which aws`

# Checks for the aws CLI toolkit

if [ "$awscommand" != "no"  ];then
echo "AWS CLI does NOT exist, please read https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-bundle.html"
else
echo "AWS CLI exists."
fi

# Checks for aws cli and directory (.aws) in home directory

if [ -d "$awscli" ];then
echo "AWS CLI and config directory exist."
else
echo "Please run aws configure to create .aws directory. If you do not have the AWS CLI, please install."
fi

# Checks for AWS Variables file 

if [ -f "$awsvar" ];then
echo "Variable file exists."
else
	echo "Let's populate the variables file."
        echo "Creating your marketplace.sh script."
        echo "Type in your AWS Account ID"
        read account_id
        echo accountid="$account_id" > awsvars
        echo "Name of your S3 Bucket"
        read s3bucket
        echo  s3bucket="$s3bucket" >> awsvars
        echo "Role ARN"
        read rolearn
        echo  rolearn="$rolearn" >> awsvars
        echo "SNS ARN"
        read snsarn
        echo snsarn="$snsarn" >> awsvars
        echo "Created aws variables file."
fi
