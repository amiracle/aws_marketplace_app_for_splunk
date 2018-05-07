#!/bin/sh

#IFS=$IFS,
ad="`date +%Y-%m-%d`"

#echo "$ad"T00:00:00Z
while read -r billing; do
        echo "Generate Billing $billing..."
        aws marketplacecommerceanalytics generate-data-set --data-set-type "$billing" --data-set-publication-date ""$ad"T00:00:00Z" --role-name "arn:aws:iam::841176192222:role/MarketplaceCommerceAnalyticsRole" --destination-s3-bucket-name "splunk-marketplaceami" --sns-topic-arn "arn:aws:sns:us-east-1:841176192222:splunk-marketplace-commerce"

done < billing
