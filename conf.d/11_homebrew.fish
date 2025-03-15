# ~/.config/fish/conf.d/11_homebrew.fish
# Check for interactive session AND if Homebrew is already set up to prevent re-initialization
if status --is-interactive
    if not set -q BREW_HOME #Check if Homebrew is already initialized
        eval (/opt/homebrew/bin/brew shellenv)
    end
end
