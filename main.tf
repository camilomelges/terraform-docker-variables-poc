terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  for_each = var.nginxs_configurations
  name         = "${each.value.image_name}:${each.value.image_version}"
  keep_locally = false # Run "docker rmi ${each.value.image_name}:${each.value.image_version}" when terraform destroy command run.
}

resource "docker_container" "nginx" {
  for_each = var.nginxs_configurations
  image = docker_image.nginx[each.key].name # Use the name of image from resource docker_image above, passing the key of nginxs_configurations to get correct version.
  name  = "${each.value.image_name}-${each.value.image_version}" # Will be the name of image and version with "-" among them, will be the same version of resource docker_image above respectivally.
  ports {
    internal = each.value.internal_port
    external = each.value.external_port
  }
}
