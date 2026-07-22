#!/usr/bin/zsh

# Load pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zi for \
    atload"zicompinit; zicdreplay" \
    blockf \
    lucid \
    wait \
  zsh-users/zsh-completions

# banner
print -P "%F{39}\u2726$f"


# OMZ completion-style
zstyle ':completion:*' menu select

zstyle :prompt:pure:path color '#ea9b2c'
zstyle :prompt:pure:prompt:success color '#29dcfb'
zstyle :prompt:pure:prompt:error color '#e13f00'
zstyle :prompt:pure:execution_time color '#d9c68d'
zstyle :prompt:pure:git:dirty color '#0098ff'

# Plugin loaded with investigating.
zi light zdharma-continuum/history-search-multi-word
zi light zdharma-continuum/fast-syntax-highlighting
zi light zsh-users/zsh-history-substring-search

# History
# -------

# https://unix.stackexchange.com/questions/389881/history-isnt-preserved-in-zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Do not query the user before executing ‘rm *’ or ‘rm path/*’.
setopt appendhistory RM_STAR_SILENT

# scrollable less output with a wheel
export LESS=-R

export EDITOR=vim

#xmodmap "$HOME/.Xmodmap"
