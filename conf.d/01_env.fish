# ~/.config/fish/conf.d/01-env.fish
# Set env by -U to keep same for all sessions
set -U EDITOR "nvim"
set -U fish_greeting "" # define your welcome message, you can set it as "" to ban it for better startup time.
set -U UPDATE_LOG_FILE "$HOME/.log/update.log" # set update_log_file

# set env in Linux
set -l os (uname)
if test $os = "Linux"
    # set IM
    set -U XMODIFIERS "@im=fcitx"
    set -U QT_IM_MODULE "fcitx"
    set -U GTK_IM_MODULE "fcitx"
    # set git
    set -U XDG_CONFIG_HOME "$HOME/.config"
    # set scripts home
    set -U SCRIPTS_HOME "$HOME/Project/scripts"
end

# load env config
if test -f $HOME/.config/fish/.env.fish
    source $HOME/.config/fish/.env.fish
end


