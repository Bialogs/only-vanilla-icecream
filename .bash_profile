# bash_profile
# ------------------------------------
# Some portions courtousey of alias.sh
# ------------------------------------

# ---------------------
# Environment Variables
# ---------------------
#	- Java
	# Java 8uXX
	# export JAVA_HOME=$(/usr/libexec/java_home)
	# Apache Ant
	export ANT_HOME=/usr/local/Cellar/ant/apache-ant-1.9.4/

# - Amazon Web Services
	# Amazon EC2 API Tools
	export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.6.13.0/
	# Amazon EC2 Access Key
	export AWS_ACCESS_KEY=
	# Amazon EC2 Secret Key
	export AWS_SECRET_KEY=
	# Amazon EC2 Proxy Configuration
	export EC2_JVM_ARGS="-Dhttps.proxyHost= -Dhttp.proxyHost="
	# Amazon EC2 Service Endpoint URL
	export EC2_URL= 

# - Proxy Configuration
	export http_proxy=""
	export https_proxy=""
	export HTTP_PROXY=""
	export HTTPS_PROXY=""

# - Editor Configuration
	export EDITOR=/usr/bin/nano
	
# -------
# Aliases
# -------
	# np: remove proxy environment variables for use off-network
	alias np="unset http_proxy;unset HTTP_PROXY;unset RSYNC_PROXY;unset HTTPS_PROXY;unset https_proxy"

	# pp: export proxy environment variables for use on-network
	alias pp='export http_proxy="";export https_proxy="";export HTTP_PROXY="";export HTTPS_PROXY=""'

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
	alias finder="open -a Finder ./"

	# gitlog: compact and colorized git log
	alias gitlog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

	# gitnp: remove proxy from git
	alias gitnp="git config --global --unset http.proxy; git config --global --unset https.proxy"

	# gitpp: include proxy in git
	alias gitpp="git config --global http.proxy=''; git config --global https.proxy=''"

  # : change directory to project
  alias ="cd ~/Documents/Projects/"
    
  # : change directory to project
  alias ="cd ~/Documents/Projects"

  #unsafechrome: run chrome in unsafe mode
  alias unsafechrome="open -a Google\ Chrome --args --disable-web-security"   

  #jsw: run jekyll server in watch mode
  alias jsw="jekyll serve --watch"

  #cdkinit: Sets the Chef Development Kit Ruby as default for the session.
  alias cdkinit='eval "$(chef shell-init bash)"'
    
# -----
# Misc.
# -----
  # Start RBENV
	eval "$(rbenv init -)"
	
	# Homebrew command tab-completion
	source `brew --repository`/Library/Contributions/brew_bash_completion.sh

	# Git tab-completion
	if [ -f `brew --prefix`/etc/bash_completion ]; then
	    . `brew --prefix`/etc/bash_completion
	fi

	# Start NVM
	source ~/.nvm/nvm.sh

	# Load NVM
	[ -s "~/.nvm/nvm.sh" ] && . "~/.nvm/nvm.sh"

	# Make Chef's Development Kit Ruby the default Ruby.
	# eval "$(chef shell-init bash)"

# ----
# PATH
# ----
	# export PATH=$PATH:~/bin
	export PATH="/usr/local/bin:$PATH"
	export PATH="/usr/local/sbin:$PATH"
	export PATH="$HOME/.rbenv/bin:$PATH"
	export PATH="$PATH:$EC2_HOME/bin"
	export PATH="/usr/local/packer:$PATH"

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


	# be: run commands in the context of the bundle
	be () { bundle exec $1 ; }

	# profchang: change the alwayson profile based on the arguments 
	profchang () { 
		case $1 in
			1)	if [ -e ~/Documents/VPN\ Profiles/1.xml ]; then
								rm /opt/cisco/anyconnect/profile/* ;
								cp ~/Documents/VPN\ Profiles/1.xml /opt/cisco/anyconnect/profile/ ;
							else
								echo "1 profile does not exist in correct directory." ;
							fi ;;
			2)		if [ -e ~/Documents/VPN\ Profiles/2-vpn.xml ]; then
                if [ -e /opt/cisco/anyconnect/profile/1.xml ]; then
                  echo "1 Profile Detetected..." ;
                  # Force Quit AnyConnect After Movement of Profile When 1 Was Last to Reset Settings
                  rm /opt/cisco/anyconnect/profile/*;
                  cp ~/Documents/VPN\ Profiles/2.xml /opt/cisco/anyconnect/profile/ ;
                  echo "Force quitting Cisco AnyConnect Secure Mobility Client to load new profile." ;
                  kill -9 $(ps -Ac -o pid,comm | awk '/^ *[0-9]+ Cisco AnyConnect Secure Mobility Client$/ {print $1}');
                fi
								rm /opt/cisco/anyconnect/profile/* ;
								cp ~/Documents/VPN\ Profiles/2.xml /opt/cisco/anyconnect/profile/ ;
							else
								echo "2 profile does not exist in correct directory." ;
							fi ;;
			3)	if [ -e ~/Documents/VPN\ Profiles/3.xml ]; then
                if [ -e /opt/cisco/anyconnect/profile/1.xml ]; then
                  echo "1 Profile Detetected..." ;
                  # Force Quit AnyConnect After Movement of Profile When 1 Was Last to Reset Settings
                  rm /opt/cisco/anyconnect/profile/*;
                  cp ~/Documents/VPN\ Profiles/3.xml /opt/cisco/anyconnect/profile/ ;
                  echo "Force quitting Cisco AnyConnect Secure Mobility Client to load new profile." ;
                  kill -9 $(ps -Ac -o pid,comm | awk '/^ *[0-9]+ Cisco AnyConnect Secure Mobility Client$/ {print $1}');
                fi
								rm /opt/cisco/anyconnect/profile/* ;
								cp ~/Documents/VPN\ Profiles/3.xml /opt/cisco/anyconnect/profile/ ;
							else
								echo "3 profile does not exist in correct directory." ;					
							fi ;;
			*)	echo "No profile configured for '$1'" ;;
		esac
	}
