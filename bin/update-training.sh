#!/usr/bin/env bash
set -e

cd ~/.deeptanuki

source config.env

if [ -d my_training_repo ]; then
  pushd my_training_repo
  git pull
  popd
else
  git clone "${MY_TRAINING_REPO:?}" my_training_repo
fi

cp my_training_repo/deepracer/config.env           deepracer-local
cp my_training_repo/deepracer/model_metadata.json  deepracer-local/custom_files
cp my_training_repo/deepracer/reward.py            deepracer-local/custom_files
cp my_training_repo/deepracer/training_params.yaml deepracer-local/custom_files
