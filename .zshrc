
#
# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝
#

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/erne/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

# Adding some additional keybindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[3~' delete-char

# Tab completion
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:default' list-colors ma=0\;15

# What if the programme is not installed?
[[ -a "/etc/zsh_command_not_found" ]] && . /etc/zsh_command_not_found

# Auto CD
setopt auto_cd

# correct the mistyped command
setopt CORRECT

# Case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#
# ┌┬┐┌─┐┌─┐┌─┐┬ ┬┬ ┌┬┐┌─┐
#  ││├┤ ├┤ ├─┤│ ││  │ └─┐
# ─┴┘└─┘└  ┴ ┴└─┘┴─┘┴ └─┘
#

if [[ $(tty) =~ /dev/tty ]]; then
    export BROWSER="w3m"
else
    export BROWSER="brave"
fi

export EDITOR="vim"
export VISUAL="vim"
export SUDO_EDITOR="vim"
export DIFFPROG="colordiff"

# Set the right language rendering for tty
if [[ $(tty) =~ /dev/tty ]]; then
    setfont ter-232n
fi

# Set the right locale for cal
alias cal='cal -m'

#
# ┌─┐┌─┐┌─┐┌┬┐┬ ┬┌─┐┌┬┐┬┌─┐┌─┐
# ├─┤├┤ └─┐ │ ├─┤├┤  │ ││  └─┐
# ┴ ┴└─┘└─┘ ┴ ┴ ┴└─┘ ┴ ┴└─┘└─┘
#

# Enable colours
if [[ $(tty) =~ /dev/pts ]]; then
    command -v lsd > /dev/null && alias ls='lsd -lah --group-dirs first'
    command -v lsd > /dev/null && alias tree='lsd --tree'
    command -v bat > /dev/null && alias cat='echo && bat --theme=base16 --pager=never -p'
else
    command -v lsd > /dev/null && alias ls='lsd -lah --group-dirs first --icon never'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pacman='pacman --color=auto'
alias qalc='qalc -c'

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export MANROFFOPT=-c

# Syntax highlighting and autosuggesting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=15,underline'

# Show an underline cursor while on xterm
if [[ $TERM == "xterm" ]]; then
	echo -e "\e[4 q"
fi

# Set a fancy prompt
if [[ $(tty) =~ "/dev/tty" ]]; then
	export STARSHIP_CONFIG=~/.config/starship-tty.toml
else
	export STARSHIP_CONFIG=~/.config/starship-gui.toml
fi

eval "$(starship init zsh)"

# Start with a fortune cookie
if [[ $TERM == "xterm-kitty" || $TERM == "alacritty" || $TERM == "foot" ]]; then
	echo -e "\n\e[3m$(fortune stoicism | fold -s -w $(tput cols))"
else
	echo -e "\n$(fortune stoicism | fold -s -w $(tput cols))"
fi

# Show a warning when you're offline
if ! systemctl is-active --quiet NetworkManager; then
	echo -e "\n\e[1;31mWARNING! \e[0mYou are offline!"
fi

# i'm in alacritty, show me my directory!
if [[ $TERM == "alacritty" || $TERM == "foot" ]]; then
	precmd() {print -Pn "\e]0;%n@%m: %~\a"}
fi

#
# ┌─┐┬  ┬┌─┐┌─┐┌─┐┌─┐
# ├─┤│  │├─┤└─┐├┤ └─┐
# ┴ ┴┴─┘┴┴ ┴└─┘└─┘└─┘
#

if [ -f ~/.aliases ]; then
	. ~/.aliases
fi
