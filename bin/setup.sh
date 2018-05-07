#!/bin/sh

# This script will help setup your matketplace.sh file

# Set your local directories
directory=$SPLUNK_HOME/etc/apps/aws_marketplace_app_for_splunk/bin
awscli=$HOME/.aws
script=$directory/marketplace.sh
awsvars=awsvars

# Checks for the marketplace.sh script
if [-f "$script" ];then
echo "Script exists, no need to run this setup script."
else 
echo "Let's create your marketplace shell script."
echo "First, let's populate the variables file."
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
# Checks for aws cli and directory (.aws) in home directory
if [ -d "$awscli" ];then
echo "AWS CLI and config directory exist."
else
echo "Please run aws configure to create .aws directory. If you do not have the AWS CLI, please install."
fi
