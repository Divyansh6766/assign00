# Python CRUD Application with Docker,Terraform,Git,Githubaction and kubernetes

This project demonstrates a Python-based CRUD (Create, Read, Update, Delete) application using FastAPI as the backend framework. The application uses a PostgreSQL database for data storage and is fully dockerized. Infrastructure as Code (IaC) is implemented using Terraform to provision a Kubernetes cluster, where the application is deployed using Helm charts. CI/CD pipelines are configured with GitHub Actions for continuous integration and deployment..

**Project Overview**
**Backend**: Python (FastAPI)
**Database**: PostgreSQL
**VersionControl**: Git
**Docker**: For containerization
**CI**: GitHub Actions for continuous integration
**IaC**: Terraform
**Deployment**: Kubernetes with Helm

## Features
- **CRUD Operations:** Create, Read, Update, and Delete operations on the database.
- **Dockerized:** Application and database run as containers using Docker.
- **CI Pipeline:** Automatically builds and pushes the Docker image to Docker Hub when code is pushed to the `main` branch.
- **Terraform** Provision a Kubernetes cluster, ideally leveraging Infrastructure as Code (IaC) tools like Terraform, to automate the setup and management of the infrastructure.
- **githubactions** Configure a CI pipeline using GitHub Actions to automatically build and push a Docker image whenever code is committed to the `main` branch.
- **Kubernetes:** Backend application deployed on a Kubernetes cluster using Helm.

## Prerequisites

Before you begin, make sure you have the following installed:

- **Docker**: For building and running Docker containers.  
  - Install: [Docker](https://www.docker.com/get-started).  

- **Docker Compose**: To manage multi-container applications locally.  
  - Install: [Docker Compose](https://docs.docker.com/compose/install/).  

- **Kubernetes**: A Kubernetes cluster (local or cloud-based).  
  - Install Kubernetes tools:  
    - **Minikube**: [Minikube](https://minikube.sigs.k8s.io/docs/).  
    - **kubectl**: [kubectl](https://kubernetes.io/docs/tasks/tools/).  

- **Helm**: A Kubernetes package manager to deploy applications easily.  
  - Install: [Helm](https://helm.sh/docs/intro/install/).  

- **GitHub Actions**: A CI/CD service provided by GitHub (no installation needed, works directly with your GitHub repo).  

- **FastAPI**: A modern Python web framework for building APIs.  
  - Install: `pip install fastapi` and `pip install uvicorn`.  

- **Terraform**: An Infrastructure as Code (IaC) tool for provisioning infrastructure.  
  - Install: [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).  

## Setup Instructions

1. **Clone the Repository**
2. **Create CRUD operation with FASTapi and database postgressql**
3. **Build and Run with Docker Comp**
4  **Build CI Pipeline with GitHub Actions save image on dockerhub**
5  **Provision Kubernetes Cluster with Terraform**
6  **Deploy Application with Helm**


