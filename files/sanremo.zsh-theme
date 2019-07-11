# sanremo
# Based on sorin.zsh-theme


if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  
  # Vim mode indicator
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  
  # Turns the right prompt chevron red if last command returns an error
  local return_status="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})"

  # Left prompt pattern: current_directory:current_git_branch
  PROMPT='%B%{$fg[cyan]%}%6(~:../:)%6~$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} %b'

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}:"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  
  # Shows only a red ✘ in case the git repo is dirty.
  # I dont think more information is needed at the prompt
  # If you want to know more, you could aways use 'git status'
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✘%{$reset_color%}"

  # Right Prompt pattern
  RPROMPT="%1(j.%j.) ${return_status}❮ %{$fg[cyan]%}%D{%d/%m/%y-%H:%M:%S}%{$reset_color%}"

else
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"

  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi
