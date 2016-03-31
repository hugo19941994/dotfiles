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
ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)

# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi

# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.config/gnupg/S.gpg-agent.ssh"
fi

# Set GPG TTY
export GPG_TTY=$(tty)

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

if [ -z "$SSH_AUTH_SOCK" ] ; then
    ssh-add ~/.ssh/id_ed25519
fi
