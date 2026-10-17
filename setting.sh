autoload -Uz compinit
compinit

autoload -Uz colors vcs_info
colors
setopt PROMPT_SUBST

precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{cyan}[%b]%f'

PROMPT='%F{magenta}%1~%f${vcs_info_msg_0_} %F{white}▶▶%f '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
chmod g-w /opt/homebrew/share/zsh /opt/homebrew/share/zsh/site-functions 2>/dev/null
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Quick navigation to GitHub projects
alias github='cd /Users/vineet/code/personal/github'
export PATH="$HOME/.local/bin:$PATH"
