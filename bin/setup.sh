#!/bin/sh

#Set App home variable
export APP_HOME=$HOME/etc/apps/aws_marketplace_app_for_splunk
echo `date` "Started Setup for AWS Marketplace App" >> $APP_HOME/logs/setup.log
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

echo `date` "Completed Setup for AWS Marketplace App" >> $APP_HOME/logs/setup.log
# Setup Splunk AWS S3 Input
# echo "Your hostname is `$hostname`?"
# read splhostname
# echo "Your management URI is https://`$hostname`:8089"
# echo "Enter your Splunk admin user:"
# read spluser
#echo "Enter your Splunk password for the user:"
#read splpassword
#echo "Create your S3 Modular Input"
#echo "Name your modular input:"
#read s3inputname
#
#	if [ "$ynhostname" == *y* ];then
#	echo "Adding the hostname to the splunk-info.json file"
#	echo 
