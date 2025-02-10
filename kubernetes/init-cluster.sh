#!/bin/bash

set -e

cidr="192.168.1.0/24"
home_user="santatra"
node="santatra-t490"
root_config="/etc/kubernetes/admin.conf"
kube_config="$HOME/.kube/config"

sudo swapoff -a
sudo kubeadm init --ignore-preflight-errors=all --pod-network-cidr $cidr
sudo modprobe br_netfilter
sudo cp -v $root_config $kube_config
sudo chown $home_user:$home_user $kube_config
kubectl taint nodes $node node-role.kubernetes.io/control-plane-
