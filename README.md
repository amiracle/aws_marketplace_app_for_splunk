# AWS Market Place App for Splunk
This app is designed to collect data from the AWS Marketplace and analyize how users are deploying your application / AMI's. 

## Install Steps
After downloading and installing this app onto your Splunk deployment, you will need to run the setup.sh file found in the `bin` directory of this app: `$SPLUNK_HOME/etc/apps/aws_marketplace_app_for_splunk/bin`

`$ sh setup.sh`
Enter the information requested, make sure to input the full ARN (Amazon Resource Name) for the SNS Topic and IAM Role. Once this is complete, then you can test the output by running the `marketplace.sh` file manually:
`$ sh marketplace.sh`
