# Append a directory to the PATH if it exists and is not already in PATH
path_append() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$PATH:$1"
    fi
}

# Prepend a directory to the PATH if it exists and is not already in PATH
path_prepend() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}

path_remove() {
  local pattern="$1"
  PATH=$(echo -n "$PATH" | awk -v RS=: -v pattern="$pattern" '
    $0 !~ pattern {printf "%s%s", s, $0; s=RS}
    END {printf "\n"}
  ')
  export PATH
}


# set up CUDA
cuda() {
  local version="${1:-12.8}"
  local cuda_dir="/usr/local/cuda-${version}"
  
  # Validate CUDA installation
  if [ ! -d "${cuda_dir}" ]; then
    echo "CUDA ${version} not found at ${cuda_dir}" >&2
    return 1
  fi

  # Clean existing CUDA paths using your existing path functions
  path_remove "/usr/local/cuda-[0-9.]*/bin"
  path_remove "/usr/local/cuda-[0-9.]*/lib64"
  path_remove "/usr/local/cuda-[0-9.]*/lib"

  # Set new paths using your existing pathprepend function
  path_prepend "${cuda_dir}/bin"
  path_prepend "${cuda_dir}/lib64"
  path_prepend "${cuda_dir}/lib"

  # Configure environment variables
  export CUDA_HOME="${cuda_dir}"
  export LD_LIBRARY_PATH="${cuda_dir}/lib64:${cuda_dir}/lib:${LD_LIBRARY_PATH}"
  export CPATH="${cuda_dir}/include:${CPATH}"

  # Maintain WSL-specific paths from your original setup
  export LIBRARY_PATH="/usr/lib/wsl/lib:${LIBRARY_PATH}"
  
  # Verify configuration
  if command -v nvcc &>/dev/null; then
    echo "CUDA ${version} configured (nvcc $(nvcc --version | grep release))"
  else
    echo "CUDA ${version} paths set but nvcc not found!" >&2
    return 1
  fi
}

