This section of the app is meant to backfill old marketplace files into your s3 bucket. First, create a date file which covers the timeframe you need to backfill. Make sure the dates follow the %Y-%m-%d format (e.g. 2018-01-01). 

Once you have the date file created, simply run the command and it will populate the s3 buckets for all the known marketplace data sets. The 'q1' file can be populated with the dates you need to restore and the script will iterate throughout those dates. 

Check the $HOME/etc/apps/aws_marketplace_app_for_splunk/logs/backfill.log for any errors. 

Usage:
./backfill.sh
