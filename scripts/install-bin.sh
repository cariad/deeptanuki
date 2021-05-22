#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing scripts..."
sudo cp ./bin/* /usr/local/bin

set +e
