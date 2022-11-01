# RA-CHALLENGE

The purpose of this repo is to build a demo infrastructure consisting of 2 folder. One is the src folder which provide source code of applications. The other one is infra folder which consist infra and system related files. 

## TL-DR
```
# for local development
cd src && sudo docker-compose up --build -d
# for minikube
minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=6g && kubectl apply -f infra/manifests
# for aws
terraform init && terraform apply -f autoapprove && aws eks update-kubeconfig --region eu-west-1 --name test-cluster && kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml && kubectl apply -f infra/manifests
```

# Table of contents

1. [Ra-Challenge](#ra-challenge)
    * [TL-DR](#tl-dr)
    * [Tech Stack](#tech-stack)
    * [Prerequisites](#prerequisites)
2. [Quick Start](#quick-start)
    * [Development](#development)
    * [Local Minikube](#local-minikube)
    * [AWS](#aws)

## Tech Stack

* [Ubuntu(20.04.2 LTS)](https://ubuntu.com/)

  Ubuntu 20.04.2 is used for all of the projects.Because it is easier to contact with cloud services with linux based systems.

* [Terraform-HCL(v1.3.3)](https://www.terraform.io/)

  Terraform is one of the most used IaC tools. It has made it easy to create infrastructure with its unique HCL (Hashicorp Configuration Language). Its modular structure, well-documented, well-explained module reference pages and compatibility with all major cloud providers are effective factors in choosing Terraform.

* [AWS(aws-cli/2.2.18)](https://aws.amazon.com/)

  AWS is the widely used cloud service founded by Amazon. All resources used for this demo are hosted on AWS.

## Prerequisites

* **Install AWS-cli** :

Aws-cli must be installed on the system. The quick install command for Linux is given below. For other operating systems, you can refer to the  [aws-cli documentation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html) 

  ```sh
  sudo apt update && apt install unzip -y && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && sudo unzip awscliv2.zip && sudo ./aws/install
  ```

* **Install Terraform**:

Terraform must be installed to the system for apply the configurations. <a href="https://learn.hashicorp.com/tutorials/terraform/install-cli">terraform documentation </a>.

  ```sh
  sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  sudo apt-get update && sudo apt-get install terraform -y
  ```


# Quick Start

## Development

1. Please be sure you have installed docker and docker-compose to your system

2. Go to src folder and start compose file

   ```sh
    cd src && sudo docker-compose up --build -d
   ```

3. Go to *localhost:80* and you will see the application is running

4. To destroy
   ```sh
   cd src && sudo docker-compose down
   ```
## Local Minikube

1. Please be sure you have installed minikube and kubectl to your system

2. Start minikube with following command

   ```sh
    minikube start --addons=ingress --cpus=2 --cni=flannel --install-addons=true --kubernetes-version=stable --memory=6g
   ```

3. Apply Manifests
   ```sh
    cd infra && kubectl apply -f manifests
   ```
4. Go to your minikube ip address with browser and you will see the application is running
5. You can get ingress address with following command and access that address
   ```sh
    kubectl get ing
   ```
6. You can get minikube address with following command and access that address
   ```sh
    minikube ip
   ```

7. To destroy
   ```sh
   minikube delete
   ```

## AWS

1. Please be sure you have installed awscli(a configured one) and terraform to your system. Also please be sure you have enough permisson to apply this project

2. Start terraform

   ```sh
    terraform init
   ```

3. Apply
   ```sh
    terraform apply --auto-approve
   ```
4. Wait until eks cluster to be created.(Approximately 15-20 mins)

5. Get kubectl access

   ```sh
    aws eks update-kubeconfig --region eu-west-1 --name test-cluster
   ```

6. Install nginx ingress controller
   ```sh
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml
   ```

7. you can get ingress address with following command and access that address
   ```sh
    kubectl get ing
   ```
8. To destroy
   ```sh
   terraform destroy
   ```