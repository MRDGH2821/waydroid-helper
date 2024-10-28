#!/usr/bin/env bash

# Source - https://github.com/waydroid/waydroid/issues/143#issuecomment-1520857943

# This script disables nft & iptables-legacy in waydroid-net.sh
# Helpful if you have docker installed

sudo sed -i~ -E 's/=.\$\(command -v (nft|ip6?tables-legacy).*/=/g' /usr/lib/waydroid/data/scripts/waydroid-net.sh
