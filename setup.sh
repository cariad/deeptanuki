#!/usr/bin/env bash

set -e

. ./scripts/style.sh
  ./scripts/preamble.sh
  ./scripts/update.sh

  ./scripts/install-curl.sh
  ./scripts/install-jq.sh

  ./scripts/install-aws.sh

  ./scripts/install-cuda.sh
  ./scripts/install-docker.sh
  ./scripts/install-nvidia-container-toolkit.sh
  ./scripts/install-deepracer-local.sh

  ./scripts/install-bin.sh

echo -e "${ok:?}Bootstrap complete!"

set +e
