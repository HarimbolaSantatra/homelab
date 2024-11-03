FROM ubuntu:22.04

RUN apt update && apt install -y openssh-server iproute2
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN useradd -m -s /bin/bash santatra
RUN echo "santatra:insecure_password" | chpasswd

EXPOSE 22

ENTRYPOINT service ssh start && bash
