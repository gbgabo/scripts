#!/bin/bash

print_slider()
{
  # notify-send "brghtnss: "$1% -t 1500
  local number=${1/"%"/" "}
  number=${number/"+"/" "}
  number=${number/"-"/" "}
  slider=$(tprogbar -v $number)
  notify-send -i "/home/gabo/Imagens/icons/volume30.png" --hint=string:x-dunst-stack-tag:volume "$slider" -t 1500
}

current_volume=$(amixer set Master "$1")
display_volume=$(echo -e "$current_volume" | awk -F'[][]' 'NF > 1 {print $2}' | awk '!seen[$1]++')

print_slider $display_volume