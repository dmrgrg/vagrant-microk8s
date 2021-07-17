#!/bin/bash -xe

HELM_VERSION=3.6.0

# Faster than VirtualBox's DNS Server
sed -i 's/127.0.0.53/1.1.1.1/' /etc/resolv.conf

wget https://get.helm.sh/helm-v$HELM_VERSION-linux-amd64.tar.gz
tar -xzf helm-v$HELM_VERSION-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm
rm -rf helm-v$HELM_VERSION-linux-amd64.tar.gz linux-amd64

swapoff -a
sed -i '/swap/d' /etc/fstab

snap install microk8s --classic
#snap install docker

# Waits until K8s cluster is up
sleep 15

microk8s.status --wait-ready
microk8s.enable dns rbac metallb:192.168.50.100-192.168.50.200
microk8s.enable storage registry

mkdir -p /home/vagrant/.kube
microk8s config >/home/vagrant/.kube/config
usermod -a -G microk8s vagrant
chown -f -R vagrant /home/vagrant/.kube
chmod go-r /home/vagrant/.kube/config

curl https://get.docker.com | sh -
usermod -aG docker vagrant
