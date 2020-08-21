aws eks --region us-east-1 update-kubeconfig --name prod
arn=$(aws eks describe-cluster --name prod | grep -Po '"arn": *\K"[^"]*"' | sed 's/"//g')
kubectl config use-context $arn
kubectl apply -f deployment.yaml
