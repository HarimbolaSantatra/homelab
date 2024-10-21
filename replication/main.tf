terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "lxd" {
}

resource "lxd_instance" "slave1" {
  name  = "slave1"
  ubuntu = "ubuntu-daily:22.04"
  limits = {
    cpu = 1
  }
}
