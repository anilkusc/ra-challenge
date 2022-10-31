minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=6g
kubectl apply -f manifests
kubectl patch deployment ingress-nginx-controller --patch '{"spec":{"template":{"spec":{"containers":[{"name":"controller","ports":[{"containerPort":5000,"hostPort":5000}]}]}}}}' -n ingress-nginx
