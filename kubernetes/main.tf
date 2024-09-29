provider "lxd" {
  accept_remote_certificate = true

  remote {
    name    = "local"
    address = "127.0.0.1"
    port    = "8443"
    scheme  = "https"
    token   = var.lxc_token
  }

}

resource "lxd_network" "cluster_network" {
  name = "cluster_network"

  config = {
    "ipv4.address" = "10.150.19.1/24"
    "ipv4.nat"     = "true"
    "ipv6.address" = "fd42:474b:622d:259d::1/64"
    "ipv6.nat"     = "true"
  }
}

resource "lxd_instance" "node1" {
  name  = "node1"
  image = "ubuntu:22.04"
  type  = "virtual-machine"

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype = "bridged"
      network  = "${lxd_network.cluster_network.name}"
    }
  }

  limits = {
    memory = "1GiB"
  }

}
