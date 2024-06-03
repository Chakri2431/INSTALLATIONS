#!/bin/bash

# Update the package list
sudo apt-get update

# Install required packages
sudo apt-get install -y apt-transport-https ca-certificates curl

# Download and add the Google Cloud public signing key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add the Kubernetes APT repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update the package list again to include the new repository
sudo apt-get update

# Install kubectl
sudo apt-get install -y kubectl

# Verify kubectl installation
kubectl version --client

if [ $? -ne 0 ]
then 
	echo "kubectl installation is not completed"
else

echo "kubectl installation completed successfully."
fi
