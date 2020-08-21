#!/usr/bin/env bash

sudo chmod 666 /var/run/docker.sock

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag=website:v1 .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run website
docker run -d -p 80:80 website:v1
