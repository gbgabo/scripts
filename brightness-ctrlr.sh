#!/bin/bash

connected_output=$(xrandr | grep " connected" | cut -f1 -d " ")

usage(){
   echo -e "\033[1musage:\033[0m"
   echo -e "brghtnss -s (VALUE|VALUE+|VALUE-)"
   echo -e "\033[1moptions:\033[0m"
   echo -e "\033[1m-s:\033[0m set brightness in exact percentage value (0 to 100)"
   echo -e "\033[1m--\033[0mif followed by + or -, the value is set to increase/decrease from the current brightness percentage"
   echo -e "\033[1mexample:\033[0m"
   echo -e "\033[1m$\033[0m ./brghtnss -s 50"
   echo -e "- current brightness value is stored on /etc/brghtnss.dat"
   exit 0
}

get_brightness()
{
  if [ -f "/tmp/brghtnss.dat" ]; then
    echo $(cat "/tmp/brghtnss.dat")
  else
    touch /tmp/brghtnss.dat
    echo 100
  fi
}

brightness=$(get_brightness)

print_slider()
{
  # notify-send "brghtnss: "$1% -t 1500
  local current_step=0
  local on_steps=$(bc <<< "scale=0; $1/5")
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
  notify-send --hint=string:x-dunst-stack-tag:brghtnss "    brghtnss: $1%" "$slider" -t 1500
}

set_brightness()
{
  if [[ $1 =~ ^[0-9]+\+$ ]]; then
    number=${1/+/" "}
    brightness=$(bc <<< "$brightness+$number")
  elif [[ $1 =~ ^[0-9]+\-$ ]]; then
    number=${1/-/" "} 
    brightness=$(bc <<< "$brightness-$number") 
  elif [[ $1 =~ ^[0-9]+$ ]]; then
    brightness=$1
  fi
  raw_brightness=$(bc <<< "scale=2; $brightness/100")
  echo "raw="$raw_brightness
  echo "addition="$number
  if (( "$brightness" > 100 )); then 
    brightness=100
  fi
  xrandr --output "$connected_output" --brightness "$raw_brightness"
  print_slider $brightness
  echo "$brightness" > /tmp/brghtnss.dat
}

while getopts s:h option 
do
    case "${option}" in
        s) set_brightness "${OPTARG}";;
        h) usage ;;
    esac
done


