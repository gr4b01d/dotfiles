#!/bin/zsh
#
option=$(printf "Hypr\nPackages\nPypr\nGhostty\nzshrc" | fuzzel --dmenu -p "Synchronise:" --lines=5)

case "$option" in
	"Hypr") rsync -av --delete ~/.config/hypr/ /mnt/baefb291-842c-4d6a-9fed-7bca7e63deeb/Backups/config/hypr && notify-send 'Synchronising Hyprland config' ;;
	"Packages") pacman -Qqe | grep -Fvx '$(pacman -Qqm)' > /mnt/baefb291-842c-4d6a-9fed-7bca7e63deeb/Backups/pckgs && notify-send 'Synchronising pacman list' ;;
	"Pypr") rsync -av --delete ~/.config/pypr/ /mnt/baefb291-842c-4d6a-9fed-7bca7e63deeb/Backups/config/pypr && notify-send 'Synchronising Pyprland config' ;;
	"Ghostty") rsync -av --delete ~/.config/ghostty/ /mnt/baefb291-842c-4d6a-9fed-7bca7e63deeb/Backups/config/ghostty && notify-send 'Synchronising Ghostty config' ;;
	"zshrc") rsync -av /home/tagilla/dotfiles/zshrc/.zshrc /mnt/baefb291-842c-4d6a-9fed-7bca7e63deeb/Backups/ && notify-send 'Synchronising zsh config' ;;
esac
