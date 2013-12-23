# bash_profile
# ---------------------
# Environment Variables
# ---------------------
# 	///////////\
#	- Projects
# 	\\\\\\\\\\\/
	export JAVA_HOME="/usr/libexec/java_home"
	export OPENSEXTANT_HOME="/Users/kfagan/Documents/GeotaggingFrameworks/opensextant/trunk"
	export GATE_HOME="/Users/kfagan/Documents/GeotaggingFrameworks/opensextant/trunk/OpenSextantToolbox/gate"
	export SOLR_HOME="/Users/kfagan/Documents/GeotaggingFrameworks/opensextant/trunk/SolrTextTagger"
# 	//////////////////////\
# 	- Proxy Configuration
# 	\\\\\\\\\\\\\\\\\\\\\\/
	export http_proxy="  "
	export https_proxy="  "
	export HTTP_PROXY="  "
	export HTTPS_PROXY="  "
# 	///////////////////////\
# 	- Editor Configuration
# 	\\\\\\\\\\\\\\\\\\\\\\\/
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

# -----
# Misc.
# -----
	eval "$(rbenv init -)"

# ----
# PATH
# ----
	export PATH=$PATH:~/bin
	export PATH="$HOME/.rbenv/bin:$PATH"

# --------
# Commands
# --------
	# trash: move a file to the MacOS trash
	trash () { command mv "$@" ~/.Trash ; }
