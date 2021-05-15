#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing DeepRacer for Cloud..."

deepracer_dir=~/.deeptanuki/deepracer-for-cloud

if [ ! -d "${deepracer_dir:?}" ]; then
  git clone https://github.com/aws-deepracer-community/deepracer-for-cloud.git "${deepracer_dir:?}"
fi

pushd "${deepracer_dir:?}"
git checkout v3.1
popd


# aws configure set region us-west-2 --profile minio


echo -e "${li:?}Initializing DeepRacer for Cloud..."
bin/init.sh

echo -e "${ok:?}DeepRacer for Cloud installed!"
set +e
