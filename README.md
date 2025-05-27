# Onboarding Infra As Code

Terraform configurations for managing AWS infrastructure of the Onboarding project. Includes a CLI to simplify applying changes across environments, streamlining infrastructure management.

## Getting Started

###  Install the follwing tools:

* AWS CLI
* Terraform

### Configure AWS profile

### Create The Terraform State Folder
Create a bucket location for the repositories to store the terraform state file, the example below is for staging environment:

```bash
aws --profile stamper-prod s3api put-object \
--bucket stamper-labs-tfstate-bucket \
--key standard-ob/stg
```

### Setup Remote Backends

Create a remote backend configuration for a specific environment (e.g., stg):

```bash
mkdir -p ./envs/stg
cd ./envs/stg
touch backend.tf
```

Add the following to backend.tf:

```hcl
terraform {
  backend "s3" {
    bucket         = "stamperlabs-tfstate-bucket"        # S3 bucket name
    key            = "standard-ob/stg/terraform.tfstate" # Path to the state file in the bucket
    region         = "us-east-1"                         # AWS region
    encrypt        = true                                # Encrypt the state file
    dynamodb_table = "stamperlabs-tfstate-locks"         # DynamoDB table for state locking
  }
}
```