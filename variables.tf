# Variable declarations
variable "nginxs_configurations" {
  description = "Map of nginx's configurations."
  type        = map
  default     = {
    nginx-1 = {
      image_name = "nginx"
      image_version = "latest"
      internal_port = 80
      external_port = 8000
    },
    nginx-2 = {
      image_name = "nginx"
      image_version = "alpine"
      internal_port = 80
      external_port = 8001
    },
    nginx-3 = {
      image_name = "nginx"
      image_version = "stable"
      internal_port = 80
      external_port = 8002
    }
  }
}