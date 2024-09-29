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

# Instance for demonstration. It uses remote "test".
resource "lxd_instance" "self" {
  name   = "self"
  image  = "images:alpine/edge"
  remote = "test"
}
