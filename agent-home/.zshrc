# Minimal login-shell rc seeded by agent-sandbox (shell plugin).
# Edit freely; a re-init will not clobber this file.

# History: keep a generous scrollback and share it across sessions.
HISTSIZE=10000
SAVEHIST=20000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Color for ls and grep.
export CLICOLOR=1
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Safe convenience aliases.
alias ll='ls -alF'
alias la='ls -A'

# Readable colored prompt: green user@host, blue cwd. %F/%f are zsh color codes.
autoload -Uz colors && colors
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '
