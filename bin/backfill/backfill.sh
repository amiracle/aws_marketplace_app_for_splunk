#!/bin/bash

#IFS=$IFS,
# Check for awsvars (AWS Variables) file
export APP_HOME=$HOME/etc/apps/aws_marketplace_app_for_splunk/
export awsvars_file=$HOME/etc/apps/aws_marketplace_app_for_splunk/bin/awsvars
echo "`date` Missing Billing Started" >> $APP_HOME/logs/backfill.log
awsvar=$awsvars_file
if [ -f "$awsvar" ];then
echo "Variable file exists."
. $awsvars_file
ad="`date +%Y-%m-%d`"
        echo "Generate Billing ..."
while read -r q1; do
        aws marketplacecommerceanalytics generate-data-set --data-set-type "sales_compensation_billed_revenue" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` sales_compensation_billed_revenue started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "us_sales_and_use_tax_records" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` us_sales_and_use_tax_records started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "disbursed_amount_by_instance_hours" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` disbursed_amount_by_instance_hours started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "disbursed_amount_by_product" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` disbursed_amount_by_product started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "disbursed_amount_by_customer_geo" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` disbursed_amount_by_customer_geo started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "disbursed_amount_by_age_of_uncollected_funds" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` disbursed_amount_by_age_of_uncollected_funds started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "disbursed_amount_by_age_of_disbursed_funds" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` disbursed_amount_by_age_of_disbursed_funds started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "monthly_revenue_annual_subscriptions" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` monthly_revenue_annual_subscriptions started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "monthly_revenue_billing_and_revenue_data" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` monthly_revenue_billing_and_revenue_data started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "customer_support_contacts_data" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` customer_support_contacts_data started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "customer_subscriber_annual_subscriptions" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` customer_subscriber_annual_subscriptions started" >> $APP_HOME/logs/backfill.log
        aws marketplacecommerceanalytics generate-data-set --data-set-type "customer_subscriber_hourly_monthly_subscriptions" --data-set-publication-date ""$q1"T17:00:01Z" --role-name "$rolearn" --destination-s3-bucket-name "$s3bucket" --sns-topic-arn "$snsarn"
	echo "`date` customer_subscriber_hourly_monthly_subscriptions started" >> $APP_HOME/logs/backfill.log
	done < q1
else
echo "Please re-run setup.sh to create AWS variables file."
fi
echo "`date` Missing Billing Completed" >> $APP_HOME/logs/backfill.log
