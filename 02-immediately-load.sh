# INIT LOAD

# starship
eval "$(starship init bash)"

# set up brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set up fzf
eval "$(fzf --bash)"


# set up zoxide
eval "$(zoxide init bash)"

# set up direnv
eval "$(direnv hook bash)"

# open ssh agent
if [ -z "$SSH_AUTH_SOCK" ] || ! ps -p $SSH_AGENT_PID > /dev/null; then
  eval "$(ssh-agent -t 3600 -s)" > /dev/null
fi
