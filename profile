PATH=$HOME/.rvm/bin:/usr/local/bin:/usr/local/sbin:$PATH # Add RVM to PATH for scripting
PATH=$PATH:/Applications/LibreOffice.app/Contents/MacOS # For hydra-derivatives

if [ -d ~/bin ]; then
  echo "$PATH" | grep -q "$HOME/bin:" || export PATH="$HOME/bin:$PATH"
fi

if [ -f $HOME/.inputrc ]; then
  export INPUTRC="$HOME/.inputrc"
fi

export LC_CTYPE=en_US.UTF-8
export EVENT_NOKQUEUE=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='7;31'
export JAVA_HOME='/Library/Java/Home'
export PWS="$HOME/.safe/pws"
export EDITOR='subl -w'
export VISUAL='subl -w'
export RUBYLIB=".:test:$RUBYLIB"

if [ -f /usr/local/Cellar/git/1.8.2.1/etc/bash_completion.d/git-completion.bash ]; then source /usr/local/Cellar/git/1.8.2.1/etc/bash_completion.d/git-completion.bash; fi
if [ -f ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

function __git_branch_info {
  git branch -vv 2> /dev/null | grep '^*' -m1 | sed -En "s/ +/ /pg" | cut -d ' ' -f 2,3 2> /dev/null
}
function parse_git_branch {
  git_status="$(git status 2> /dev/null)"
  if [[ ${git_status} == "" ]]; then
    return
  fi
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  git_stash="$(echo `git stash list | wc -l 2> /dev/null`)"
  if [[ ! ${git_stash} = "0" ]]; then
    stash="{${git_stash}§}"
  fi
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    state="[⚡]"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="[↑]"
    else
      remote="[↓]"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="[↕]"
  fi
  local branch=$(__git_branch_info)
  if [[ ! ${branch} =~ '' ]]; then
    echo "${branch}${remote}${state}${stash} "
  fi
}

# via http://tammersaleh.com/posts/a-better-rvm-bash-prompt
bash_prompt() {
  local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local EMK="\[\033[1;30m\]"
  local EMR="\[\033[1;31m\]"
  local EMG="\[\033[1;32m\]"
  local EMY="\[\033[1;33m\]"
  local EMB="\[\033[1;34m\]"
  local EMM="\[\033[1;35m\]"
  local EMC="\[\033[1;36m\]"
  local EMW="\[\033[1;37m\]"

  # background colors
  local BGK="\[\033[40m\]"
  local BGR="\[\033[41m\]"
  local BGG="\[\033[42m\]"
  local BGY="\[\033[43m\]"
  local BGB="\[\033[44m\]"
  local BGM="\[\033[45m\]"
  local BGC="\[\033[46m\]"
  local BGW="\[\033[47m\]"

  local UC=$W                 # user's color
  [ $UID -eq "0" ] && UC=$R   # root's color

  PS1="$G# \w $R\$(parse_git_branch)$B\$(~/.rvm/bin/rvm-prompt v p g)${NONE} $ "
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/bin/bash_completion.d/project ]; then source ~/bin/bash_completion.d/project; fi

function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi
  osascript -e "tell application \"Terminal\" to set current settings of front window to settings set \"$NAME\""
}

bash_prompt
unset bash_prompt

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
