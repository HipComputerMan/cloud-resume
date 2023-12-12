#!/bin/bash

# AWS S3 bucket name
bucket_name="brandon-chesser-cloud-resume-challenge"
website_directory="./Website"

# Iterate over each file in the directory
for file in "$website_directory"/*; do
  # Check if the item is a file
  if [ -f "$file" ]; then
    echo "Processing file: $file"
    # Upload to AWS bucket
    aws s3 cp "$file" "s3://$bucket_name/" --profile AdministratorAccess-395067379223
  fi
done

# Check if the upload was successful
if [ $? -eq 0 ]; then
  echo "File uploaded successfully to S3 bucket: $bucket_name"
else
  echo "Error uploading file to S3 bucket: $bucket_name"
fi
