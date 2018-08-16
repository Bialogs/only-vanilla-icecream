# bash_profile
# ------------------------------------
# Some portions courtousey of alias.sh
# ------------------------------------

# ---------------------
# Environment Variables
# ---------------------

  export GPG_TTY=$(tty)

  export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

  export EDITOR='/usr/local/bin/subl -w'

# -------
# Aliases
# -------
  # np: remove proxy environment variables for use off-network
  alias np="unset http_proxy;unset HTTP_PROXY;unset RSYNC_PROXY;unset HTTPS_PROXY;unset https_proxy; unset no_proxy"

  # pp: export proxy environment variables for use on-network
  alias pp='export http_proxy="";export https_proxy="";export HTTP_PROXY="";export HTTPS_PROXY=""; export no_proxy="127.0.0.1, *.local, 169.254/16, *."'

  # shrs: shell reset
  alias shrs="exec $SHELL -l"

  # la: list all
  alias la="ls -a"

  # mv: moves interactively (prevents overwrites) and shows the file names and directories after moving
  alias mv="mv -iv"

  # cp: copies interactively (prevents overwrites) and shows the file names and directories after moving
  alias cp="cp -iv"

  # finder: opens current directory in Finder
  alias finder="open -a Finder ./"

  # gitlog: compact and colorized git log
  alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

  #gitme-remote-branches: Retrieve all remote git branches
  alias gitme-remote-branches='for remote in `git branch -r`; do git branch --track $remote; done'

# -----
# Misc.
# -----
  # Start *env
  eval "$(rbenv init -)"
  eval "$(jenv init -)"
  eval "$(pyenv init -)"

  # Homebrew command tab-completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # Git command tab-completion
  if [ -f /usr/local/etc/bash_completion.d ]; then
    . ~/.git-completion.bash
  fi

# ----
# PATH
# ----
  export PATH="/usr/local/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"

# --------
# Commands
# --------
  # trash: move a file to the MacOS trash
  trash () { command mv "$@" ~/.Trash ; }

  # zipf: create a .zip archive of a folder
  zipf () { zip -r "$1".zip "$1" ; }

  # extract: extract archives with a single command
  extract() {
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)  tar xjf $1    ;;
        *.tar.gz)   tar xzf $1    ;;
        *.bz2)    bunzip2 $1    ;;
        *.rar)    unrar e $1    ;;
        *.gz)   gunzip $1   ;;
        *.tar)    tar xf $1   ;;
        *.tbz2)   tar xjf $1    ;;
        *.tgz)    tar xjf $1    ;;
        *.zip)    unzip $1    ;;
        *.Z)    uncompress$1  ;;
        *.7z)   7z x $1     ;;
        *)      echo "'$1' cannot be extracted with extract()"  ;;
      esac
    else
      echo "'$1' is not a valid file"
    fi
  }

  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
