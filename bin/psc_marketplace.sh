#!/bin/bash

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
export APP_HOME=$HOME/etc/apps/aws_marketplace_app_for_splunk
export psc_report_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/psc_report
echo "`date` Product Support Connection Started" >> $APP_HOME/logs/psc_reports.log
export awsvars_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/awsvars
awsvar=$awsvars_file
if [ -f "$awsvar" ];then
echo "Variable file exists."
. $awsvars_file

ad="`date +%Y-%m-%d`"
#ad="2014-07-21"
while read -r psc_report_file; do
        echo "variable=$psc_report" >> $APP_HOME/logs/psc_reports.log
       echo "command="aws marketplacecommerceanalytics generate-data-set --data-set-type "$psc_report_file" --data-set-publication-date ""$ad"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn" >> $APP_HOME/logs/psc_reports.log 
       aws marketplacecommerceanalytics generate-data-set --data-set-type "$psc_report_file" --data-set-publication-date ""$ad"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn" &> $APP_HOME/logs/psc_reports.log

done < $psc_report_file
else
echo "Please re-run setup.sh to create AWS variables file."
fi
echo "`date` Product Support Connection Completed" >> $APP_HOME/logs/psc_reports.log
