#!/usr/bin/env bash
set -e

if [ "$(whoami)" == "root" ]; then
  echo -e "${nk:?}Run this script as your daily user account without sudo."
  exit 1
fi

echo
echo "Hello!"
echo
echo "This script is intended to be run on a fresh Ubuntu Desktop 20.04.2.0 LTS"
echo "installation, or an installation previously prepared by an earlier"
echo "version of this script."
echo
echo "Terrible things will happen if you run this on a machine you've already"
echo "hand-crafted."
echo
echo "Press Ctrl+C NOW if you're not certain you want to do this."
echo
echo "You'll be prompted to enter your account password. Setup is "
echo "non-interactive beyond that and will take several minutes."
echo
echo "After you've authenticated, feel free to leave this running and grab a"
echo "coffee or kiwi fruit."
echo
read -r -p "Press Ctrl+C to stop or Enter to start setup... "
set +e
