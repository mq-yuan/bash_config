# load api key
if [ -t "$HOME/.bashrc.d/.api_key" ]; then
  export $(grep -v '^#' "$HOME/.bashrc.d/.api_key" | xargs)
fi

# set huggingface model
# export HF_ENDPOINT="https://hf-mirror.com"
