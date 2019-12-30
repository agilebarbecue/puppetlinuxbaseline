#!/bin/bash
cd /tmp
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
if [ -f /etc/apt/sources.list.d/nvidia-docker.list ]; then
    echo "found list file, not repeating"
else
  curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
  curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
fi
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
sudo docker pull busybox
sudo docker pull ubuntu:18.04
sudo docker pull ubuntu:latest
sudo docker pull alpine:latest
sudo docker pull nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
sudo docker pull tensorflow/tensorflow:latest-gpu
sudo docker pull tensorflow/tensorflow:2.0.0-gpu-py3-jupyter