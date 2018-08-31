# Purpose 
## This directory contains scripts which will run agains the Marketplace API. 
##
### Each shell script is paired with a variable file that it uses to cycle through and collect the information.  

#### Pairing

+ customer_billing -> customer_marketplace.sh
+ daily_billing -> daily_marketplace.sh
+ disbursed_billing -> disbursed_marketplace.sh
+ monthly_billing -> monthly_marketplace.sh
+ psc_report -> psc_marketplace.sh
+ sales_billing -> sales_marketplace.sh
+ tax_billing -> tax_marketplace.sh

#### Script Setup
Checklist
+ AWS CLI (https://docs.aws.amazon.com/lambda/latest/dg/setup-awscli.html)
+ Configure AWS CLI
+ Setup server to PST timezone (critical)
+ Run setup.sh script

First, make sure you have the aws_cli installed on your instance. (https://docs.aws.amazon.com/lambda/latest/dg/setup-awscli.html)

Once you have the aws_cli installed, make sure to run `aws config` and make sure that all the variables are filled out, Key, secret key, region and output.

After configuring the aws cli, now you can run the `setup.sh` script.  This will create a the `awsvar` file that will contain your required variables:

Example of `awsvars`:

+ `accountid=1111111111`
+ `s3bucket=my-marketplace-reports`
+ `rolearn=arn:aws:iam::1111111111:role/MarketplaceCommerceAnalyticsRole`
+ `snsarn=arn:aws:sns:us-east-1:1111111111:my-marketplace-commerce`



