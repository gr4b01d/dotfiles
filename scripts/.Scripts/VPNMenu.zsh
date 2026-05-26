#!/bin/zsh
#
option=$(printf "UK\nNL\nUS\nRU\nDisconnect" | fuzzel --dmenu -p "Proton VPN Select" --lines=5)

case "$option" in
	"UK") protonvpn connect --country UK --p2p ;;
	"NL") protonvpn connect --country NL --p2p ;;
	"US") protonvpn connect --country US --p2p ;;
	"RU") protonvpn connect --country RU --p2p ;;
	"Disconnect") protonvpn disconnect ;;
esac
