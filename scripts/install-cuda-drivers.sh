#!/usr/bin/env bash
set -e


echo -e "${li:?}Installing Linux headers..."
sudo apt install "linux-headers-$(uname -r)" --yes

echo -e "${li:?}Downloading cuda-ubuntu2004.pin..."
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin

echo -e "${li:?}Installing cuda-ubuntu2004.pin..."
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600

echo -e "${li:?}Adding NVIDIA public key..."
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub

echo -e "${li:?}Downloading NVIDIA repository..."
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"

./scripts/update.sh

echo -e "${li:?}Installing CUDA toolkit..."
sudo apt install cuda --yes

echo -e "${ok:?}CUDA drivers installed!"
set +e
