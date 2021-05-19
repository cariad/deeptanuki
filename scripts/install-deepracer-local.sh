#!/usr/bin/env bash
set -e

if [ ! -d ~/.deeptanuki/deepracer-local ]; then
  echo -e "${li:?}Installing mattcamp/deepracer-local..."
  git clone https://github.com/mattcamp/deepracer-local.git ~/.deeptanuki/deepracer-local
  pushd ~/.deeptanuki/deepracer-local
  git checkout 1.0
  popd
fi

echo -e "${ok:?}Creating sagemaker-local network..."
docker network create sagemaker-local || true

set +e
