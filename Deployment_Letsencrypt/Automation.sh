#!/bin/bash
kubectl create namespace myspace
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.0/deploy/static/provider/cloud/deploy.yaml
NODENAME=$(kubectl get nodes | grep -w "node" | sed -n 1p | awk '{print $1;}')
kubectl label node $NODENAME app=deploy1
kubectl taint nodes $NODENAME type=specialnode:NoSchedule
kubectl create configmap deploy1-volume --from-file=deploy1volume.conf=/home/ec2-user/kubernetes/Deployment_Letsencrypt/deploy1volume.conf -n myspace
kubectl apply -f deployment.yml
kubectl apply -f ingress.yml
sleep 300
LoadBalancer_Details=$(kubectl get svc -n ingress-nginx | grep -w "LoadBalancer" | awk '{print $4;}')
LoadBalancer_IP=$(nslookup $LoadBalancer_Details| sed -n 6p | awk '{print $2;}')
echo $LoadBalancer_IP, Please add this IP in Azure DNS File