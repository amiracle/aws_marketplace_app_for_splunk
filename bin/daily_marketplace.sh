#!/bin/bash

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
export APP_HOME=$HOME/etc/apps/aws_marketplace_app_for_splunk/
export daily_billing_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/daily_billing
export awsvars_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/awsvars
echo "`date` Daily Billing Started" >> $APP_HOME/logs/daily_billing.log
awsvar=$awsvars_file
if [ -f "$awsvar" ];then
echo "Variable file exists."
. $awsvars_file
ad="`date +%Y-%m-%d`"
#ad="2018-08-02"
# Gets the variables from the daily_billing file.
	while read -r daily_billing_file; do
	# Logs the event to the proper log file.
	# Runs the aws command to hit the API to start pulling the data down.
	echo variable="$daily_billing_file" >> $APP_HOME/logs/daily_billing.log
        echo command="aws marketplacecommerceanalytics generate-data-set --data-set-type "$daily_billing_file" --data-set-publication-date ""$ad"T17:00:00Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"" >> $APP_HOME/logs/daily_billing.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type ""$daily_billing_file"" --data-set-publication-date ""$ad"T17:00:00Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn" &> $APP_HOME/logs/daily_billing.log
	# Logs each command into the log file.
done < $daily_billing_file
else
echo "Please re-run setup.sh to create AWS variables file."
fi
echo "`date` Daily Billing Completed" >> $APP_HOME/logs/daily_billing.log
