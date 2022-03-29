#!/bin/sh

CURRENT_NUM_DISPLAYS=$(xrandr | grep -P '^[^ ]+ connected (primary |)\d+x\d+\+\d+\+\d+' | wc -l)
CURRENT_LEFT=$(xrandr | grep -P '^[^ ]+ connected (primary |)\d+x\d+\+\d+\+\d+' | grep +0+0 | cut -f 1 -d ' ')
CURRENT_RIGHT=$(xrandr | grep -P '^[^ ]+ connected (primary |)\d+x\d+\+\d+\+\d+' | grep --invert-match +0+0 | cut -f 1 -d ' ')

if [ "$CURRENT_NUM_DISPLAYS" == 2 ]; then
  xrandr --output eDP1 --off \
         --output "${CURRENT_RIGHT}" --auto --pos 0x0 --primary \
         --output "${CURRENT_LEFT}"  --auto --pos 3840x0
else
  xrandr --output eDP1 --off \
         --output DP3 --auto --pos 0x0 --primary \
         --output DP4 --auto --pos 3840x0
fi
