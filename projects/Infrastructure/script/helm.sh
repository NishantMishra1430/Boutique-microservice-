#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting Helm and Chart installation process..."

# 1. Verify Kubernetes connectivity
# Helm requires kubectl access to work.
if ! kubectl get nodes >/dev/null 2>&1; then
  echo "Error: Cannot connect to Kubernetes cluster. Ensure K3s is running and KUBECONFIG is set."
  exit 1
fi

# 2. Install Helm CLI
if ! command -v helm &> /dev/null; then
    echo "Helm not found. Installing Helm..."
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh
    rm get_helm.sh
else
    echo "Helm is already installed. Skipping CLI installation."
fi

# 3. Add the Bitnami repository (a popular source for reliable charts)
echo "Adding Bitnami Helm repository..."
helm repo add bitnami https://charts.bitnami.com/bitnami

# 4. Update your local Helm chart repository cache
echo "Updating Helm repositories..."
helm repo update

# 5. Install the Helm chart
# Syntax: helm install <release-name> <repo/chart-name>
RELEASE_NAME="my-web-server"
CHART_NAME="bitnami/nginx"

echo "Installing Helm chart: $CHART_NAME as release: $RELEASE_NAME..."
# We use --wait to pause the script until the pods are actually running
helm upgrade --install $RELEASE_NAME $CHART_NAME --wait

echo "Installation complete!"
