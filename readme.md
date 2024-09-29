# MY HOMELAB

> [!IMPORTANT]
`.tfvars`, `.tfstate` and `.tfstate.` must be ignored in production

## Kubernetes

# Kubernetes Labs

The `main.tf` provision the local machine with 2 VM:

| VM | Purpose | IP | RAM 
| --- | --- | --- | ---
| controlplane | Control plane | (host) | (host)
| node1 | Workter node | | 1GB
| loadbalancer | LoadBalancer | 512

## Simple web server for GNS3

    docker build -f webserver.Dockerfile -t harimbolasantatra/some-server .

To run it on external container (w/o gns3):

    docker run --rm --name some-server -d harimbolasantatra/some-server

## Database replication
*wip* (branch `replication`)
