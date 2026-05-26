#!/bin/zsh
#
option=$(printf "Save Screen\nCopy Screen\nSave Region\nCopy Region" | fuzzel --dmenu -p "Screenshot" --lines=4)

case "$option" in
	"Save Screen") hyprshot --output-folder /home/tagilla/Pictures/Hyprshot -m output -m active ;;
	"Copy Screen") hyprshot --clipboard-only -m output -m active ;;
	"Save Region") hyprshot --output-folder /home/tagilla/Pictures/Hyprshot -m region ;;
	"Copy Region") hyprshot --clipboard-only -m region ;;
esac
