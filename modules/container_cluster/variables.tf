variable "image_name" {
  description = "Nom de l'image Docker"
  type        = string
}

variable "container_memory" {
  description = "Mémoire en MB (Min 64MB)"
  type        = number
  validation {
    condition     = var.container_memory >= 64
    error_message = "La mémoire allouée doit être d'au moins 64 MB."
  }
}

variable "is_privileged" {
  description = "Mode privilégié"
  type        = bool
}

variable "container_count" {
  description = "Nombre de conteneurs (1 à 10)"
  type        = number
  validation {
    condition     = var.container_count > 0 && var.container_count <= 10
    error_message = "Vous devez créer entre 1 et 10 conteneurs."
  }
}

variable "starting_port" {
  description = "Port de départ (1024-65535)"
  type        = number
  validation {
    condition     = var.starting_port >= 1024 && var.starting_port <= 65535
    error_message = "Le port doit être compris entre 1024 et 65535 (ports non-privilégiés)."
  }
}