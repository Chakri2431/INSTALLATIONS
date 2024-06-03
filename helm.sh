#!/bin/bash

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Download and install Helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install -y gnupg
sudo apt-key del 6A51BB3295268F51
curl -fsSL https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /usr/share/keyrings/helm.gpg
sudo tee /etc/apt/sources.list.d/helm-stable-debian.list <<EOF
deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main
EOF
sudo apt-get update
sudo apt-get install -y helm

# Verify Helm installation
helm version

echo "Helm installation completed successfully."

