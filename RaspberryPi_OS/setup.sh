#!/bin/bash


#
# Raspberry Pi OS (32-bit) Lite "Auto" Setup
# Version May 2020
#
# WIP
#

if [ $# -lt 2 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
elif [ $# -gt 2 ]; then
  echo 1>&2 "$0: too many arguments"
  exit 2
fi

# Technically this isn't needed because, this script should be cloned via git but, eh why not...
sudo apt install git

### TODO fix hostnamectl set-hostname $1
### TODO fix password change command passwd pi $2
