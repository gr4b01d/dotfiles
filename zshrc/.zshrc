# --- Colours ---
export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34:'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;36m'
export LESS_TERMCAP_ue=$'\e[0m'
export MANPAGER='less -R'

# --- Completion ---
autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# --- Prompt (replaces p10k) ---
autoload -Uz vcs_info
precmd() {
    vcs_info
}
local _git_icon=$'\uf418'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes yes
zstyle ':vcs_info:git:*' check-for-staged-changes yes
zstyle ':vcs_info:git:*' formats " %F{141}${_git_icon} %b%f%c%u"
zstyle ':vcs_info:git:*' actionformats " %F{141}${_git_icon} %b%f %F{red}(%a)%f%c%u"
zstyle ':vcs_info:git:*' stagedstr " %F{green}+%i%f"
zstyle ':vcs_info:git:*' unstagedstr " %F{red}!%u%f"

autoload -Uz vcs_info +X add-zsh-hook

# Hook to inject file counts into %i and %u
+vi-git-counts() {
    local staged unstaged untracked
    staged=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
    unstaged=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')
    untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
    hook_com[staged]=''
    hook_com[unstaged]=''
    [[ $staged -gt 0 ]] && hook_com[staged]=" %F{green}+${staged}%f"
    [[ $unstaged -gt 0 ]] && hook_com[unstaged]+=" %F{red}!${unstaged}%f"
    [[ $untracked -gt 0 ]] && hook_com[unstaged]+=" %F{yellow}?${untracked}%f"
}
zstyle ':vcs_info:git+set-message:*' hooks git-counts
setopt PROMPT_SUBST

PROMPT='%F{33}%~%f${vcs_info_msg_0_}
%(?.%F{141}❯%f.%F{196}❯%f) '
RPROMPT='%F{240}%D{%H:%M}%f %(?.%F{green}✓.%F{196}✗ %?)%f'

# fastfetch
figlet -f smslant Welcome Back - Tagilla | lolcat

# --- User Configuration ---
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export VISUAL='geany'
export PATH="$HOME/custom-scripts:$PATH"
# Set the correct directory for figlet fonts
export FIGLET_FONTDIR="/usr/share/figlet/fonts"
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
# --- Aliases ---
alias la="lsd -a"
alias nal="nano -l"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mc="micro"
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias query="pacman -Q"
alias keys="~/custom-scripts/keybinds.sh"
alias dashboard="python3 ~/custom-scripts/Dashboard/dashboard.py"
alias hyprconf='micro -multiopen vsplit ~/.config/hypr/configs/keybinds.lua ~/.config/hypr/configs/windowrules.lua'
alias reclaim="python3 ~/arch-projects/Reclaim-Linux/reclaim-linux.py"
alias Zource="source ~/.zshrc" 
alias clear="clear && fastfetch" 
alias zcfg="nvim ~/.zshrc"
alias seeksuperfluous="pacman -Qtdq"
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
alias debtap="~/debtap/debtap"
alias proton-pass="~/Downloads/proton-pass-1.36.1-1-x86_64.pkg/usr/lib/proton-pass/Proton\ Pass"
alias rmpc-bindings="cat /home/tagilla/Documents/rmpcbinds"
alias githubsync="cat /home/tagilla/Documents/githubsync.txt"
alias moncfg="hyprmoncfg --monitors-conf ~/dotfiles/hypr/.config/hypr/subconfigs/monitors.lua --hypr-config ~/dotfiles/hypr/.config/hypr/hyprland.lua"
alias weather="wttr Birmingham"

# Timeshift aliases
alias restore-list='timeshift --list'
alias restore-now='sudo timeshift --restore'

 
# --- Functions ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# --- zsh-autosuggestions (sourced directly, no plugin manager) ---
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# --- XC-Manager Settings ---
# Source the AUR-installed plugin (handles fpath, autoload, and bindkey automatically)
source /usr/share/zsh/plugins/xc-manager/xc.plugin.zsh
# Test local dev version instead
fpath=(/usr/share/zsh/plugins/xc-manager/autoload $fpath)
autoload -Uz fzf-vault-widget
zle -N fzf-vault-widget
bindkey '^G' fzf-vault-widget

# UI Customization (These are read by the functions when called)
zstyle ':xc:*' separator "->" 
zstyle ':xc:*' fzf_colors "fg:7,hl:4,fg+:15,hl+:12,info:2,prompt:5,pointer:12"

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Deduplication is key to stopping the growth
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

setopt sharehistory
setopt autocd
setopt EXTENDED_HISTORY

# --- Startup ---
echo "󱓞 System Version: Main"
if [[ -o interactive && "$TERM" =~ "foot|xterm-kitty" ]]; then
    python3 "$HOME/custom-scripts/Dashboard/dashboard.py"
fi
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

#source ~/.local/share/extraterm/extraterm-commands-0.9.4/setup_extraterm_zsh.zsh
export PATH="$HOME/.local/bin:$PATH"
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# --- Mend plugin ---
# source $HOME/arch-projects/mend/mend.plugin.zsh
# fpath=($HOME/arch-projects/mend/functions $fpath)
source /usr/share/zsh/plugins/mend/mend.plugin.zsh
fpath=(/usr/share/zsh/plugins/mend/functions $fpath)
autoload -Uz mend

# --- 2. The Function ---
unalias d 2>/dev/null
d() {
  # List stack, skip current dir, and fuzzy search unique paths
  local dir=$(dirs -p -v | tail -n +2 | fzf --height 40% --reverse --header="Jump to Previous Directory" | awk '{print $2}')
  
  # Jump if a selection was made
  if [[ -n "$dir" ]]; then
    cd "${dir/#\~/$HOME}"
  fi
}

# --- Oversight Security Tool ---
#source /home/rk1/.local/share/oversight/oversight.zsh
#add-zsh-hook preexec _oversight_preexec
