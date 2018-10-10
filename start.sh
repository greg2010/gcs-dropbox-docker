#!/bin/sh

# Auth with gcloud
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS
# Create mount folder, just in case
mkdir -p $DROPBOX_MOUNT_FOLDER
inotifywait -r -m -e modify,create --format '%w%f' $DROPBOX_MOUNT_FOLDER | while read FILE
do
    # Copy modified file to the bucket
    gsutil cp -r $FILE gs://$GOOGLE_BUCKET
    # Remove local copy
    rm -r $FILE
done
