#!/bin/bash

# This script downloads the service-account-key.json file necessary 
# for your terraform scripts to run.

SA_PROJECT=$(gcloud config get-value project)

gcloud iam service-accounts keys create \
    ./infrastructure/service-account-key.json \
    --iam-account=terraform@"$SA_PROJECT".iam.gserviceaccount.com