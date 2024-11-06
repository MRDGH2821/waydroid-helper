#!/usr/bin/env bash

# Taken from https://wiki.archlinux.org/title/Waydroid

sudo systemctl stop docker
sudo systemctl restart iptables
ip link delete docker0
sudo systemctl restart waydroid-container
