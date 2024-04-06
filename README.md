# Sportbet Web Server 
### This project automates the deployment of a web server on AWS, using ECR for Docker image storage, ECS for container orchestration, and an ALB to distribute incoming traffic.
##### address(ALB address) : web-server-lb-554520167.us-east-1.elb.amazonaws.com

    From terminal: curl web-server-lb-554520167.us-east-1.elb.amazonaws.com 

### Prerequisites
###### 1. AWS ACCOUNT
###### 2. AWS CLI
###### 3. Terraform
###### 4. Docker
###### 5. GitHub Account
###### 6. Git



 ### Terraform State Management:
        The project uses Terraform for infrastructure as code management. 
        The Terraform state file is stored remotely in an Amazon S3 bucket
        State File Location:

#### Bucket: sportbet-tf-state
#### Key: sportbet-web-server/terraform.state
#### Region: us-east-1


### CI/CD Pipeline

    CI: On each push, the Docker image is built and pushed to Amazon ECR using GitHub Actions.
    Secrets stored in the repository settings, such as AWS credentials, are used to authenticate against AWS services.

    Continuous Deployment (CD): A successful CI triggers another GitHub Action workflow via a repository dispatch event, 
    deploying the updated Docker image on ECS via Terraform, the Terraform depends on the parameter DOCKER_IMAGE_TAG. 
            terraform plan -var="docker_image_tag=${{ env.DOCKER_IMAGE_TAG }}" -out=tfplan

    This automated pipeline ensures the latest changes are always deployed to the production environment.


### Security Group Rules

    Ingress: Allows HTTP traffic (port 80) from any source (0.0.0.0/0).
    Egress: Permits all outbound traffic.
    Network Configuration
    The application is deployed in public subnets, enabling direct internet access. This approach simplifies architecture while adhering to AWS best practices by utilizing ALB for traffic management.

### Accessibility
    Deployed within public subnets and accessible via a public IP address, the ALB ensures the web server is reachable from the internet, providing high availability and fault tolerance.

### Deployment Region
    The infrastructure is provisioned in the us-east-1 (N. Virginia) AWS region, leveraging Terraform for infrastructure as code (IaC) to ensure consistency and reproducibility.

### Authentication and Security
    Repository Secrets: AWS credentials and other sensitive information are securely stored as GitHub repository secrets, isolating and protecting access.
    Access Control: The repository's GitHub Actions are configured to run in the context of the repository owner, using a personal access token for inter-workflow communication.

## Step-by-Step Deployment Guide

##### Clone the Repository:
###### git clone https://github.com/adiIsrael/sportbet-web-server.git

##### Configure AWS Credentials::
###### aws configure

##### Change you code  and push
    git add .
    git commit -m "Your commit message"
    git push 

###### terraform init (automated with github actions)

###### terraform plan -var="docker_image_tag=${DOCKER_IMAGE_TAG}" -out=tfplan (DOCKER_IMAGE_TAG, env var - github actions)

###### terraform apply "tfplan" (automated in github actions)

#### Access the Web Server: 

###### curl web-server-lb-554520167.us-east-1.elb.amazonaws.com

#### Clean Up Resources:

###### terraform destroy


