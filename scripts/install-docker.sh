#!/usr/bin/env bash
set -e

echo -e "${li:?}Installing Docker..."
sudo apt install --yes docker.io docker-compose

echo -e "${li:?}Enabling Docker..."
sudo systemctl enable docker

echo -e "${li:?}Starting Docker..."
sudo systemctl start docker

user="$(whoami)"
echo -e "${li:?}Adding ${user:?} to Docker group..."
sudo gpasswd -a "${user:?}" docker

echo -e "${li:?}Setting docker.sock permissions..."
sudo chmod 666 /var/run/docker.sock

set +e
