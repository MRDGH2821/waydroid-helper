#!/usr/bin/env bash

# Taken from https://wiki.archlinux.org/title/Waydroid

systemctl stop docker
systemctl restart iptables
ip link delete docker0
systemctl restart waydroid-container