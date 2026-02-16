terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

module "nginx_cluster" {
  source = "./modules/container_cluster"

  image_name       = "nginx:latest"
  container_memory = 512
  is_privileged    = false
  container_count  = 3
  starting_port    = 3000
}