# ~/.config/fish/conf.d/02-path.fish
set -l os (uname)
if test $os = "Linux"
    fish_add_path /home/linuxbrew/.linuxbrew/bin/
else if test $os = "Darwin"
    fish_add_path /opt/homebrew/bin
end
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
