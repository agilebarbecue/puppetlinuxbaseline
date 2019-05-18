#!/bin/bash

#docker kubernetes install for ubuntu - creates a (non secure) local dev environment

. /etc/lsb-release
MYUSER=$USER

apt-get update
apt-get install -y docker.io
systemctl enable docker
systemctl start docker
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-${DISTRIB_CODENAME} main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl
kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p /home/${MYUSER}/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/${MYUSER}/.kube/config
sudo chown $(id -u):$(id -g) /home/${MYUSER}/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl create clusterrolebinding permissive-binding \
      --clusterrole=cluster-admin \
      --user=admin \
      --user=kubelet \
      --group=system:serviceaccounts
chown -R ${MYUSER} /home/${MYUSER}/.kube

