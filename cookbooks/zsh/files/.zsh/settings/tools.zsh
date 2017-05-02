## anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

## ghq
export GHQ_ROOT=$HOME/ghq/src

## direnv
eval "$(direnv hook zsh)"

## gpg agent
pgrep -q gpg-agent || eval $(gpg-agent --daemon --write-env-file ${HOME}/.gpg-agent-info)
[ -f ${HOME}/.gpg-agent-info ] && source ${HOME}/.gpg-agent-info
export GPG_AGENT_INFO
export GPG_TTY=`tty`

## diff-highlight
export PATH="/usr/local/Cellar/git/2.11.0/share/git-core/contrib/diff-highlight:$PATH"

## go
export GOPATH=$HOME/ghq
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
export GO15VENDOREXPERIMENT="1"

## Load aws cli zsh completion
source /usr/local/share/zsh/site-functions/_aws

## autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
if [ -x /usr/local/bin/brew ]; then
  BREW_PREFIX=`brew --prefix`
  fpath=($BREW_PREFIX/share/zsh/functions(N) $BREW_PREFIX/share/zsh/site-functions(N) $fpath)
fi

## gcloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f ${HOME}/.google-cloud-sdk/path.zsh.inc ]; then
  source "$HOME/.google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f ${HOME}/.google-cloud-sdk/completion.zsh.inc ]; then
  source "$HOME/.google-cloud-sdk/completion.zsh.inc"
fi
