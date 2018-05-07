#!/bin/sh

#IFS=$IFS,
ad="`date +%Y-%m-%d`"

#echo "$ad"T00:00:00Z
while read -r billing; do
        echo "Generate Billing $billing..."
        aws marketplacecommerceanalytics generate-data-set --data-set-type "$billing" --data-set-publication-date ""$ad"T00:00:00Z" --role-name "arn:aws:iam::accountid:role/MarketplaceCommerceAnalyticsRole" --destination-s3-bucket-name "s3bucket" --sns-topic-arn "arn:aws:sns:region:accountid:my-marketplace-commerce"

done < billing
