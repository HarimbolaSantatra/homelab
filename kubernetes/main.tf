provider "lxd" {
  accept_remote_certificate = true

  remote {
    name    = "test"
    address = "localhost"
    port    = "8443"
    scheme  = "https"
    password = "test123"
  }

}

resource "lxd_instance" "instance1" {
  name  = "instance1"
  image = "ubuntu-daily:22.04"

  config = {
    "boot.autostart" = true
  }

  limits = {
    cpu = 2
  }
}
