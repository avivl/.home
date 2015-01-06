# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Never know when you're gonna need to popd!
setopt AUTO_PUSHD
#
# # Allow completing of the remainder of a command
bindkey "^N" insert-last-word
#
# # Show contents of directory after cd-ing into it
chpwd() {
   ls -lrthG
}
#
#   # Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef
#

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ack='ag --nogroup --nocolor --column --smart-case'
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx pip python brew django ssh-agent golang git-hubflow docker tugboat virtualenvwrapper )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:$PATH:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/local/bin:~/bin/:~/android-sdks/platform-toolsi:~/Development/oclint/bin


export DISABLE_AUTO_TITLE=true

# Add RVM to PATH for scripting
#export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
source /usr/local/bin/aws_zsh_completer.sh
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
source ~/.zsh/functions
source /usr/local/Cellar/todo-txt/2.9/etc/bash_completion.d/todo_completion complete -F _todo t
source ~/.zsh/aliases
export EDITOR='vim'
export ANDROID_HOME=/Users/aviv/android-sdks
export ANDROID_SDK_ROOT=/Users/aviv/android-sdks
export NDK_ROOT=$ANDROID_HOME/android-ndk-r9
source ~/.rvm/gems/ruby-1.9.3-p448/gems/tmuxinator-0.6.5/completion/tmuxinator.zsh
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export TERM=screen-256color-bce 

export GOPATH=/Users/aviv/gopath/
export GOROOT=/usr/local/go
export PYTHONPATH="/Users/aviv/Github/Rounds/server/ricapi:/Users/aviv/Github/Rounds/server/libs"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper_lazy.sh
eval "$(hub alias -s)"


PATH=$PATH:$GOPATH/bin
PATH=~/google-cloud-sdk/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
fpath=(/usr/local/share/zsh-completions $fpath)
[ -s ~/.scm_breeze/scm_breeze.sh ] && source ~/.scm_breeze/scm_breeze.sh
# added by travis gem
[ -f /Users/aviv/.travis/travis.sh ] && source /Users/aviv/.travis/travis.sh
