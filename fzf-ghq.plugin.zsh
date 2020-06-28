_ghq_look() {
  ghq list | fzf +m -q "$1" \
    --preview-window up \
    --preview "bat --color=always '$root/$(printf "%s" {})/README.md'"
}

function ghq_cd() {
  local root=$(ghq root)
  local repo=$(_ghq_look "$LBUFFER")

  if [[ -n $repo ]]; then
    BUFFER="cd $root/$repo"
    zle accept-line
  fi

  zle reset-prompt
}

zle -N ghq_cd
bindkey "^g" ghq_cd
