terraform {
  backend "s3" {
    bucket         = "infrastructure-as-code-tfstate-264513617683"
    key            = "proxmox/environments/prod/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "infrastructure-as-code-locks"
    encrypt        = true
  }
}
