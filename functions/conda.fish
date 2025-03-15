# ~/.config/fish/functions/conda.fish
# 3. Conda Initialization - Lazy Loading
# A function to initialize conda when needed, avoiding it on shell startup.
# This function removes itself after the first call, ensuring it only runs once[4].
function conda --description 'Initialize and run conda'
    # Check if conda is installed at the expected path
    if test -f /Users/mqyuan/miniforge3/bin/conda
        /Users/mqyuan/miniforge3/bin/conda "shell.fish" "hook" | source
        # After sourcing, execute the given conda command
        conda $argv
    else
        echo "Miniforge3 not found at /Users/mqyuan/miniforge3/bin/conda"
    end
    functions --erase conda #Remove this function after it runs
end
