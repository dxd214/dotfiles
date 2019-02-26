
export TERM="xterm-256color"

# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
export EDITOR='nvim'


# golang env
export GOROOT=/usr/local/opt/go/libexec
# GOPATH为上面创建的目录路径
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# MonkeyDev path
export MonkeyDevDeviceIP=
export PATH=/opt/MonkeyDev/bin:$PATH
export MonkeyDevPath=/opt/MonkeyDev

# theos
export THEOS=/opt/theos 
export PATH=/opt/theos/bin/:$PATH



# Flutter
export PATH="/Users/mervin/development/flutter/bin:$PATH"

# NVM
export NVM_DIR="/Users/mervin/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm() { . "$NVM_DIR/nvm.sh" ; nvm $@ ; }
export PATH=/Users/mervin/.nvm/versions/node/v10.14.1/bin/:$PATH
## 启动时通过更改node 版本号加载，减少启动时间


# Rust
export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
source $HOME/.cargo/env


# QT
export PATH="/usr/local/opt/qt/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"


# fzf
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tmuxinator
#
source ~/.tmuxinator/completion/tmuxinator.zsh
alias mux=tmuxinator


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
alias sp='swift package'


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

# Proxy
alias hproxy="export http_proxy=http://127.0.0.1:7777;export https_proxy=http://127.0.0.1:7777"

# Cargo
alias cr='cargo run'
alias cf='cargo fmt'
