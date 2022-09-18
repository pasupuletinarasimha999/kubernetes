#!/bin/bash
kubectl apply -f Cert.yml
cd ..
cd Dashboard
kubectl apply -f Kubernetes-Dashboard.yml
kubectl apply -f Serviceaccount.yaml
kubectl apply -f ingress.yaml
kubectl apply -f cert.yaml
echo Please use URL https://dashboard.narasimhakubernetes.xyz/ to access the Kubernetes dashboard
cd ..
cd elastic-kibana
for i in 'kubectl get node | cut -d '' -f 1 |grep internal' ; do kubectl label nodes ${i} beta.kubernetes.io/fluentd-ds-ready=true ; done
kubectl apply -f storage.yml
kubectl apply -f kibana-service.yaml
kubectl apply -f kibana-deployment.yaml
kubectl apply -f fluentd-es-ds.yaml
kubectl apply -f fluentd-es-configmap.yaml
kubectl apply -f es-service.yaml
kubectl apply -f es-statefulset.yaml
kubectl apply -f ingress.yaml
echo Please use URL https://sample.narasimhakubernetes.xyz/kibana to access the Kibana dashboard