export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export VISUAL="nvim"

export ADOTDIR="$XDG_DATA_HOME/zsh/antigen"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export XAUTHORITY="$XDG_RUNTIME_DIR/X11/xauthority"
export ICEAUTHORITY="$XDG_RUNTIME_DIR/X11/iceauthority"
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
hash gimp 2>/dev/null && export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"

alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias xsel="xsel --logfile $XDG_CACHE_HOME/xsel/xsel.log"
alias rm="rm -i"

source "$XDG_CONFIG_HOME/zsh/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle vi-mode
antigen bundle tarruda/zsh-autosuggestions
antigen bundle horosgrisa/autoenv
antigen bundle Tarrasch/zsh-bd
antigen bundle felixr/docker-zsh-completion
antigen bundle zsh-users/zsh-completions
antigen bundle srijanshetty/zsh-pandoc-completion
antigen bundle srijanshetty/zsh-pip-completion

antigen theme minimal

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

if [ -d "/opt/ros/indigo" ]; then
    source /opt/ros/indigo/setup.zsh
fi

if [ -d "$PATH:$HOME/.rvm/bin" ]; then
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

eval `keychain --eval --quiet --agents ssh id_ed25519`

