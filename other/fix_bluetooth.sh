#!/bin/bash
sudo apt --reinstall install pipewire-media-session
sudo apt install wireplumber
systemctl --user enable --now pipewire && systemctl --user enable --now wireplumber && systemctl --user enable --now pipewire-pulse
