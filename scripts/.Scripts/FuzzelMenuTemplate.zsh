#!/bin/zsh
#
option=$(printf "Option 1\nOption 2\nOption 3\nOption 4" | fuzzel --dmenu -p "")

case "$option" in
	"Option 1")  ;;
	"Option 2") ;;
	"Option 3") ;;
	"Option 4")  ;;
esac
