
export TERM="xterm-256color"

# zprezto
source "${ZDOTDIR:-$HOME}/dotfiles/prezto/init.zsh"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases
alias vim=nvim
alias c=clear
alias .='open .'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias l='ls -alF'
alias ll='ls -l'
# alias vi='vim'
alias which='type -p'

# Git
alias ga='git add'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout master'
alias gcd='git checkout develop 2>/dev/null || git checkout master'
alias gcl='git clone --recursive'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcmsg='git commit -m'
alias gmd='git merge origin/develop'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsuir='git submodule update --init --recursive'
alias gpl='git pull -p'
alias gpo='git push origin'
alias gpot='git push origin --tags'
alias gpom='git push origin master'


# golang env
#
export GOROOT=/usr/local/opt/go/libexec

# GOPAT为上面创建的目录路径

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# MonkeyDev path
#
export MonkeyDevDeviceIP=
export PATH=/opt/MonkeyDev/bin:$PATH
eval "$(rbenv init -)"

# fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmuxinator
#
source ~/.tmuxinator/completion/tmuxinator.zsh
alias mux=tmuxinator


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/python@2/bin:$PATH"
