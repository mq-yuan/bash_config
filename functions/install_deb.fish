# $HOME/.config/fish/functions/install_deb.fish

function install_deb -d "Safely install a .deb package with validation and cleanup"
    # Check if argument is provided
    if test (count $argv) -ne 1
        echo "Usage: install_deb <deb-file>"
        return 1
    end

    # Validate file existence and extension
    set -l deb_file "$argv[1]"
    if not test -f "$deb_file"
        echo "Error: File '$deb_file' does not exist"
        return 1
    end
    if not string match -q "*.deb" "$deb_file"
        echo "Error: '$deb_file' is not a .deb file"
        return 1
    end

    # Create temporary directory
    set -l temp_dir (mktemp -d)
    if test $status -ne 0
        echo "Error: Failed to create temporary directory"
        return 1
    end

    # Trap to ensure cleanup
    function _cleanup -v temp_dir
        if test -d "$temp_dir"
            rm -rf "$temp_dir"
        end
    end
    trap _cleanup EXIT

    # Copy file to temporary directory
    set -l temp_deb "$temp_dir/(basename "$deb_file")"
    if not cp "$deb_file" "$temp_deb"
        echo "Error: Failed to copy .deb file to temporary directory"
        return 1
    end

    # Verify package integrity
    if not dpkg -I "$temp_deb" >/dev/null
        echo "Error: Invalid or corrupted .deb file"
        return 1
    end

    # Install package with apt to handle dependencies
    echo "Installing $deb_file..."
    if not sudo apt-get install -y "$temp_deb"
        echo "Error: Installation failed"
        return 1
    end

    echo "Successfully installed $deb_file"
    return 0
end
