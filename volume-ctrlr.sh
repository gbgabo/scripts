#!/bin/bash

print_bar()
{
  # notify-send "brghtnss: "$1% -t 1500
  local number=${1/"%"/" "}
  number=${number/"+"/" "}
  number=${number/"-"/" "}
  bar=$(tprogbar -v $number)
  xsetroot -name "  $bar"
}

current_volume=$(amixer set Master "$1")
display_volume=$(echo -e "$current_volume" | awk -F'[][]' 'NF > 1 {print $2}' | awk '!seen[$1]++')

print_bar $display_volume