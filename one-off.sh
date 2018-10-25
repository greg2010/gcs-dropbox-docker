#!/bin/sh

# Auth with gcloud
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
# Create mount folder, just in case
mkdir -p $DROPBOX_MOUNT_FOLDER
# Find all files in dropbox folder and upload them
find $DROPBOX_MOUNT_FOLDER -type f -exec gsutil cp {} gs://$GOOGLE_BUCKET \;