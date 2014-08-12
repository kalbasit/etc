if [[ "${USER}" == "wmn" ]]; then
  export ENV_INIT=true
  export EDITOR=vim

  if [[ -d "${HOME}/.filesystem" ]]; then
    export MYFS="${HOME}/.filesystem"
    export PATH="${MYFS}/bin:$PATH"

    if [[ -d "${MYFS}/opt/go_appengine/goroot" ]]; then
      export GOPATH="${MYFS}/opt/go_appengine/goroot:${GOPATH}"
      export PATH="${MYFS}/opt/go_appengine/goroot/bin:${PATH}"
    fi

    if [[ -d "${MYFS}/opt/xiki/bin" ]]; then
      export PATH="${MYFS}/opt/xiki/bin:${PATH}"
    fi
  fi

  if [[ -d "${HOME}/go" ]]; then
    export GOPATH="${HOME}/go:${GOPATH}"
    export PATH="${HOME}/go/bin:${PATH}"
  fi

  if [[ -d "${HOME}/.cask/bin" ]]; then
    export PATH="${HOME}/.cask/bin:${PATH}"
    export CASK_PATH="$(dirname $(dirname $(which cask)))"
  fi

  # Load rbenv
  if [[ -d "${HOME}/.rbenv" ]]; then
    export PATH="${HOME}/.rbenv/bin:$PATH"
    eval "$(rbenv init --no-rehash - zsh)"
  fi

  # Load pyenv
  if [[ -d "${HOME}/.pyenv" ]]; then
    export PATH="${HOME}/.pyenv/bin:$PATH"
    eval "$(pyenv init --no-rehash - zsh)"
  fi

  # Color grep results
  export GREP_OPTIONS='--color=auto'
  export GREP_COLOR='1;32'

  # Load Google specific stuff
  [[ -r "${HOME}/.zshrc-google" ]] && source "${HOME}/.zshrc-google"

  # Load travis
  [[ -r "${HOME}/.travis/travis.sh" ]] && source "${HOME}/.travis/travis.sh"
fi
