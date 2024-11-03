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
*wip* (branch `replication`)

## SSH Container
[Dockerfile for SSH server](ssh.Dockerfile) is from [this Circle CI blog post](https://circleci.com/blog/ssh-into-docker-container/).

Build and run the image:
```
docker build -f ssh.Dockerfile -t sshd-image:latest .
docker run --rm -t -d --name sshd-image sshd-image:latest
```

To ssh into the container, use the [ipterm](https://gns3.com/marketplace/appliances/ipterm) appliance.
SSH password is `insecure_password`.
