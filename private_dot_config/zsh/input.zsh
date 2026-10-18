# omitted: / ( ) _ - =
# added: " '
export WORDCHARS="*?.[]~&;!#$%^{}<>'\""

# https://unix.stackexchange.com/questions/5293/how-do-i-jump-to-the-next-or-previous-word-with-ctrl-arrow-keys-in-a-console
# Enable Ctrl+arrow key bindings for word jumping
bindkey '^[[1;5C' forward-word     # Ctrl+right arrow
bindkey '^[[1;5D' backward-word    # Ctrl+left arrow


# https://github.com/zsh-users/zsh-history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
