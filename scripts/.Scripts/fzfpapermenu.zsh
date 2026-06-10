#!/bin/zsh 

# 1. Clear out the old temporary wallpaper
rm -rf ~/Pictures/Wallpapers/temp/*

# 2. Launch Kitty, change to the directory, and run fzf inside it
kitty --directory ~/Pictures/Wallpapers bash -c 'cp "$(fzf --preview "~/.Scripts/fzf-preview.sh {}")" ~/Pictures/Wallpapers/temp/'

# 3. Apply the new wallpaper once Kitty closes
awww img ~/Pictures/Wallpapers/temp/* && wal -i ~/Pictures/Wallpapers/temp/* && pkill -USR2 ghostty

# 4. Reload apps
wayle panel restart  
