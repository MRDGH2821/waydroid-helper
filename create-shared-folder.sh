#!/usr/bin/env bash
source="${HOME}/Waydroid-Shares/"
target="Waydroid-Shares"
absolute_target="${HOME}/.local/share/waydroid/data/media/0/${target}/"

mkdir -p "${source}"

sudo mkdir -p "${absolute_target}"

sudo mount --bind "${source}" "${absolute_target}"

echo "Shared folder created at ${absolute_target}"
echo "Add your files at ${source}"
