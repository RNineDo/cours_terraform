terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "app_image" {
  name = var.image_name
}

resource "docker_container" "app_container" {
  count = var.container_count

  # Génère des noms dynamiques : my-app-0, my-app-1...
  name  = "my-app-${count.index}"
  image = docker_image.app_image.image_id
  
  memory     = var.container_memory
  privileged = var.is_privileged

  ports {
    internal = 80
    # Calcul dynamique du port : 3000, 3001, 3002...
    external = var.starting_port + count.index
  }
}