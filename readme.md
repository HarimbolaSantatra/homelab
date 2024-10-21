# MY HOMELAB

> [!IMPORTANT]
`.tfvars`, `.tfstate` and `.tfstate.` must be ignored in production

## Kubernetes
*wip* (branch `k8s`)

## Simple web server for GNS3

    docker build -f webserver.Dockerfile -t harimbolasantatra/some-server .

To run it on external container (w/o gns3):

    docker run --rm --name some-server -d harimbolasantatra/some-server

## Database replication
### architecture

+-----------+               +------------+
|  MASTER   |               |   SLAVE    |
|           |-------------> |            |
|   host    |               |  LXD VM    |
+-----------+               +------------+

### Configuration
#### Initial configiration
Create the managed network:

    lxc network create replication ipv4.address="10.210.242.1/24"

Create and attach the VM, named `mariadb-1`:

    lxc launch ubuntu:22.04 mariadb-1 --vm
    lxc network attach replication mariadb-1 eth0

Enable ssh on the VM

    systemctl start ssh

Setup the master and the slave:

    ansible-playbook replication/replication.yaml -i inventory/replication.yaml
