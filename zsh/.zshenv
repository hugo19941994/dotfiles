export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export VISUAL="nvim"
export EDITOR="nvim"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ADOTDIR="$XDG_DATA_HOME/zsh/antigen"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
#export XAUTHORITY="$XDG_RUNTIME_DIR/X11/xauthority"
#export ICEAUTHORITY="$XDG_RUNTIME_DIR/X11/iceauthority"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GOPATH=~/.go
hash gimp 2>/dev/null && export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"

xrdb -load .config/X11/xresources
