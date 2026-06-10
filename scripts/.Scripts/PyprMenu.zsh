#!/bin/zsh
#
option=$(printf "Terminal\nPavuctl\nOBS\nrmpc\nSpotify\nBTOP\nClock\nCalculator\nClipboard\nHome" | fuzzel --dmenu -p "Pypr:" --lines=10)

case "$option" in
	"Terminal") pypr toggle term ;;
	"Pavuctl") pypr toggle audio ;;
	"OBS") pypr toggle recording ;;
	"rmpc") pypr toggle mymusic ;;
	"Spotify") pypr toggle spot ;;
	"BTOP") pypr toggle monitor ;;
	"Clock") pypr toggle clock ;;
	"Calculator") pypr toggle calc ;;
	"Clipboard") pypr toggle clipse ;;
	"Home") pypr toggle clipse calc clock monitor spot term weather ;;
esac
