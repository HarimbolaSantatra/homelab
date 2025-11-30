terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.0"
    }
  }
}

provider "docker" {
  host = "ssh://santatra@santatra.x45vd:22"
}

# Pulls the image
resource "docker_image" "gitlab" {
  name = "gitlab/gitlab-ce:18.5.3-ce.0"
}

# Create a container
resource "docker_container" "gitlab" {
  image    = docker_image.gitlab.image_id
  name     = "gitlab"
  restart  = "always"
  hostname = "santatra.x45vd"
  env      = ["GITLAB_OMNIBUS_CONFIG=external_url 'http://santatra.x45vd'"]
  shm_size = 256

  ports {
    internal = 80
    external = 8480
  }
  ports {
    internal = 443
    external = 8443
  }
  ports {
    internal = 22
    external = 8422
  }

  volumes {
    host_path      = "${var.gitlab_home}/config"
    container_path = "/etc/gitlab"
  }

  volumes {
    host_path      = "${var.gitlab_home}/logs"
    container_path = "/var/log/gitlab"
  }

  volumes {
    host_path      = "${var.gitlab_home}/data"
    container_path = "/var/opt/gitlab"
  }

}
