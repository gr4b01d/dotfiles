#!/bin/zsh
#
option=$(printf "Hypr\nPackages\nPypr\nGhostty\nzshrc" | fuzzel --dmenu -p "Synchronise:" --lines=5)

case "$option" in
	"Hypr") rsync -av --delete ~/.config/hypr/ /mnt/0c66454d-94f8-40ee-b502-b7eead5bc737/Backups/config/hypr && notify-send 'Synchronising Hyprland config' ;;
	"Packages") pacman -Qqe | grep -Fvx '$(pacman -Qqm)' > /mnt/0c66454d-94f8-40ee-b502-b7eead5bc737/Backups/pckgs && notify-send 'Synchronising pacman list' ;;
	"Pypr") rsync -av --delete ~/.config/pypr/ /mnt/0c66454d-94f8-40ee-b502-b7eead5bc737/Backups/config/pypr && notify-send 'Synchronising Pyprland config' ;;
	"Ghostty") rsync -av --delete ~/.config/ghostty/ /mnt/0c66454d-94f8-40ee-b502-b7eead5bc737/Backups/config/ghostty && notify-send 'Synchronising Ghostty config' ;;
	"zshrc") rsync -av /home/tagilla/dotfiles/zshrc/.zshrc /mnt/0c66454d-94f8-40ee-b502-b7eead5bc737/Backups/ && notify-send 'Synchronising zsh config' ;;
esac
