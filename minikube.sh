#!/bin/bash

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Verify Docker installation
sudo systemctl status docker
docker --version

# Add current user to Docker group
sudo usermod -aG docker ${USER}

# Install Minikube dependencies
sudo apt-get install -y conntrack

# Download and install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Verify Minikube installation
minikube version

# Start Minikube
minikube start --driver=docker

echo "Docker and Minikube installation completed successfully."

# Notes:
# After running this script, you need to log out and log back in to apply Docker group changes.
# To use Minikube, you may need to install kubectl. You can do this with the following commands:

# curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
# chmod +x kubectl
# sudo mv kubectl /usr/local/bin/
# kubectl version --client

