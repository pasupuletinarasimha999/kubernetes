#!/bin/bash
kubectl apply -f Cert.yml
cd ..
cd Dashboard
kubectl apply -f Kubernetes-Dashboard.yml
kubectl apply -f Serviceaccount.yaml
kubectl apply -f ingress.yaml
kubectl apply -f cert.yaml