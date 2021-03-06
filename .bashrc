export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8
export PS1='\[\033[32m\]\u\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n$ '
export LESSCHARSET=utf-8
export HISTSIZE=50000
export "EDITOR=vim"
# export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n$ '

# git settings
source ~/git-prompt.sh
source ~/git-completion.bash
# alias
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ll='ls -lahG'
alias g='git'
alias gco='git branch | fzf | xargs git checkout'
alias gopen='git status -s | awk {'\'' print $2 '\''} | peco | xargs -o vim -p'
alias gopena='git status -s | awk {'\'' print $2 '\''} | xargs -o vim -p'
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'

# alias irb='irb --noreadline'
alias sshf='peco-sshconfig-ssh $@'
alias gore='gore --autoimport'
alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/sbin brew"

bind -x '"\C-r": peco-select-history'

## Go Env
if [ -x "`which go`" ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
  GO111MODULE=on

  export PATH="$HOME/.goenv/bin:$PATH"
  eval "$(goenv init -)"
fi

## Vim Env
#if [ -x `which vim` ];  then
#   alias view='vim -R'
#   alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#   alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#fi

## Ruby Env
if [ -e `which rbenv` ];  then
  export PATH="/usr/local/opt/ruby/bin:$PATH"
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# Python Env
 if [ -e `which pyenv` ];  then
   # export PYENV_ROOT="${HOME}/.pyenv"
   # export PATH="${PYENV_ROOT}/bin:$PATH"
   eval "$(pyenv init -)"
 fi

## peco function
function peco-select-history() {
  export LANG=C
  local CMD=`history | tail -r | sed -e 's/[ ]*[0-9]*[ ]*//' | peco --query "$READLINE_LINE"`
  if [ -n "$CMD" ] ; then
    history -s $CMD
    if type osascript > /dev/null 2>&1 ; then
      (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
    fi
  else
    # Remove the last entry, "peco-history"
    history -d $((HISTCMD-1))
  fi
}

function peco-sshconfig-ssh() {
  conf=${@:-"$HOME/.ssh/config"}
  if [ ! -e $conf ]; then
    echo "'./"$conf"' is not found"
    return
  fi

  local host=$(grep 'Host ' $conf | awk '{print $2}' | peco)
  if [ -n "$host" ]; then
      echo "ssh -F $conf $host"
      ssh -F $conf $host
  fi
}
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
