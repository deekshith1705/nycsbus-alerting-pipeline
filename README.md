# NYCSBUS Alerting Pipeline (Take-Home Project) 

This project provisions a serverless alerting pipeline on AWS using Terraform. It ingests bus breakdown events via API Gateway, authenticates users through Cognito, stores events in S3 and DynamoDB, and sends high-priority alerts using SNS and CloudWatch.

---

## 📌 Architecture Overview

**Data Flow:**

1. 🚍 Incoming event → API Gateway (POST)
2. 🔐 User authenticated with Cognito
3. 🧠 Lambda processes event
4. 🪣 Event stored in S3
5. 🗂️ Event metadata stored in DynamoDB
6. 📈 CloudWatch monitors critical conditions
7. 🚨 SNS sends alerts for high-priority events

**AWS Services Used:**

- API Gateway
- Cognito User Pool + Client + Domain
- Lambda (Python)
- S3
- DynamoDB
- SNS + Email Subscription
- CloudWatch Metric Alarm

---

## ⚙️ Setup Instructions

### Prerequisites

- AWS CLI installed and configured
- Terraform CLI (v1.6.6 or higher)
- GitHub repo with secrets configured:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

### Local Steps

```bash
git clone https://github.com/<your-username>/nycsbus-alerting-pipeline.git
cd nycsbus-alerting-pipeline
terraform init
terraform apply -var-file="terraform.tfvars"

# Redeploy
# Redeploy
# Redeploy
# Redeploy
