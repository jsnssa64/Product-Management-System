
//  sets up docker information
provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}


//  Example of Secrets
provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region = "${var.AWS_REGION}"
}