#!/bin/sh

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
awsvar=awsvars
if [ -f "$awsvar" ];then
echo "Variable file exists."
. ./awsvars
ad="`date +%Y-%m-%d`"
while read -r monthly_billing; do
        echo "Generate Billing $monthly_billing..."
        aws marketplacecommerceanalytics generate-data-set --data-set-type "$monthly_billing" --data-set-publication-date ""$ad"T00:00:00Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"

done < monthly_billing
else
echo "Please re-run setup.sh to create AWS variables file."
fi
