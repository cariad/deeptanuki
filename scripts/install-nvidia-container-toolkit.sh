#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing NVIDIA Container Toolkit..."

distribution=$(. /etc/os-release;echo "${ID:?}${VERSION_ID:?}")
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L "https://nvidia.github.io/nvidia-docker/${distribution:?}/nvidia-docker.list" | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

./scripts/update.sh

echo -e "${li:?}Installing nvidia-docker2..."
sudo apt install nvidia-docker2 --yes

echo -e "${ok:?}Setting default Docker runtime..."
sudo cp ./data/daemon.json /etc/docker/

echo -e "${li:?}Restarting Docker..."
sudo systemctl restart docker

echo -e "${ok:?}NVIDIA Container Toolkit installed!"
set +e
