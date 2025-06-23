# ZSH config for all shells

# uv
export PATH="/Users/rt01121/.local/share/../bin:$PATH"

# Disable Homebrew hints
export HOMEBREW_NO_ENV_HINTS=1

# Enable some docker compose features
export BUILDKIT_INLINE_CACHE="1"
export COMPOSE_BAKE="true"

# Editor vars
export VISUAL="nvim"
export EDITOR="nvim"

# Language vars
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# XDG vars
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH vars
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# Go vars
export GOPATH=~/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Gimp config var
hash gimp 2>/dev/null && export GIMP2_DIRECTORY="$XDG_CONFIG_HOME/gimp"

