terraform {
  backend "s3" {
    bucket         = "stamper-labs-tfstate-bucket"        
    key            = "standard-ob/stg/terraform.tfstate"
    region         = "us-east-1"                      
    encrypt        = true                                
    dynamodb_table = "stamper-labs-tfstate-locks"
  }
}
