#!/bin/bash

print_slider()
{
  # notify-send "brghtnss: "$1% -t 1500
  local current_step=0
  local number=${1/"%"/" "}
  number=${number/"+"/" "}
  number=${number/"-"/" "}
  echo $number
  local on_steps=$(bc <<< "scale=0; $number/5")
  local slider="["
  while [ $current_step -lt 21 ]; do
    if [ $current_step -lt $(( $on_steps + 1 )) ]; then
      slider+="#"
    else
      slider+="-"
    fi
    current_step=$(( $current_step + 1 ))
  done 
  slider+="]"
  echo $slider
  notify-send -i "/home/gabo/Imagens/icons/volume30.png" --hint=string:x-dunst-stack-tag:brghtnss "$slider" -t 1500
}

current_volume=$(amixer set Master "$1")
display_volume=$(echo -e "$current_volume" | awk -F'[][]' 'NF > 1 {print $2}' | awk '!seen[$1]++')

print_slider $display_volume