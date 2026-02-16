variable "image_name" {
  description = "Nom de l'image Docker à utiliser"
  type        = string
}

variable "container_memory" {
  description = "Limite de mémoire pour chaque conteneur (en MB)"
  type        = number
}

variable "is_privileged" {
  description = "Définit si le conteneur doit être en mode privilégié"
  type        = bool
}

variable "container_count" {
  description = "Nombre de conteneurs à générer"
  type        = number
}

variable "starting_port" {
  description = "Le port externe du premier conteneur (ex: 3000)"
  type        = number
}