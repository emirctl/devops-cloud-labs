# Terraform Initialization & VPC Provisioning

## Overview

This repository demonstrates provisioning a basic Amazon VPC using Terraform.  

The project focuses on:  

- Terraform initialization  
- AWS provider configuration  
- Basic VPC resource creation  
- Terraform workflow (init → plan → apply → destroy)  

---

## Requirements

- Terraform (>= 1.3.0)
- AWS CLI configured
- Valid AWS credentials

---

## Clone the Repository

```bash
git clone https://github.com/emirctl/devops-lab.git
cd terraform-labs/01-basic-init-vpc
```

---


## Repository Structure
main.tf              -> Provider and VPC definition
terraform.tfstate    -> Local state file (generated after apply)
.terraform/          -> Provider plugins (generated after init)


---

## Initialize Terraform

Download required providers:
```bash
terraform init
```

## Plan

Preview infrastructure changes:
```bash
terraform plan
```


## Apply

Create the vpc:
```bash
terraform apply
```

Type yes when prompted


## Verify

Go to AWS Console → VPC → Your VPCs

You should see:

CIDR: 10.0.0.0/16

Name: basic-vpc


## Destroy

Remove (terminate) created infrastructure:
```bash
terraform destory
```




