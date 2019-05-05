# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lucas/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lucas/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lucas/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/lucas/.fzf/shell/key-bindings.zsh"
