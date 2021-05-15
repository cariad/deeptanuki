#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing jq..."
sudo apt install jq --yes

echo -e "${ok:?}jq installed!"
set +e
