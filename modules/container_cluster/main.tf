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
  name  = "node-${count.index}"
  image = docker_image.app_image.image_id
  
  memory     = var.container_memory
  privileged = var.is_privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }

  # Injection de la page d'accueil personnalisée
  upload {
    content = <<EOF
<html>
  <head><title>Terraform Lab</title></head>
  <body>
    <h1>Bienvenue sur le conteneur : node-${count.index}</h1>
    <p>Ce serveur Nginx a été déployé via Terraform.</p>
  </body>
</html>
EOF
    file    = "/usr/share/nginx/html/index.html"
  }
}