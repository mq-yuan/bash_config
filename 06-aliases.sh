# File Operations
alias ll='ls -alhF --color=auto'
alias cp='cp -iv'      # Interactive copy
alias mv='mv -iv'      # Interactive move
alias rm='rm -Iv'      # Safe delete

# Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

# Quick Edit Configurations
alias vimrc='nvim ~/.config/nvim/'
alias bashrc='nvim ~/.bashrc.d/ && source ~/.bashrc'
alias autowork='cd ~/Project/autowork && conda activate auto_work'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

# some alert aliases
alias df='df -h'       
alias free='free -h'   
alias du='du -h'      
alias ip='ip -c'     

# some pkgs aliases
alias where='which'
alias nv='nvim'
alias yy='yazi'
alias lg='lazygit'
alias ag='aichat'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
