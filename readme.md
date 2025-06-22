# MY HOMELAB

> [!IMPORTANT]
`.tfvars`, `.tfstate` and `.tfstate.` must be ignored in production

Directory layout:
- `kubernetes`
- `replication`: database replication
- `webserver`: html files for testing a webserver

## Kubernetes

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

## SSH Container
[Dockerfile for SSH server](ssh.Dockerfile) is from [this Circle CI blog post](https://circleci.com/blog/ssh-into-docker-container/).

Build and run the image:
```
docker build -f sshd.Dockerfile -t harimbolasantatra/sshd-image:latest .
docker run --rm -t -d --name sshd sshd-image:latest
```

To ssh into the container, use the [ipterm](https://gns3.com/marketplace/appliances/ipterm) appliance.
SSH password is `insecure_password`.
