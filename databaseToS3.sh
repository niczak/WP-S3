#!/bin/bash

# WordPress to S3 Bash Script
# https://github.com/niczak/WP-S3
#
# Configuration: Update the variables below with your credentials.
#
# Usage: Run directly from command line or as a cron job.
#
# sh ./databaseToS3.sh
#
#

mysqluser="MYSQL_USER"
mysqlpass="MYSQL_PASS"
mysqldb="MYSQL_DB"

stamp=`date +"%m-%d-%y"`
tempfile='/tmp/wp-backup.gz'

s3bucket="s3://BUCKETNAME"
s3file="$s3bucket/wp-db-backup-$stamp.gz"

echo "\n... Dumping data"

mysqldump -u "$mysqluser" -p"$mysqlpass" --force --opt --databases "$mysqldb" | gzip -c > "$tempfile"

echo "\n... Uploading data"

s3cmd put "$tempfile" "$s3file"

echo "\n... Cleaning up"
rm -f "$tempfile"
