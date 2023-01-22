#! /usr/bin/env bash

set -e

TARGET=/dev/sda

nix build .#nixosConfigurations.patoIso.config.system.build.isoImage
sudo cp -vi result/iso/*.iso $TARGET


