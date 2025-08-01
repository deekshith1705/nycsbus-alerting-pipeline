
# 🚌 NYCSBUS Alerting Pipeline

This project provisions a **serverless alerting pipeline** on AWS using Terraform. The system ingests bus breakdown events via an authenticated API, stores and processes them, and triggers alerts for critical events.

---

## 🗺️ Architecture Diagram & Data Flow

```

Client
|
\| POST /event (with token)
v
API Gateway
|
v
Cognito Authorizer ---> Cognito User Pool
|
v
Lambda (Python 3.13)
├── Write JSON to S3
├── Write metadata to DynamoDB
└── Evaluate alert condition
└─▶ SNS (Email)
└─▶ Email Subscriber

CloudWatch monitors errors & triggers alarm if needed

**<img width="1536" height="1024" alt="Serverless Pipeline for Bus Alerts" src="https://github.com/user-attachments/assets/b450a07a-f5ee-457d-a916-86530a64e2c1" />**
````

---

## ⚙️ Setup Instructions

### ✅ Prerequisites

- [Terraform v1.6.6+](https://developer.hashicorp.com/terraform/downloads)
- [AWS CLI v2.15+](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- GitHub repository with the following secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

### 🛠 Deployment

```bash
git clone https://github.com/<your-username>/nycsbus-alerting-pipeline.git
cd nycsbus-alerting-pipeline

# Initialize Terraform
terraform init

# Apply the infrastructure
terraform apply -var-file="terraform.tfvars"

# (Optional) Upload Lambda ZIP if automated upload fails
aws s3 cp lambda_code.zip s3://<bucket-name>/lambda_code.zip
terraform apply
````

---

## 🧠 Design Decisions

| Choice        | Reason                                                     |
| ------------- | ---------------------------------------------------------- |
| **Lambda**    | Scales easily, perfect for event-driven pipelines          |
| **S3**        | Durable and cheap object storage for full event payloads   |
| **DynamoDB**  | Fast key-based lookup, ideal for structured event metadata |
| **SNS**       | Decoupled alerting system with native email support        |
| **Cognito**   | Handles user auth securely without managing passwords      |
| **Terraform** | Manages reproducible infrastructure as code                |

**Assumptions:**

* Events contain priority metadata to filter high-priority alerts.
* Authenticated users are required to post events.

---

## 🚀 CI/CD Plan (GitHub Actions)

Here’s how the automated pipeline works:

| Stage          | Description                                                     |
| -------------- | --------------------------------------------------------------- |
| **Checkout**   | Pulls repo source code                                          |
| **Lint**       | (Optional) Validates Terraform syntax with `fmt` and `validate` |
| **Plan**       | Runs `terraform plan` and stores the plan file                  |
| **Upload ZIP** | Uploads `lambda_code.zip` to S3 bucket before apply             |
| **Apply**      | Deploys infrastructure to AWS                                   |
| **Envs**       | Uses GitHub `environment` for dev/prod; restricts deploy access |

**Prod deployment strategy:**
Use branch protection rules and environment approval gates in GitHub to restrict who can apply changes to `prod`.

---

## 🔧 Tools & Versions Used

| Tool                     | Version       | Notes                           |
| ------------------------ | ------------- | ------------------------------- |
| Terraform                | v1.6.6        | Used for infrastructure as code |
| AWS CLI                  | v2.15+        | For S3 uploads and manual ops   |
| GitHub Actions Runner    | ubuntu-latest | CI/CD environment               |
| Python (Lambda Runtime)  | 3.13          | Runtime for the Lambda function |
| AWS Provider (Terraform) | \~> 5.0       | Terraform AWS plugin            |
| Bash                     | 5.x           | Used in GitHub Actions scripts  |
