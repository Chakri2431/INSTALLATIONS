#!/bin/bash

# Update and install prerequisites
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Install Helm (if not already installed)
if ! command -v helm &> /dev/null
then
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install -y gnupg
    curl -fsSL https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /usr/share/keyrings/helm.gpg
    sudo tee /etc/apt/sources.list.d/helm-stable-debian.list <<EOF
deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main
EOF
    sudo apt-get update
    sudo apt-get install -y helm
fi

# Verify Helm installation
helm version

# Start Minikube (if not already running)
if ! minikube status | grep -q "host: Running"; then
    minikube start --driver=docker
fi

# Add the Jenkins Helm chart repository
helm repo add jenkins https://charts.jenkins.io
helm repo update

# Create a namespace for Jenkins
kubectl create namespace jenkins

# Install Jenkins using Helm
helm install jenkins jenkins/jenkins --namespace jenkins

# Wait for Jenkins to be deployed
echo "Waiting for Jenkins to be deployed..."
kubectl rollout status deployment/jenkins --namespace jenkins

# Print the Jenkins admin password
echo "Jenkins admin password:"
kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/additional/chart-admin-password && echo

# Print the Jenkins URL
minikube service jenkins --namespace jenkins --url

echo "Jenkins installation completed successfully."

