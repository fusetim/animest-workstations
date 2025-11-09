# Anim'Est workstations

This repository contains the NixOS configurations for the workstations used by the Anim'Est association, on-site during our events.

## Key points

Most on-site workstations are actually Raspberry Pi 4 devices (2GB/4GB RAM models) running NixOS. This allows us to have a consistent and reproducible environment across all workstations, making it easier to manage and maintain them.

Even if netbooting is possible with Raspberry Pi devices, we opted for local installations on SD cards to ensure better performance and reliability during the event.
The configurations are designed to be as lightweight as possible, given the limited resources of the Raspberry Pi devices. We focus on essential software and services needed for our events, avoiding unnecessary bloat.

## Install process

See https://nixos.wiki/wiki/NixOS_on_ARM#Installation and https://nix.dev/tutorials/nixos/installing-nixos-on-a-raspberry-pi