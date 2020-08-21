aws eks --region us-east-1 update-kubeconfig --name website
arn=$(aws eks describe-cluster --name website | grep -Po '"arn": *\K"[^"]*"' | sed 's/"//g')
kubectl config use-context $arn
kubectl get svc
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl apply -f service.yaml
kubectl get services
kubectl get pods -o wide
