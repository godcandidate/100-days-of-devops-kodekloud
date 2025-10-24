# Terraform Challenges

Welcome to the Terraform Challenges series! This repository contains various hands-on tasks designed to help you practice and master Terraform with different cloud and Kubernetes resources.

## Overview

In this challenge series, you will:
- Write Terraform configurations to create and manage cloud infrastructure.
- Deploy Kubernetes resources using Terraform.
- Incrementally build infrastructure step-by-step.
- Learn best practices for modular and manageable Terraform code.

## How to Use

Navigate to the working directory

- Most challenges will specify a Terraform working directory (e.g. challenge-1).
- Write your Terraform configuration
- Create or update .tf files as per the challenge requirements.
- Initialize Terraform
```
terraform init
```

- Apply your Terraform configuration
```
terraform apply
```
- Review the plan and confirm to apply changes.


## Tips
- Always specify provider versions for consistency.
- Use clear and meaningful resource names and labels.
- Read challenge instructions carefully and break down tasks into manageable steps.
- Keep your Terraform code organized and modular.
- Use terraform fmt to format your code for readability.

## Requirements
- Terraform CLI installed (version as specified by challenge).
```
wget https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip

unzip terraform_1.1.5_linux_amd64.zip

mv terraform /usr/local/bin/

chmod +x /usr/local/bin/terraform
```
- Access to relevant cloud accounts or Kubernetes clusters.
- Properly configured authentication (e.g., kubeconfig for Kubernetes)