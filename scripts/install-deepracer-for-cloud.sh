#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing DeepRacer for Cloud..."


git clone https://github.com/aws-deepracer-community/deepracer-for-cloud.git ~/.deeptanuki/deepracer-for-cloud

pushd ~/.deeptanuki/deepracer-for-cloud
git checkout v3.1
popd

echo -e "${ok:?}DeepRacer for Cloud installed!"
set +e
