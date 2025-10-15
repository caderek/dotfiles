#!/bin/bash

# xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
xrandr --output VGA-1 --mode 1920x1080
# xrandr --output VGA-1-1 --left-of LVDS-1-1
xrandr --output VGA-1 --mode 1920x1080 --left-of LVDS-1
