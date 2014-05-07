# bash_profile
# ------------------------------------
# Some portions courtousey of alias.sh
# ------------------------------------

# ---------------------
# Environment Variables
# ---------------------
#	- Projects
	export JAVA_HOME=$(/usr/libexec/java_home)
	export ANT_HOME=/usr/local/Cellar/ant/1.9.4
	
# 	- Proxy Configuration
	# export http_proxy="  "
	# export https_proxy="  "
	# export HTTP_PROXY="  "
	# export HTTPS_PROXY="  "
# 	- Editor Configuration
	export EDITOR=/usr/bin/nano
	
# -------
# Aliases
# -------
	# np: remove proxy environment variables for use off-network
	alias np="unset http_proxy;unset HTTP_PROXY;unset RSYNC_PROXY;unset HTTPS_PROXY;unset https_proxy"

	# pp: export proxy environment variables for use on-network
	alias pp='export http_proxy="  ";export https_proxy="  ";export HTTP_PROXY="  ";export HTTPS_PROXY="  "'

	# vdau: destroy and create a new vagrant box with the vagrantfile in the working directory
	alias vdau='vagrant destroy && vagrant up'

	# shrs: shell reset
	alias shrs="exec $SHELL -l"

	# la: list all
	alias la="ls -a"

	# mv: moves interactively (prevents overwrites) and shows the file names and directories after moving
	alias mv="mv -iv"

	# cp: copies interactively (prevents overwrites) and shows the file names and directories after moving
	alias cp="cp -iv"

	# finder: opens current directory in Finder
	alias finder="open -a FInder ./"

	# gitlog: compact and colorized git log
	alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	
	# gitnp: remove proxy from git
	alias gitnp="git config --global --unset http.proxy; git config --global --unset https.proxy"

	# gitpp: include proxy in git
	alias gitpp="git config --global http.proxy=''; git config --global https.proxy=''"

# -----
# Misc.
# -----
	# Start RBENV
	eval "$(rbenv init -)"
	
	# Homebrew command tab-completion
	source `brew --repository`/Library/Contributions/brew_bash_completion.sh
	
	# Load NVM
	[ -s "/Users/kfagan/.nvm/nvm.sh" ] && . "/Users/kfagan/.nvm/nvm.sh"

# ----
# PATH
# ----
	# export PATH=$PATH:~/bin
	export PATH="/usr/local/bin:$PATH"
	export PATH="/usr/local/sbin:$PATH"
	export PATH="$HOME/.rbenv/bin:$PATH"
	export PATH="~/macports/bin:~/macports/sbin:$PATH"

# --------
# Commands
# --------
	# trash: move a file to the MacOS trash
	trash () { command mv "$@" ~/.Trash ; }

	# zipper: create a .zip archive of a folder
	zipf () { zip -r "$1".zip "$1" ; }

	#  extract: extract archives with a single command
	extract() {
		if [ -f $1 ]; then
			case $1 in
				*.tar.bz2) 	tar xjf $1		;;
				*.tar.gz) 	tar xzf $1		;;
				*.bz2)		bunzip2 $1		;;
				*.rar)		unrar e $1		;;
				*.gz)		gunzip $1		;;
				*.tar)		tar xf $1		;;
				*.tbz2)		tar xjf $1		;;
				*.tgz)		tar xjf $1		;;
				*.zip)		unzip $1		;;
				*.Z)		uncompress$1	;;
				*.7z)		7z x $1 		;;
				*)			echo "'$1' cannot be extracted with extract()"	;;
			esac
		else
			echo "'$1' is not a valid file"
		fi
	}
