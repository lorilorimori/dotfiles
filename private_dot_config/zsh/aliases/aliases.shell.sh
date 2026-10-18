alias tx='tar --extract --file'
alias dt='diff --text --recursive --color'
alias wget-any='wget \
  --tries 5 \
  --retry-connrefused \
  --timeout 60 \
  --waitretry 60 \
  --read-timeout 360 \
  --max-redirect 10 \
  --protocol-directories'
alias curl-any='curl \
  -L \
  --retry 5 \
  --retry-connrefused \
  --connect-timeout 60 \
  --max-time 360 \
  --retry-delay 60 \
  --max-redirs 10 \
  -O'

alias t='task'

alias v='vim'
alias fk='flatpak'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cz='chezmoi'
alias zl='zellij'

alias journalctl-last-log="sudo journalctl -b -1 -e"

alias yt='uv tool run yt-dlp --js-runtimes node --remote-components ejs:github "$@" -x --audio-quality 0 --split-chapters'
