#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=nguyendt9/projectfour
# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy projectfour --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
container_pod_name=$(kubectl get pods -o custom-columns=':metadata.name' --no-headers)
kubectl port-forward pod/$container_pod_name 8080:80 

