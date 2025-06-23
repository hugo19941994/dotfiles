# ZSH config for interactive shells

setopt correct
setopt auto_cd

# Load brew
eval $(/opt/homebrew/bin/brew shellenv)

# Load antidote for plugin management
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# Custom aliases
alias cat='bat'
alias ls='eza -la --icons --git'
alias htop='btop'
alias top='btop'
alias rm="rm -i"
alias vi="nvim"
alias vim="nvim"
alias gpg2="gpg"

# Load fzf completion
source <(fzf --zsh)

# Load direnv
eval "$(direnv hook zsh)"

# Load starship prompt
eval "$(starship init zsh)"

# Load nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"

# Automatic grc usage
[[ -s "/opt/homebrew/etc/grc.zsh" ]] && source /opt/homebrew/etc/grc.zsh

# Enable krew
if [ -d "$HOME/.krew" ] ; then
        export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi

export SSH_AUTH_SOCK=/Users/rt01121/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh

# Add dotfiles bin directory to PATH
export PATH="$HOME/.config/dotfiles/bin:$PATH"
