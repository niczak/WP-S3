WordPress to S3 Back-Up
===========

## What is all this?

Contained here are a collection of scripts that I use heavily in conjunction with WordPress and S3 to create daily/weekly back-ups of my database/files respectively.

## Requirements

In order to leverage Amazon's S3 services you will need to install the s3cmd tools.  All major package managers will have this utility, I installed it in Ubuntu using the following command:
```
sudo apt-get install s3cmd
```

## Installation
```
git clone https://github.com/niczak/WP-S3.git
```

## Getting Started
```
sh databaseToS3.sh
sh filesToS3.sh
```

## Ideas for Usage

1. Invoke manually whenever you want to create a back-up.
2. Configure cron jobs on your server so that your database is backed up daily and your files are backed up weekly.
