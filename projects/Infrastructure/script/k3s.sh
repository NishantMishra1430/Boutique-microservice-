#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting K3s installation process..."

# 1. Update package list and install prerequisites
echo "Updating package list and installing curl..."
sudo apt-get update -y
sudo apt-get install curl -y

# 2. Download and run the official K3s installation script
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

# 3. Wait for the K3s service to start
echo "Waiting for K3s service to become active..."
sleep 15

# 4. Configure permissions for the current user
# This allows you to use 'kubectl' without typing 'sudo' every time
echo "Configuring kubeconfig for user: $USER..."
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config

# 5. Export KUBECONFIG to bashrc for future sessions
if ! grep -q "export KUBECONFIG=~/.kube/config" ~/.bashrc; then
    echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc
fi

# 6. Verify installation
echo "Installation complete! Verifying node status..."
kubectl get nodes

echo "K3s is successfully installed and ready to use."
