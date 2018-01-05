
export TERM="xterm-256color"


# zprezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias c=clear

# golang env
export GOROOT=/usr/local/opt/go/libexec
# GOPAT为上面创建的目录路径
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# MonkeyDev path
export MonkeyDevDeviceIP=
export PATH=/opt/MonkeyDev/bin:$PATH
eval "$(rbenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# tmuxinator
source ~/.tmuxinator/completion/tmuxinator.zsh
alias mux=tmuxinator

# theme Pure
# autoload -U promptinit; promptinit
# PURE_GIT_PULL=0
# prompt pure
