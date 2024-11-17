provider "aws" {
  region                      = "us-east-1" 
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # LocalStack endpoints
  endpoints {
    ec2            = "http://localhost:4566"
    iam            = "http://localhost:4566"
    s3             = "http://localhost:4566"
    rds            = "http://localhost:4566"
    elbv2          = "http://localhost:4566"
    autoscaling    = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    route53        = "http://localhost:4566"
  }
}
