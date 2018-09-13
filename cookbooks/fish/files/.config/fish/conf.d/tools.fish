## ghq
export GHQ_ROOT="$HOME/ghq/src"

## ghg
if [ -d "$HOME/.ghg/bin" ]
  export PATH="$PATH:$HOME/.ghg/bin"
end

## gpg agent
export GPG_TTY=(tty)

if not pgrep gpg-agent > /dev/null
  eval (gpg-agent --daemon)
end

if [ -f $HOME/.gpg-agent-info ]
  source $HOME/.gpg-agent-info
end

## diff-highlight
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

## go
export GOPATH="$HOME/ghq"
if [ -d "$GOPATH/bin" ]
  export PATH="$PATH:$GOPATH/bin"
end

## gcloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'
end

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc'
end

## fzf
export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --border'

## rust
export CARGO_HOME="$HOME/.cargo"
if [ -d "$CARGO_HOME/bin" ]
  export PATH="$PATH:$CARGO_HOME/bin"
end

## direnv
eval (direnv hook fish)
