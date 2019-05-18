#!/bin/bash

if [ $1 == "rebase" ]; then
  docker pull ubuntu:latest
  docker build --no-cache -t devbox-base -f Dockerfile.base .
fi
docker build --no-cache -t devbox-mezz -f Dockerfile.mezz .
docker build --no-cache -t devbox-vim -f Dockerfile.vim .
docker build --no-cache -t devbox-files -f Dockerfile.files .
docker build --no-cache -t devbox -f Dockerfile.update .

