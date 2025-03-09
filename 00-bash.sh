# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups  # Avoid duplicate commands and commands starting with a space
HISTSIZE=10000                    # Increase history size
HISTFILESIZE=20000                # Increase history file size
HISTTIMEFORMAT="%F %T "           # Add timestamp

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize             # Check window size
shopt -s autocd 2> /dev/null      # Allow direct input of directory names to change directories
shopt -s dirspell 2> /dev/null    # Automatically correct directory name spelling errors
shopt -s cdspell 2> /dev/null     # Automatically correct spelling errors in the cd command

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
