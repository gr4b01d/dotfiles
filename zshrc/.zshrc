# Lines configured by zsh-newuser-install
# lol
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tagilla/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall
zstyle ':completion:*' menu select
alias Zource="source ~/.zshrc" 
alias gzdoom="cd ~/gzdoom_build/gzdoom/build"
alias clear="clear && fastfetch" 
alias zcfg="nvim ~/.zshrc"
alias seeksuperfluous="pacman -Qtdq"
alias WallRizz="WallRizz" 
alias Beats="ncmpcpp"
alias BirmStars="astroterm -i Birmingham --color --constellations -s 100"
alias rsync="rsync --progress"
alias Reveal="chafa"
alias djstars="astroterm --constellations --color --latitude 41.763710 --longitude 72.685097"
alias yt-dlp-audio="yt-dlp -x --audio-quality 0"
alias BirmStarsRealtime="astroterm -i Birmingham --color --constellations "
alias rsyncy="sudo ~/go/bin/rsyncy"
alias mplayer="mplayer" 
alias dragon="/usr/bin/dragon-drop"
alias cavalandstay="nohup cavaland &"
alias PStoXBX="ds4drv --hidraw --emulate-xpad"
alias chessbore="bore local 2308 --to bore.pub"
alias JavaChess="cd /home/tagilla/Downloads/IRCChess-0.1/irc-chess-0.1 && java Chess 1234 "
alias NetScan="arp-scan --localnet"
alias GhosttyEdit="nvim /home/tagilla/.config/ghostty/config"
alias HyprBinds="nvim /home/tagilla/.config/hypr/subconfigs/keybindings.lua"
alias kdestart="nohup ~/.Scripts/kdestart.zsh &"
alias kdeindi="nohup ~/.Scripts/kdeindi.zsh &"
alias Pi_Imager="sudo -E rpi-imager"
alias YtuiLogs="cat ~/.config/ytui/ytui.log"
alias rsyncymove="rsyncy --remove-source-files"
alias ytfzf="ytfzf -T chafa"
alias bbdungeoneditor="cd ~/.local/share/shadPS4/savedata/1/CUSA00207/SPRJ0005/ && ./dungeon"
alias grubdate="grub-mkconfig -o /boot/grub/grub.cfg"
alias spotifynoads="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
alias lutris="~/lutris/bin/lutris -d"
alias mirrorrefresh="sudo reflector --verbose --sort rate -l 30 --save /etc/pacman.d/mirrorlist"
alias PyprConf="nvim .config/pypr/config.toml"
alias Linkget="ytfzf -L | wl-copy && addyttobatch"
alias StartCopyparty="python /run/media/tagilla/Copyparty/copyparty-sfx.py -c /run/media/tagilla/Copyparty/conf.conf --qr "
alias StartTunnel="cloudflared tunnel run --token eyJhIjoiODlhMjYyNDMzNGY3NWEyMzFkNDBjNDQxMzMwNDIwMmQiLCJ0IjoiMDA1YjM3ODYtOTdiZi00YWQyLTg2NDEtMTc5OTBjMDY5MDBhIiwicyI6IlpUWXlObUV6TURVdE5ETTNNQzAwWlRrM0xUaGxZakF0WVdZMlpXUm1ZVEV3T1RNMiJ9"
fastfetch
alias PartySync="python /home/tagilla/Copyparty/u2c.py -a Y4ld4b40th --dr 192.168.1.81:3923"
alias ytdownloadbatchaudio="yt-dlp --no-playlist -x --audio-quality 0 --batch-file ~/batch.txt && .> ~/batch.txt && cat ~/batch.txt" 
alias ytdownloadbatch="yt-dlp --no-playlist --batch-file ~/batch.txt -P ~/TemporaryNasStuff/Batchdump && .> ~/batch.txt && cat ~/batch.txt"
alias addyttobatch="wl-paste >> ~/batch.txt && cat ~/batch.txt"
alias sshgolgotha="gpg -d -q .sshpassword.gpg > fifo; sshpass -f fifo ssh kaernk@192.168.1.199"
alias shutdowngolgotha="gpg -d -q .sshpassword.gpg > fifo; sshpass -f fifo ssh kaernk@192.168.1.199 sudo poweroff"
alias stopgolgotha="gpg -d -q .sshpassword.gpg > fifo; sshpass -f fifo ssh kaernk@192.168.1.199 sudo systemctl stop prty.service"
alias startgolgotha="gpg -d -q .sshpassword.gpg > fifo; sshpass -f fifo ssh kaernk@192.168.1.199 sudo systemctl start prty.service"
alias restartgolgotha="gpg -d -q .sshpassword.gpg > fifo; sshpass -f fifo ssh kaernk@192.168.1.199 sudo systemctl restart prty.service"
alias tomedia="/run/media/tagilla"
alias Hyprconf="nvim ~/.config/hypr/hyprland.lua"
alias ls="ls --color=auto"
alias debtap="~/debtap/debtap"
alias proton-pass="~/Downloads/proton-pass-1.36.1-1-x86_64.pkg/usr/lib/proton-pass/Proton\ Pass"
alias rmpc-bindings="cat /home/tagilla/Documents/rmpcbinds"
alias githubsync="cat /home/tagilla/Documents/githubsync.txt"
PROMPT="%B%F{9}%n%f%b within%B%F{14}%d%f%b|%B%F{13}%T%f%b:"
export EDITOR='nvim'
# Created by `pipx` on 2025-11-05 13:52:32
export PATH="$PATH:/home/tagilla/.local/bin"
export PATH="$PATH:/home/tagilla/.cargo/bin"
export PATH="/usr/bin:$PATH"
export PATH="$PATH:/home/tagilla/.config/rmpc/RMPC-Auto-Theme/target/release"
export MPD_HOST="127.0.0.1"
export MPD_PORT="6600"


if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

LS_COLORS=$LS_COLORS:'di=0;34:' ; export LS_COLORS

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

plugins=(git zsh-mnt)
