# Onboarding Infra As Code

Terraform configurations for managing AWS infrastructure of the Onboarding project. Includes a CLI to simplify applying changes across environments, streamlining infrastructure management.

## Getting Started

Install the follwing tools:

- Install Terraform
- Install Nodejs 22
- Install Yarn 1.22.22 
- Install AWS CLI

### Configure AWS profile

https://github.com/Stamper-Labs/base-infra?tab=readme-ov-file#configure-aws-profile

### Create The Terraform State Folder 

- Make sure the terraform state configuration for the base infrastructure project is set up:

  https://github.com/Stamper-Labs/base-infra?tab=readme-ov-file#setup-the-terraform-state

- Then create the state folder key

  ```bash
  aws --profile stamper-prod s3api put-object \
  --bucket stamper-labs-tfstate-bucket \
  --key standard-ob/stg
  ```

### Setup Remote Backends

- Create a remote backend configuration for a specific environment (e.g., stg):

  ```bash
  mkdir -p ./envs/stg
  cd ./envs/stg
  touch backend.tf
  ```

- Add the following to `backend.tf`:

  ```hcl
  terraform {
    backend "s3" {
      bucket         = "stamper-labs-tfstate-bucket"        
      key            = "standard-ob/stg/terraform.tfstate"
      region         = "us-east-1"                      
      encrypt        = true                                
      dynamodb_table = "stamper-labs-tfstate-locks"
    }
  }
  ```