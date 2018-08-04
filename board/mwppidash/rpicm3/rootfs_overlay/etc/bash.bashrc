# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

export NCURSES_NO_UTF8_ACS=1
		
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -lash'
alias l='ls $LS_OPTIONS -lA'
alias du='du -h'
alias df='df -h'
alias vi='vim -p'
alias rm='rm -v'
alias cp='cp -v'
alias mv='mv -v'
#export GREP_OPTIONS='--color=auto'

alias  SAFE='CFLAGS="-O2 -march=core2 -fomit-frame-pointer" CXXFLAGS="-O2 -march=core2 -fomit-frame-pointer"'
alias  NORM='CFLAGS="-O2 -march=core2 -m64 -fomit-frame-pointer -funit-at-a-time" CXXFLAGS="-O2 -march=core2 -m64 -fomit-frame-pointer -funit-at-a-time"'
alias  FAST='CFLAGS="-Ofast -march=core2 -m64 -fomit-frame-pointer -funit-at-a-time -msse3 -mfpmath=sse -malign-double -maccumulate-outgoing-args -ftracer -ftree-vectorize -fpeel-loops" CXXFLAGS="-Ofast -march=core2 -m64 -fomit-frame-pointer -funit-at-a-time -msse3 -mfpmath=sse -malign-double -maccumulate-outgoing-args -ftracer -ftree-vectorize -fpeel-loops"'

alias arestart='service ympd stop; service mpd stop; service jconv stop; sleep 2s; service jconv start; sleep 5s; service mpd start; sleep 2s; service ympd start'
alias connect='jack_connect system:capture_1 jconvolver:Input.R; jack_connect system:capture_2 jconvolver:Input.L'
alias disconnect='jack_disconnect system:capture_1 jconvolver:Input.R; jack_disconnect system:capture_2 jconvolver:Input.L'
alias play0='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5'
alias play5='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-5:0'
alias play10='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-10:0'
alias play15='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-15:0'
alias play20='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-20:0'
alias play30='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-30:0'
alias play40='mplayer -ao jack:port=jconvolver -ac vorbis,mad, -af-adv force=5 -af volume=-40:0'

alias iftop="iftop -N -B -P -i eth0"
alias ntop=iftop
