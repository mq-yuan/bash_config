# IMMEDIATELY LOAD
# set up navi
navi_init() {
  eval "$(navi widget bash)"
  unset -f navi_init
}
navi() {
  navi_init
  command navi "$@"
}

# set up rust
rust_init() {
  if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
  fi
  unset -f rust_init
  unset -f cargo rustc rustup rust-analyzer
}
cargo() {
  rust_init
  command cargo "$@"
}
rustc() {
  rust_init
  command rustc "$@"
}
rustup() {
  rust_init
  command rustup "$@"
}
rust-analyzer() {
  rust_init
  command rust-analyzer "$@"
}

# set nix
nix_init() {
    if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then 
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"
    fi
    unset -f nix_init
}
nix() {
  nix_init
  command nix "$@"
}
nix-shell() {
  nix_init
  command nix-shell "$@"
}
nix-env() {
  nix_init
  command nix-env "$@"
}
nix-build() {
  nix_init
  command nix-build "$@"
}
nix-channel() {
  nix_init
  command nix-channel "$@"
}

# set up conda
conda_init() {
  __conda_setup="$('$HOME/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
          . "$HOME/miniforge3/etc/profile.d/conda.sh"
      else
          export PATH="$HOME/miniforge3/bin:$PATH"
      fi
  fi
  unset __conda_setup

  if [ -f "$HOME/miniforge3/etc/profile.d/mamba.sh" ]; then
      . "$HOME/miniforge3/etc/profile.d/mamba.sh"
  fi
  unset -f conda_init
}
conda() {
  conda_init
  conda "$@"
}
mamba() {
  conda_init
  mamba "$@"
}

# set up NVM
nvm_init() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  unset -f nvm_init
}
nvm() {
  nvm_init
  command nvm "$@"
}
node() {
  nvm_init
  command node "$@"
}
npm() {
  nvm_init
  command npm "$@"
}

