#!/bin/bash

# WordPress to S3 Bash Script
# https://github.com/niczak/WP-S3
#
# Configuration: Update the variables below with your credentials.
#
# Usage: Run directly from command line or as a cron job.
#
# sh ./filesToS3.sh
#
#

path="PATH_TO_FILES"

stamp=`date +"%m-%d-%y"`
tempfile='/tmp/wp-file-backup.gz'

s3bucket="s3://BUCKETNAME"
s3file="$s3bucket/wp-file-backup-$stamp.gz"

echo "\n... Compressing data"

tar -zcvf "$tempfile" "$path"

echo "\n... Uploading data"

s3cmd put "$tempfile" "$s3file"

echo "\n... Cleaning up"
rm -f "$tempfile"
