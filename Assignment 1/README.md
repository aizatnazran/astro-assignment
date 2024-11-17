# Terraform + LocalStack for AWS 3-Tier Application

This project provisions a 3-tier application infrastructure in AWS using **Terraform** and **LocalStack**. LocalStack is used to simulate AWS services locally for development and testing.

---

## Prerequisites

Before starting, ensure the following tools are installed on your system:

1. **Git** - [Install Git](https://git-scm.com/downloads)
2. **Docker** - [Install Docker](https://www.docker.com/)
3. **Terraform** - [Install Terraform](https://www.terraform.io/downloads.html)

---

## Steps to Run the Project

### 1. Clone the Repository

Clone this repository to your local system:

```bash
git clone <repository-url>
cd <repository-folder>
```

### 2. Pull the LocalStack Docker Image

Pull the LocalStack image to simulate AWS services:

```bash
docker pull localstack/localstack
```

### 3. Run the LocalStack Container

Start LocalStack as a container with the required services:

```bash
docker run -d -e SERVICES=ec2,iam,s3,rds,elbv2,autoscaling,cloudwatch,route53 -p 4566:4566 -p 4571:4571 localstack/localstack
```

### 4. Configure Dummy AWS Credentials

Since Terraform requires AWS credentials, even when using LocalStack, you need to set dummy environment variables. Run the following commands:

For Windows (PowerShell)

```bash
$env:AWS_ACCESS_KEY_ID = "test"
$env:AWS_SECRET_ACCESS_KEY = "test"
$env:AWS_REGION = "us-east-1"
```

For Linux/MacOS

```bash
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_REGION="us-east-1"
```

### 5. Initialize Terraform

Once the LocalStack container is running, initialize Terraform

```bash
terraform init
```

### 6. Apply the Terraform Configuration

Deploy the infrastructure to LocalStack by applying the Terraform configuration:

```bash
terraform apply
```

Terraform will display a plan for the infrastructure. Type yes to proceed with provisioning.

## Delivery Outcomes

You may view the [delivery_outcomes.md](./delivery_outcomes.md) file for the delivery outcomes of this assignment.
