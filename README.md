# AWS Cross-Region VPC Peering Using Terraform

## 📌 Project Overview

This project demonstrates the provisioning of AWS networking infrastructure and the establishment of a cross-region VPC Peering connection using **Terraform**.

The solution connects two Amazon Virtual Private Clouds (VPCs) deployed in different AWS regions, enabling private communication between resources using their private IP addresses.

The infrastructure is managed as code (IaC), making it repeatable, maintainable, and easier to version-control.

## 🎯 Objectives

- Provision two VPCs in separate AWS regions.
- Configure non-overlapping CIDR blocks and subnets.
- Establish a cross-region VPC Peering connection.
- Configure route tables to enable private network communication.
- Validate the peering connection using AWS CLI.
- Manage infrastructure using Terraform.

## 🏗️ Architecture

The project uses two VPCs:

| Component | Primary VPC | Secondary VPC |
|---|---|---|
| AWS Region | `us-east-1` | `us-west-2` |
| VPC CIDR | `10.0.0.0/16` | `10.1.0.0/16` |
| Subnet CIDR | `10.0.1.0/24` | `10.1.1.0/24` |
| Example EC2 private IP | `10.0.1.84` | `10.1.1.103` |

### Architecture Flow

Primary VPC (`us-east-1`)  
`10.0.0.0/16`

⬇️ Cross-Region VPC Peering

Secondary VPC (`us-west-2`)  
`10.1.0.0/16`

## 🛠️ Technologies Used

- **Amazon Web Services (AWS)**
  - Amazon VPC
  - VPC Peering
  - Amazon EC2
  - Route Tables
  - Security Groups
- **Terraform** — Infrastructure as Code
- **AWS CLI** — Infrastructure verification
- **Git and GitHub** — Version control

## ⚙️ Prerequisites

Before deploying this project, ensure you have:

- An AWS account with appropriate IAM permissions.
- Terraform installed.
- AWS CLI installed and configured.
- An SSH key pair available in each required AWS region.
- Git installed.
- An understanding of VPCs, CIDR blocks, routing, and security groups.

## 🚀 Deployment Guide


### 1. Configure Variables

Update your `terraform.tfvars` file with the required configuration:

```hcl
primary_region   = "us-east-1"
secondary_region = "us-west-2"

primary_vpc_cidr   = "10.0.0.0/16"
secondary_vpc_cidr = "10.1.0.0/16"

primary_subnet_cidr   = "10.0.1.0/24"
secondary_subnet_cidr = "10.1.1.0/24"

instance_type = "t3.micro"

primary_key_name   = "vpc-peering-demo-east"
secondary_key_name = "vpc-peering-demo-west"
```

Keep sensitive or environment-specific variable files out of version control.

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Validate the Configuration

```bash
terraform fmt -recursive
terraform validate
```

### 4. Review the Execution Plan

```bash
terraform plan
```

### 5. Deploy the Infrastructure

```bash
terraform apply
```

Review the plan and confirm the deployment when prompted.

> Note: The commands above assume the Terraform configuration is in the repository root. If the configuration uses separate directories or Terraform workspaces, run the commands from the appropriate location.

## 🔗 VPC Peering Configuration

After the peering connection is created and accepted, configure the relevant route tables.

**Primary VPC route:**

| Destination | Target |
|---|---|
| `10.1.0.0/16` | VPC Peering connection |

**Secondary VPC route:**

| Destination | Target |
|---|---|
| `10.0.0.0/16` | VPC Peering connection |

Ensure that the security groups and network ACLs allow the intended traffic.


Check route tables and test private connectivity between EC2 instances where ICMP traffic is permitted.

Example:

```bash
ping 10.1.1.103
```

Successful connectivity depends on correct routes, security rules, and instance availability.

## 🔐 Security Best Practices

- Never commit AWS access keys, private keys, or credentials.
- Exclude Terraform state files and sensitive variable files from Git.
- Use least-privilege IAM permissions.
- Restrict security group rules to required traffic only.
- Use encrypted remote state storage with appropriate access controls when using a remote backend.
- Review infrastructure changes before applying them.

## 📚 Key Learnings

- Infrastructure provisioning using Terraform.
- AWS networking across multiple regions.
- VPC Peering and private IP connectivity.
- Route table configuration and traffic flow.
- AWS CLI-based infrastructure verification.
- Infrastructure version control using Git and GitHub.

## 👩‍💻 Author

**Sakshi Repale**

Aspiring AWS & DevOps Engineer

---

*This project was developed for hands-on learning and practical exploration of AWS networking and Infrastructure as Code.*
