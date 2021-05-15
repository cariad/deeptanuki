#!/usr/bin/env bash
set -e

sudo apt install build-essential
sudo apt install cmake unzip zip
sudo apt install python-dev python3-dev python-pip python3-pip


echo -e "${li:?}Installing Python packages..."
sudo apt install python3-pip
python3 -m pip install boto3
python3 -m pip install nvidia-pyindex
python3 -m pip install nvidia-cuda-cupti
python3 -m pip install tensorflow

echo -e "${li:?}Installing DeepRacer for Cloud..."

deepracer_dir=~/.deeptanuki/deepracer-for-cloud

if [ ! -d "${deepracer_dir:?}" ]; then
  git clone https://github.com/aws-deepracer-community/deepracer-for-cloud.git "${deepracer_dir:?}"
fi

echo -e "${li:?}Initializing DeepRacer for Cloud..."
pushd "${deepracer_dir:?}"
git checkout v3.1
bin/init.sh
popd

echo -e "${ok:?}DeepRacer for Cloud installed!"
set +e
