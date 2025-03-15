# ~/.config/fish/functions/envsource.fish
function envsource -d "load env from .env"
    for line in (cat $argv | string split -n "\n" | grep -v '^#')
        set pair (string split -m 1 "=" $line)
        if test (count $pair) -eq 2
            set -gx $pair[1] $pair[2]
        end
    end
end

