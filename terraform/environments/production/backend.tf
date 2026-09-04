terraform {
  backend "s3" {
    bucket       = "my-tfstate-indira"
    key          = "eks-poc/production/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
    encrypt      = true
  }
}