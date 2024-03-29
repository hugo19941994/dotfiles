setopt correct
setopt auto_cd

alias mutt="mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias xsel="xsel --logfile $XDG_CACHE_HOME/xsel/xsel.log"
alias ncmpcpp='ncmpcpp -c "$XDG_CONFIG_HOME"/ncmpcpp/config'
alias rm="rm -i"
alias vi="nvim"
alias vim="nvim"

source "$XDG_CONFIG_HOME/zsh/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle safe-paste
antigen bundle pass
antigen bundle vi-mode
antigen bundle docker
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle mafredri/zsh-async
antigen bundle tarruda/zsh-autosuggestions
antigen bundle horosgrisa/autoenv
antigen bundle Tarrasch/zsh-bd
antigen bundle srijanshetty/zsh-pandoc-completion
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme minimal
antigen apply

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh-autosuggestions
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
ZSH_AUTOSUGGEST_USE_ASYNC="true"

OS="$(uname -s)"

if test "$OS" = "Darwin"; then
    stty discard undef # To enable ctrl-o

    # MacOS: Newer OpenSSL & LLVM
    if [ -d "/usr/local/opt/openssl/bin" ]; then
        export PATH="/usr/local/opt/openssl/bin:$PATH"
    fi

    if [ -d "/usr/local/opt/llvm/bin" ]; then
        export PATH="/usr/local/opt/llvm/bin:$PATH"
    fi
fi

if test "$OS" = "Linux"; then
    # Linux: Start sway
    if [[ "$(tty)" == "/dev/tty1" ]] ; then
        if [ -x "$(command -v sway)" ] ; then
            sway
        fi
    fi
fi

# Unlock SSH and GPG key
if [ -x "$(command -v keychain)" ] ; then
    eval `keychain -q --inherit any --agents ssh,gpg --eval id_ed25519 6CFF4486`
fi

# Enable krew
if [ -d "$HOME/.krew" ] ; then
        export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

# Check for updates once a day
if [[ ! -e /tmp/$(date +%u).sem ]] ; then
    touch /tmp/$(date +%u).sem

    if [ -x "$(command -v brew)" ] ; then
        brew update && brew upgrade && brew upgrade --cask
    fi

    if [ -x "$(command -v yaourt)" ] ; then
        yaourt -Syua
    fi

    if [ -x "$(command -v yay)" ] ; then
        yay -Syua
    fi

    if [ -d "$HOME/.krew" ] ; then
        kubectl krew update
        kubectl krew upgrade
    fi

    antigen selfupdate
    antigen update
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/sbin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

export COMPOSE_DOCKER_CLI_BUILD="1"
export DOCKER_BUILDKIT="1"
export BUILDKIT_INLINE_CACHE="1"
