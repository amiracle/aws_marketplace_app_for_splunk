#!/bin/bash

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
export APP_HOME=$HOME/etc/apps/aws_marketplace_app_for_splunk/
export disbursed_billing_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/disbursed_billing
export awsvars_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/awsvars
echo "`date` Daily Billing Started" >> $APP_HOME/logs/disbursed_billing.log
awsvar=$awsvars_file
if [ -f "$awsvar" ];then
echo "Variable file exists."
. $awsvars_file
ad="`date +%Y-%m-%d`"
#ad=2018-08-02
while read -r disbursed_billing_file; do
        echo "variable=$disbursed_billing_file" >> $APP_HOME/logs/disbursed_billing.log
	echo "command="aws marketplacecommerceanalytics generate-data-set --data-set-type "$disbursed_billing_file" --data-set-publication-date ""$ad"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn" >> $APP_HOME/logs/disbursed_billing.log        
aws marketplacecommerceanalytics generate-data-set --data-set-type "$disbursed_billing_file" --data-set-publication-date ""$ad"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn" &> $APP_HOME/logs/disbursed_billing.log

done < $disbursed_billing_file
else
echo "Please re-run setup.sh to create AWS variables file."
fi
echo "`date` Disbursed Billing Completed" >> $APP_HOME/logs/disbursed_billing.log
