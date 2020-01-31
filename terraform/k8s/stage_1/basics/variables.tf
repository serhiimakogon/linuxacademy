variable "env" {
  description = "env: dev or prod"
}

#Define variables
variable "image_name" {
  type = "map"
  description = "Image for container."
  default    = {
    prod =  "ghost:alpine"
    dev = "ghost:latest"
  }
}

variable "container_name" {
  type = "map"
  description = "Name of the container."
  default    = {
    prod = "blog_prod"
    dev = "blog_dev"
  }
}

variable "ext_port" {
  type = "map"
  description = "External port for container."
  default     = {
    prod = "80"
    dev = "8080"
  }
}
