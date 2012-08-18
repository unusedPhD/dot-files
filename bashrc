# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set defaults
export EDITOR=vim

##########################################################################
# set colors
##########################################################################

# Text Colour Reset
NC='\033[0m'	

# Regular Colors
Black='\033[0;30m'
Red='\033[0;31m'  
Green='\033[0;32m' 
Yellow='\033[0;33m' 
Blue='\033[0;34m' 
Purple='\033[0;35m'
Cyan='\033[0;36m'  
White='\033[0;37m'  
Grey='\033[0;90m'

# Bold
BBlack='\033[1;30m'
BRed='\033[1;31m'   
BGreen='\033[1;32m'  
BYellow='\033[1;33m'  
BBlue='\033[1;34m' 
BPurple='\033[1;35m'
BCyan='\033[1;36m'   
BWhite='\033[1;37m'   

# Underline
UBlack='\033[4;30m'
URed='\033[4;31m' 
UGreen='\033[4;32m'
UYellow='\033[4;33m'
UBlue='\033[4;34m'  
UPurple='\033[4;35m' 
UCyan='\033[4;36m'  
UWhite='\033[4;37m'  

# Background
On_Black='\033[40m'
On_Red='\033[41m'   
On_Green='\033[42m' 
On_Yellow='\033[43m' 
On_Blue='\033[44m'  
On_Purple='\033[45m' 
On_Cyan='\033[46m'    
On_White='\033[47m'    

# High Intensty
IBlack='\033[0;90m' 
IRed='\033[0;91m' 
IGreen='\033[0;92m'
IYellow='\033[0;93m'
IBlue='\033[0;94m'  
IPurple='\033[0;95m' 
ICyan='\033[0;96m' 
IWhite='\033[0;97m' 

# Bold High Intensty
BIBlack='\033[1;90m' 
BIRed='\033[1;91m'  
BIGreen='\033[1;92m' 
BIYellow='\033[1;93m' 
BIBlue='\033[1;94m'  
BIPurple='\033[1;95m' 
BICyan='\033[1;96m'  
BIWhite='\033[1;97m'  

# High Intensty backgrounds
On_IBlack='\033[0;100m'
On_IRed='\033[0;101m' 
On_IGreen='\033[0;102m'
On_IYellow='\033[0;103m'
On_IBlue='\033[0;104m'  
On_IPurple='\033[10;95m'
On_ICyan='\033[0;106m'
On_IWhite='\033[0;107m'

##########################################################################
# Aliases
##########################################################################

# Add an "alert" alias for long running commands.  Usage ==> sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias h='history | grep $1'
alias tetris='bastet' 

# aliases for git
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gh='git hist'

# alias for apt
alias aptsearch='apt-cache search'
alias aptinstall='sudo apt-get install'
alias aptstats='apt-cache stats'
alias aptgetkey='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'
alias autoremove='sudo apt-get autoremove'
alias check='sudo apt-get check'
alias dist-upgrade='sudo apt-get dist-upgrade'
alias update='sudo apt-get update && sudo apt-get upgrade'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias c='clear'
alias q='exit'
alias :q='exit'
alias reboot='sudo /sbin/reboot'
alias reload='source ~/.bashrc; clear'
alias df='df -kTh'
alias more='less'
alias vi='vim'
alias wget='wget -c'
alias slist='sudo vim /etc/apt/sources.list'
alias ls_functions='grep ^function ~/.bashrc'

# common mispelled commands
alias xs='cd'
alias vf='cd'
alias got='git '
alias get='git '
alias claer="clear"
alias clera="clear"
alias findgrep='grepfind'
alias mann='man'
alias updtae='update'
alias vmi='vim'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# advanced ls functions
alias l="clear; ls -1"
alias la='ls -A'
alias ll='ls -l'
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al | more'   # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias tree='tree -Csu'     # nice alternative to 'recursive ls'

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

##########################################################################
# Functions
##########################################################################

function ds(){ # Size of directories in MB
    echo "size of directories in MB"
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "you did not specify a directy, using pwd"
        DIR=$(pwd)
        find $DIR -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    else
        find $1 -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    fi
}

lls() { # Counts files, subdirectories and directory size and displays details about files
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type f | wc -l | tr -d '[:space:]'` files>"  # count files
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d '[:space:]'` dirs/>"  # count sub-directories
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type l | wc -l | tr -d '[:space:]'` links@>" # count links
	echo " <~`du -sh . 2> /dev/null | cut -f1`>"	                                         # total disk space used by this directory and all subdirectories
	ROWS=`stty size | cut -d' ' -f1`
	FILES=`find . -maxdepth 1 -mindepth 1 |
	wc -l | tr -d '[:space:]'`
	ls -hlAF --group-directories-first
}

function cp_prog(){ # cp with progress bar (using pv)
	if [ `echo "$2" | grep ".*\/$"` ]; then
		pv "$1" > "$2""$1"
	else
		pv "$1" > "$2"/"$1"
	fi
}

function cpg(){ # copy and go to dir
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

function mvg(){ # move and go to dir
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
} 

function swap(){ # swap 2 filenames around, if they exist
	local TMPFILE=tmp.$$
	[ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
	[ ! -e $1 ]  && echo "swap: $1 does not exist"  && return 1
	[ ! -e $2 ]  && echo "swap: $2 does not exist"  && return 1
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

function findit(){ # find a file with pattern in name
	if [ -z ${1} ];then
		echo "Please pass an argument that you want to search for"
	else
		find . -iname "*$1*" -print
	fi
}

function grepp(){ # grep by paragraph instead of by line
	[ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";
}

function apt-history(){ # show apt log history
	case "$1" in
		install)
			cat	/var/log/dpkg.log | grep 'install '
			;;
		upgrade|remove)
			cat /var/log/dpkg.log | grep $1
			;;
		rollback)
			cat /var/log/dpkg.log | grep upgrade | \
			grep "$2" -A10000000 | \
			grep "$3" -B10000000 | \
			awk '{print $4"="$5}'
			;;
		*)
			cat /var/log/dpkg.log
			;;
	esac
}

function top10(){ # top10 history commands
	history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; 
}

function stopwatch(){ # keep track of elapsed time
	BEGIN=$(date +%s)
	while true; do
	    NOW=$(date +%s)
	    DIFF=$(($NOW - $BEGIN))
	    MINS=$(($DIFF / 60))
	    SECS=$(($DIFF % 60))
	    echo -ne "Time elapsed: $MINS:`printf %02d $SECS`\r"
	    sleep .1
	done
}

function countdown(){ # countdown (set min), and get alert when elapsed
	case "$1" in -s) shift;; *) set $(($1 * 60));; esac 
	local S=" "; 
	for i in $(seq "$1" -1 1); do echo -ne "$S\r $i\r"; sleep 1; done; 
	echo -e "$S\rBOOM!"
	alert 
}

function note(){ # simple note-taking
	# if file doesn't exist, create it
	[ -f $HOME/.notes ] || touch $HOME/.notes
	# no arguments, print file
	if [ $# = 0 ]; then
		cat $HOME/.notes
	# clear file if "-c" flag
	elif [ $1 = -c ]; then
		> $HOME/.notes
	# add all arguments to file
	else
		echo "$@" >> $HOME/.notes
	fi
}

function ths(){ # thesaurus
	dict -d moby-thes $@; 
}

function man2pdf(){ # generates a PDF of manpages
	if(test $# != 0); then
		echo copying manpage [$1] to pdf format....
		man -t $1 > footemp.ps && ps2pdf12 footemp.ps && rm footemp.ps && mv footemp.pdf $1.pdf
		echo manpage [$1] copied to pdf format
	else
		echo man2pdf : arguments [manpage args]
	fi
}

function bak(){ # create a backup of the file
	cp $1 $1_`date +%Y%m%d%H%M`.backup
}

function extract(){ # automatically extract archives
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1     ;;
			*.tar.gz)    tar xvzf $1     ;;
			*.bz2)       bunzip2 $1      ;;
			*.rar)       unrar x $1      ;;
			*.gz)        gunzip $1       ;;
			*.tar)       tar xvf $1      ;;
			*.tbz2)      tar xvjf $1     ;;
			*.tgz)       tar xvzf $1     ;;
			*.zip)       unzip $1        ;;
			*.Z)         uncompress $1   ;;
			*.7z)        7z x $1         ;;
			*)           echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function compress(){ # create .tar.gz archive
	tar -cvzf $1 $2 
}

function tarball(){ # create a dated tar.gz archive
	name=$1; shift; tar zcvf $name-`date +%Y%m%d`.tar.gz "$@"; 
}

function pullout(){ # pull a single file out of a .tar.gz		 
	if [ $# -ne 2 ]; then
		echo "need proper arguments:"
		echo "pullout [file] [archive.tar.gz]"
		return 1
	fi
	case $2 in
		*.tar.gz|*.tgz)
		gunzip < $2 | tar -xf - $1
		;;
		*)
		echo $2 is not a valid archive
		return 1
		;;
	esac
	return 0
}

# basic encrypt / decrypt
function encry(){ gpg -ac --no-options "$1"; }
function decry(){ gpg --no-options "$1"; }

function encrypt(){ # advanced encryption / decryption
	err_title="Error"
	err_files="No file selected"
	encrypt="Encrypt"
	decrypt="Decrypt"
	file_msg="file:"
	pass_msg="Enter passphrase"

	if [ "$1" != "" ]; then
		i=1
		file=`echo "$1" | sed ''$i'!d'`
		while [ "$file" != "" ]
		do
			ext=`echo "$file" | grep [.]gpg$ 2>&1`
			if [ "$ext" != "" ]; then
				pass_decrypt=`zenity --entry --entry-text "$pass_decrypt" --hide-text --title "$pass_msg" --text "$decrypt $file_msg ${file##*/}" "" 2>&1`
				if [ "$pass_decrypt" != "" ]; then
					output=${file%.*}
					echo "$pass_decrypt" | gpg -o "$output" --batch --passphrase-fd 0 -d "$file"
				fi
			else
				pass_encrypt=`zenity --entry --hide-text --entry-text "$pass_encrypt" --title "$pass_msg" --text "$encrypt $file_msg ${file##*/}" "" 2>&1`
				if [ "$pass_encrypt" != "" ]; then
					echo "$pass_encrypt" | gpg --batch --passphrase-fd 0 --cipher-algo aes256 -c "$file"
				fi
			fi
			i=$(($i+1))
			file=`echo "$1" | sed ''$i'!d'`
		done
	else	
		zenity --error --title "$err_title" --text "$err_files"
	fi
}
alias decrypt='encrypt'

function checksum(){ # check file checksum					 
	action=$1
	shift
	if [[ ( $action == "-c" || $action == "--check" ) && $1 == *.* ]]; then
		type="${1/*./}"
	else	type=$1
		shift
	fi
	case $type in
		md5 )
			checktool=md5sum
		;;
		sha1 | sha )
			checktool=sha1sum
		;;
		sha224 )
			checktool=sha224sum
		;;
		sha256 )
			checktool=sha256sum
		;;
		sha384 )
			checktool=sha384sum
		;;
		sha512 )
			checktool=sha512sum
		;;
	esac
	case $action in
		-g | --generate )
			for file in "${@}"; do
				$checktool "${file}" > "${file}".$type
			done
		;;
		-c | --check )
			for file in "${@}"; do
				if [[ "${file}" == *.$type ]]; then
					$checktool --check "${file}"
				else	$checktool --check "${file}".$type
				fi
			done
		;;
		-h | --help )
		;;
	esac
}

function md5(){ # display MD5 value for file
	echo -n $@ | md5sum; 
}

function psls(){ # list process for current user
	ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command
}

function pp(){ # search processes and display tree  
	psls f | awk '!/awk/ && $0~var' var=${1:-".*"} ; 
}

function psgrep(){ # grep search processes
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "grep running processes"
        echo "usage: psgrep [process]"
    else
        ps aux | grep USER | grep -v grep
        ps aux | grep -i $1 | grep -v grep
    fi
}

function pskill(){ # kill by process name
	local pid pname sig="-TERM"   # Default signal.
	if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
		echo "Usage: killps [-SIGNAL] pattern"
		return;
	fi
	if [ $# = 2 ]; then sig=$1 ; fi
	for pid in $(psgrep| awk '!/awk/ && $0~pat { print $1 }' pat=${!#} ) ; do
		pname=$(psgrep | awk '$1~var { print $5 }' var=$pid )
		if ask "Kill process $pid <$pname> with signal $sig?"
			then kill $sig $pid
		fi
	done
}

function netinfo(){ # netinfo - shows network information for your system
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	/sbin/ifconfig | awk /'inet addr/ {print $4}'
	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	myip
	echo "---------------------------------------------------"
}

function myip(){
	curl "ifconfig.me"
}

function geoip(){ # geoip lookup 
	#(need geoip database: sudo apt-get install geoip-bin)
	geoiplookup $1
}

function geoiplookup(){ # geoip information
	curl -A "Mozilla/5.0" -s "http://www.geody.com/geoip.php?ip=$1" | grep "^IP.*$1" | html2text; 
}

function findtcp(){ # find an unused unprivileged TCP port
	(netstat  -atn | awk '{printf "%s\n%s\n", $4, $4}' | grep -oE '[0-9]*$'; seq 32768 61000) | sort -n | uniq -u | head -n 1
}

function port(){ # Scans a port, returns what's on it.
	lsof -i :"$1"
}

function ii(){ # Get current host related info.
	echo -e "\n${IRed}Users logged on:$NC " ; w -h
	echo -e "\n${IRed}Current date :$NC " ; date
	echo -e "\n${IRed}Machine stats :$NC " ; uptime
	echo -e "\n${IRed}Memory stats :$NC " ; free -t -m
	echo -e ; df
	echo -e "\n${IRed}Open connections :$NC "; netstat -pan --inet;
	echo -e ;
}

##########################################################################
# Random
##########################################################################

# don't put duplicate lines in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
unset HISTSIZE
unset HISTFILESIZE

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

##########################################################################
# PS1 settings
##########################################################################

# add a line of "---" and the time between each command, recalculated every time the prompt is shown in function prompt_command
fill="--- "

PS1="\[$NC\]\[$Grey\]"'$fill \t\n'"\[$BIBlue\]\w\[$NC\] \$ "

# Reset color for command output, invoked every time before a command is executed
trap 'echo -ne "\033[0m"' DEBUG

function prompt_command {
	# create a $fill of all screen width minus the time string and a space:
	let fillsize=${COLUMNS}-9
	fill=""
	while [ "$fillsize" -gt "0" ]
	do
		fill="-${fill}" # fill with underscores to work on 
		let fillsize=${fillsize}-1
	done
	# If this is an xterm set the title to user@host:dir
	case "$TERM" in
		xterm*|rxvt*)
		bname=`basename "${PWD/$HOME/~}"`
		echo -ne "\033]0;${bname} :${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
		;;
		*)
	    ;;
	esac
}

PROMPT_COMMAND=prompt_command

##########################################################################
# sourced files
##########################################################################

# enable programmable completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# source file with all path entries
if [ -f ~/.bash_path ]; then
	. ~/.bash_path
fi
