#!/bin/zsh 

# Grab the URL from the clipboard
URL=$(wl-paste)

# If no URL is found, exit
if [ -z "$URL" ]; then
    notify-send "Fuzzel Ytdlp" "No URL found in clipboard"
    paplay /home/tagilla/dotfiles/scripts/.Scripts/scriptdeps/faith-michael-davies-nooooooo-made-with-Voicemod.mp3
    exit 1
fi

# Present options in Fuzzel
CHOICE=$(echo -e "Download Video\nDownload Audio\nDownload Playlist\nDownload Music Playlist\nExit" | fuzzel --dmenu -p "yt-dlp: " --lines=4)

# Act based on selection
case "$CHOICE" in
	"Download Video") foot --app-id yownloader yt-dlp -P /home/tagilla/TemporaryNasStuff/Batchdump --no-playlist "$URL" ;;
	"Download Audio") foot --app-id yownloader yt-dlp -x --audio-format mp3 -P /home/tagilla/Music/Temporary --no-playlist "$URL" ;;
        "Download Playlist") foot --app-id yownloader yt-dlp -P /home/tagilla/TemporaryNasStuff/Batchdump "$URL" ;;
	"Exit") paplay /home/tagilla/dotfiles/scripts/.Scripts/scriptdeps/faith-michael-davies-i-go-unwillingly-made-with-Voicemod.mp3 ;;
	

esac

