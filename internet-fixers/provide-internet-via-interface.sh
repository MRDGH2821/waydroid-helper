#!/usr/bin/env bash

# Source - https://github.com/waydroid/waydroid/issues/1349#issuecomment-2311086851

# Change this to the interface you want to use
interface="wlp0s20f3"

# Use iptables
sudo iptables -A FORWARD -i waydroid0 -o $interface -j ACCEPT
sudo iptables -A FORWARD -i $interface -o waydroid0 -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o $interface -j MASQUERADE

# Use nftables
sudo systemctl start nftables
sudo systemctl enable nftables

# Create new tables for filter and nat
sudo nft add table ip filter
sudo nft add table ip nat

# Create a chain for filter forwarding
sudo nft add chain ip filter forward "{ type filter hook forward priority 0 ; policy accept ; }"

# Create a chain for nat postrouting
sudo nft add chain ip nat postrouting "{ type nat hook postrouting priority 100 ; }"

# Add equivalent forwarding rules
sudo nft add rule ip filter forward iif "waydroid0" oif $interface accept
sudo nft add rule ip filter forward iif $interface oif "waydroid0" accept

# Add equivalent NAT rules
sudo nft add rule ip nat postrouting oif $interface masquerade

# Save config
sudo nft list ruleset | sudo tee /etc/nftables.conf
