#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing NVIDIA Container Toolkit..."

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L "https://nvidia.github.io/nvidia-docker/${distribution:?}/nvidia-docker.list" | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

echo -e "${ok:?}NVIDIA Container Toolkit installed!"
set +e