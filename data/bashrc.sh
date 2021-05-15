#!/usr/bin/env bash

export PATH="${HOME}/.local/bin:/usr/local/cuda-11.3/bin${PATH:+:${PATH}}"
export LD_LIBRARY_PATH="/usr/local/cuda-11.3/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
source ~/.deeptanuki/deepracer-for-cloud/bin/activate.sh
