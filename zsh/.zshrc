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
antigen bundle vi-mode
antigen bundle tarruda/zsh-autosuggestions
antigen bundle horosgrisa/autoenv
antigen bundle Tarrasch/zsh-bd
antigen bundle srijanshetty/zsh-pandoc-completion
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen theme minimal

antigen apply

#zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#zsh-autosuggestions
source $ADOTDIR/repos/https-COLON--SLASH--SLASH-github.com-SLASH-tarruda-SLASH-zsh-autosuggestions.git/dist/autosuggestions.zsh
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
autosuggest_start

if [ -d "$PATH:$HOME/.rvm/bin" ]; then
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi

eval `keychain --eval --quiet --agents ssh id_ed25519`

