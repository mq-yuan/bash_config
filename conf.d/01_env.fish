# ~/.config/fish/conf.d/01-env.fish
# Set env by -U to keep same for all sessions
set -U EDITOR "nvim"
set -U fish_greeting "" # define your welcome message, you can set it as "" to ban it for better startup time.
# load env config
if test -f ~/.config/fish/.env
    envsource ~/.config/fish/.env
end

