# 🚀 Terraform Projects – DevOps Practice

This repository contains two Terraform-based infrastructure projects designed to strengthen practical DevOps skills. Each project demonstrates essential Infrastructure as Code (IaC) concepts using AWS resources.

---

## 📁 Project Structure

```
Terraform/
├── project-1/
│   ├── Basic/                # EC2 + VPC + Provider setup
│   └── Remote-infra/         # S3 + DynamoDB for remote backend
├── project-2/
│   ├── infra-app/            # EC2, S3, DynamoDB
│   ├── main.tf               # Main entry for project-2
│   ├── providers.tf          # AWS Provider configuration
│   └── terraform.tf          # Terraform backend configuration
```

---

## 🔧 Prerequisites

- Terraform CLI (>= 1.0)
- AWS CLI configured with appropriate IAM permissions
- AWS account with access to create EC2, S3, and DynamoDB

---

## 📌 Project 1 Details

### 🔹 Basic Setup
Location: `project-1/Basic/`

Resources:
- EC2 Instance
- VPC configuration
- Variables & outputs

### 🔹 Remote Backend Setup
Location: `project-1/Remote-infra/`

Resources:
- S3 bucket (for storing Terraform state)
- DynamoDB table (for state locking)

---

## 📌 Project 2 Details

Location: `project-2/`

Resources:
- EC2 instance
- S3 bucket
- DynamoDB table
- Centralized configuration using `main.tf`, `providers.tf`

---

## ⚙️ How to Use

1. **Initialize Terraform**  
```bash
terraform init
```

2. **Plan the changes**  
```bash
terraform plan
```

3. **Apply configuration**  
```bash
terraform apply
```

---

## 📁 Git Best Practices

Make sure to use a `.gitignore` file to prevent sensitive or large files from being committed:

```
*.tfstate
*.tfstate.backup
.terraform/
*.log
*terra-key*
crash.log
```

---

## 📌 Notes

- Do **not** upload `.terraform/` or state files to GitHub.
- All keys and secrets must be handled securely using environment variables or secret managers.

---

## 📬 Author

This project was developed for hands-on DevOps practice with Terraform on AWS.
