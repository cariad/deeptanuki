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

echo -e "${li:?}Installing libnvidia extras..."
sudo apt install libnvidia-extra-465 --yes

echo -e "${li:?}Installing CUDA toolkit..."
sudo apt install cuda --yes

echo -e "${li:?}Enabling nvidia-persistenced..."
sudo systemctl enable nvidia-persistenced

memory_line='SUBSYSTEM=="memory", ACTION=="add"'
rules_path=/lib/udev/rules.d/40-vm-hotadd.rules

if grep -q "${memory_line:?}" "${rules_path:?}"; then
  echo -e "${li:?}Configuring ${rules_path:?}..."

  sudo cp "${rules_path:?}" /etc/udev/rules.d
  sudo sed -i "/${memory_line}/d" "${rules_path:?}"

  echo -e "${li:?}Configured ${rules_path:?}!"
else
  echo -e "${ok:?}${rules_path:?} already configured."
fi

echo -e "${li:?}Installing CUDA code samples..."
rm -rf ~/.deeptanuki/cuda-samples/
cuda-install-samples-11.3.sh ~/.deeptanuki/cuda-samples

echo -e "${li:?}Building CUDA code samples..."
pushd ~/.deeptanuki/cuda-samples/
make
popd

echo -e "${li:?}Querying GPU..."
~/.deeptanuki/cuda-samples/bin/x86_64/linux/release/deviceQuery

echo -e "${li:?}Testing GPU bandwidth..."
~/.deeptanuki/cuda-samples/bin/x86_64/linux/release/bandwidthTest

echo -e "${ok:?}CUDA drivers installed!"
set +e
