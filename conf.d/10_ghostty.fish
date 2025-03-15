# ~/.config/fish/conf.d/10-ghostty.fish

if set -q GHOSTTY_RESOURCES_DIR
    set -gx GHOSTTY_SHELL_INTEGRATION_FEATURES auto-status,graftin,transient-prompt,working-directory
end
