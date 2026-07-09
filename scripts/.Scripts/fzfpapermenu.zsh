#!/bin/zsh 

# clear out the old paper
rm -rf ~/Pictures/Wallpapers/temp/*

# use the default fzf prievew thingy to select the paper to copy to tmp because I'm lazy 
kitty --app-id walls --directory ~/Pictures/Wallpapers bash -c 'cp "$(fzf --preview "~/.Scripts/fzf-preview.sh {}")" ~/Pictures/Wallpapers/temp/'

# apply the paper the wallpaper to all the bits and bobs
awww img ~/Pictures/Wallpapers/temp/* --transition-type random --transition-step 1 --transition-fps 60  && wal -i ~/Pictures/Wallpapers/temp/* && pkill -USR2 ghostty

# reload wayle because it likes having extra attention paid to it
wayle panel restart  

# firefox too

~/.local/bin/pywalfox update
