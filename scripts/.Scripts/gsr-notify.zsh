#!/bin/zsh

notify-send "Clip recorded!"

pkill -USR1 -f gpu-screen-recorder
