#!/bin/zsh
#This is a menu because I used to sync multiple things to sync before I was using github
option=$(printf "Packages" | fuzzel --dmenu -p "Synchronise:" --lines=1)

case "$option" in
	"Packages") pacman -Qqe | grep -Fvx '$(pacman -Qqm)' > /home/tagilla/.config/pckgs && notify-send 'Synchronising pacman list' ;;
esac
