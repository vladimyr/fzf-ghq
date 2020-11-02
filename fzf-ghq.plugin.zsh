_ghq_look() {
  ghq list | fzf +m -q "$1" \
    --preview-window up \
    --preview "glow -p -s dark \$(ghq root)/{}/README.md 2> /dev/null ||
               echo 'No README file found'"
}

function fzf-ghq-widget() {
  local repo
  repo=$(_ghq_look "$LBUFFER")

  if [[ -n $repo ]]; then
    BUFFER="cd $(ghq root)/$repo"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N fzf-ghq-widget
bindkey "^g" fzf-ghq-widget
