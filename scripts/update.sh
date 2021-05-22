#!/usr/bin/env bash
set -e

echo -e "${li:?}Updating..."
sudo apt update --yes

echo -e "${li:?}Upgrading..."
sudo apt upgrade --yes

set +e
