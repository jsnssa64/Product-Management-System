terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "jsousacorp"
    workspaces {
      name = "product-management-system"
    }
  }
}