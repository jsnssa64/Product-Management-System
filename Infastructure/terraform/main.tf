terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.0"
    }
  }
}

//  sets up docker information
provider "docker" {
  host    = "npipe:////.//pipe//docker_engine"
}

//  Creates Image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

//  Runs COntainer using above image
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "ProductManagerTest"
  ports {
    internal = 80
    external = 8000
  }
}