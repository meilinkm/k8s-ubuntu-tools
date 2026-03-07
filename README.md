# ubuntu-tools image

This repo contains the Docker Ubuntu image build & deployment. This is an updated Ubuntu image with some additional tools installed.

Additional tools:

netcat, wget, curl, nslookup

Using packages:

netcat-openbsd, wget, curl, dnsutils

The idea is to have this specialized Ubuntu image running in the cluster, so there's always a pod available, that can be exec'ed into, to run some tests.

To build:
```bash
docker build -t ubuntu-tools:24.04 .
docker tag ubuntu-tools:24.04 mmeilink/ubuntu-tools:24.04
docker login
docker push mmeilink/ubuntu-tools:24.04
```
This repo also contains a helm chart, that can be deployed manually or via ArgoCD, and is initialized with: 
```bash
mkdir k8s-ubuntu-tools
cd k8s-ubuntu-tools
helm create ubuntu-tools
mv ubuntu-tools helm
rm -rf helm/templates/*
```
Edit helm/Chart.yaml:
```Bash
apiVersion: v2
name: ubuntu-tools
description: A Helm chart for ubuntu-tools on Kubernetes
type: application
version: 0.1.0
appVersion: "24.04"
```
