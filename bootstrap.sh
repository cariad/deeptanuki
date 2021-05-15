#!/usr/bin/env bash

set -e

. ./scripts/style.sh
  ./scripts/preamble.sh
  ./scripts/update.sh
  ./scripts/install-cuda-drivers.sh
. ./scripts/configure-bashrc.sh

echo -e "${ok:?}Bootstrap complete!"

set +e
