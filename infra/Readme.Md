```
# for deploy to minikube
minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=6g
kubectl apply -f manifests

# for deploy to aws
terraform init
terraform apply --auto-approve
aws eks update-kubeconfig --region eu-west-1 --name test-cluster
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml
kubectl apply -f manifests
```