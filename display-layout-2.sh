#!/bin/sh
xrandr --output eDP1 --off \
       --output DP4 --auto --pos 0x0 --primary \
       --output DP1 --auto --pos 3840x0
