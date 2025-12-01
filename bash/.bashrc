#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. /usr/share/git/completion/git-completion.bash
. /usr/share/git/completion/git-prompt.sh

alias ls='ls -l  --color=auto'
alias la='ls -la --color=auto'
alias gs='git status'
alias grep='grep --color=auto'
alias ff='fastfetch'
alias py='python3'

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 "(%s) ")';
PROMPT_DIRTRIM=1
PS1='\w ${PS1_CMD1}\$ '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
