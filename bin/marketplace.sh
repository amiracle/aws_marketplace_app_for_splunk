#!/bin/sh

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
awsvar=awsvars
if [ -f "$awsvar" ];then
echo "Variable file exists."
. ./awsvars
ad="`date +%Y-%m-%d`"
while read -r billing; do
        echo "Generate Billing $billing..."
        aws marketplacecommerceanalytics generate-data-set --data-set-type "$billing" --data-set-publication-date ""$ad"T00:00:00Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"

done < billing
else
echo "Please re-run setup.sh to create AWS variables file."
fi
