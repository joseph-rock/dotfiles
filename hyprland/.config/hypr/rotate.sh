#!/usr/bin/env bash

# A script to rotate the screen 90 deg in hyprland

CURRENT_TRANSFORM=$(hyprctl monitors | sed -nE 's/[[:space:]]*transform: ([0-9])/\1/p')
CURRENT_SCALE=$(hyprctl monitors | sed -nE 's/[[:space:]]*scale: (.*)/\1/p')
FLIP=$(((($CURRENT_TRANSFORM -1)) * -1))

hyprctl keyword monitor eDP-1,preferred,auto,$CURRENT_SCALE,transform,$FLIP
hyprctl keyword input:touchdevice:transform $FLIP
