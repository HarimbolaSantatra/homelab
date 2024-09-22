terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "mariadb" {
  name = "mariadb:lts"
}

resource "docker_container" "master" {
  image = docker_image.mariadb.image_id
  name  = "master"
}

resource "docker_container" "slave1" {
  image = docker_image.mariadb.image_id
  name  = "slave1"
}

resource "docker_container" "slave2" {
  image = docker_image.mariadb.image_id
  name  = "slave2"
}
