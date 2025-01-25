terraform {
  backend "s3" {
    endpoint                    = "nyc3.digitaloceanspaces.com"
    key                         = "terraform.tfstate"
    bucket                      = "your-do-space-name"
    region                      = "us-east-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
