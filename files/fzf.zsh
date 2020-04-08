# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lucas.bento/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lucas.bento/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lucas.bento/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/lucas.bento/.fzf/shell/key-bindings.zsh"
