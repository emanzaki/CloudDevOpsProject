# FortStak Internship Assessment  - – Todo List Node.js App

This repository contains the completed DevOps assessment tasks based on a Node.js Todo List application. The tasks are divided into multiple parts covering containerization, CI/CD, infrastructure automation, configuration management, and Kubernetes deployment.

## 🧩 Project Structure

```bash
├── Ansible/ # Ansible playbooks and configs to automate EC2 setup
├── Dockerfile # Dockerfile to containerize the application
├── k8s/ # Kubernetes manifests and Kustomize setup
├── server-info/ # EC2 key and inventory files
├── Terraform/ # Infrastructure as Code setup for AWS resources
└── Todo-List-nodejs #our app
```

---

## ✅ Part 1 – Dockerization & CI with GitHub Actions (30 pts)

- **Cloned**: [Todo-List-nodejs](https://github.com/Ankit6098/Todo-List-nodejs)
- **Dockerized**: Created a `Dockerfile` to containerize the Node.js application.
- **GitHub Actions**: Set up a CI workflow to build and push the Docker image to Docker Hub on every push to the `main` branch. The CI will be triggered only for [Todo-List-nodejs](./Todo-List-nodejs) folder and [Dockerfile](./Dockerfile).

## ☁️ Part 2 – Infrastructure Provisioning with Terraform 

Terraform is used to provision AWS infrastructure:

- **EC2 Instances**: Provisioned EC2 instances in the public subnet.

- **Security Group**: Configured security groups to allow necessary traffic (HTTP, SSH).

- **Key Pair**: Created an EC2 key pair for SSH access.

## 🛠️ Part 3 – Configuration Management with Ansible 

- **Ansible Playbooks**: Developed Ansible playbooks to automate the installation and configuration of the application on the EC2 instances.

- **Inventory Management**: Managed Dynamic inventory to define the target host on AWS for Ansible automation.

- **Provisioning**: Used Ansible to provision the application environment, ensuring consistency across instances.

- **Application Setup**: Automated the installation and configuration of the application stack, including:

  - **Docker**: Installed Docker and configured it to run the application containers.
  - **Minikube**: Set up Minikube for local Kubernetes development.
  - **Apache**: Configured Apache to reverse proxy EC2’s port to the Minikube service port.
  - **Argo CD**: Installed and configured Argo CD for continuous deployment.

- **Argo CD Image Updater**: Installs and configures Argo CD Image Updater