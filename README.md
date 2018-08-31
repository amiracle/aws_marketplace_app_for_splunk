# AWS Market Place App for Splunk
This app is designed to collect data from the AWS Marketplace and analyize how users are deploying your application / AMI's. 

## Prerequisites for this app:

+ Splunk Add-on for AWS : https://splunkbase.splunk.com/app/1876/
+ AWS CLI on Heavy Forwarder (HF) : https://docs.aws.amazon.com/cli/latest/userguide/installing.html
+ Pacific Time Zone (PST) for HF 

## Install Process

Install the `aws_marketplace_app_for_splunk` on your Search Head and the `Splunk_TA_awsmarketplace` on your HF. These can both run on the same machine if necessary. 

Install the Splunk Add-on for AWS on the Heavy Forwarder (HF) and configure it with an EC2 role. Once installed, setup the S3 input for your AWS Marketplace S3 bucket with your marketplace data via the Splunk Web UI. You will create 17 inputs and then modify them via the CLI to correct the sourcetype for each one.

### Sourcetypes:
+ aws:csv:daily_business_usage_by_instance_type
+ aws:csv:daily_business_new_product_subscribers
+ aws:csv:daily_business_new_instances
+ aws:csv:daily_business_fees
+ aws:csv:daily_business_canceled_product_subscribers
+ aws:csv:daily_business_free_trial_conversions
+ aws:csv:us_sales_and_use_tax_records
+ aws:csv:sales_compensation_billed_revenue
+ aws:csv:disbursed_amount_by_product
+ aws:csv:disbursed_amount_by_instance_hours
+ aws:csv:disbursed_amount_by_customer_geo
+ aws:csv:disbursed_amount_by_age_of_uncollected_funds
+ aws:csv:disbursed_amount_by_age_of_disbursed_funds
+ aws:csv:customer_subscriber_hourly_monthly_subscriptions
+ aws:csv:customer_subscriber_annual_subscriptions
+ aws:csv:monthly_revenue_billing_and_revenue_data
+ aws:csv:monthly_revenue_annual_subscriptions
+ aws:mp:logs

### Scripted Inputs

The app will create some scripted inputs that will run these scripts on a cron schedule, specifically on the 4th of each month at 5PM PST. All of these scripts are set to disabled by default, and need to be enbaled manually via the Inputs screen. 

### Logs Directory

Each source will have their own logs that will go to the `_internal` index as the sourcetype `aws:mp:logs`. 

