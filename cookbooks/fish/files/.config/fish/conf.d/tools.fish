## ghq
set -x GHQ_ROOT $HOME/ghq/src

## ghg
if [ -d "$HOME/.ghg/bin" ]
  set -x PATH $PATH $HOME/.ghg/bin
end

## gpg agent
set -x GPG_TTY (tty)

if not pgrep gpg-agent > /dev/null
  eval (gpg-agent --daemon)
end

if [ -f $HOME/.gpg-agent-info ]
  source $HOME/.gpg-agent-info
end

## diff-highlight
if [ -d "/usr/local/opt/git/share/git-core/contrib/diff-highlight" ]
  set -x PATH /usr/local/opt/git/share/git-core/contrib/diff-highlight $PATH
end
if [ -d "/usr/share/git/diff-highlight" ]
  set -x PATH /usr/share/git/diff-highlight $PATH
end
if [ -d "/home/linuxbrew/.linuxbrew/opt/git/share/git-core/contrib/diff-highlight" ]
  set -x PATH /home/linuxbrew/.linuxbrew/opt/git/share/git-core/contrib/diff-highlight $PATH
end

## go
set -x GOPATH $HOME/go
if [ -d "$GOPATH/bin" ]
  set -x PATH $PATH $GOPATH/bin
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
set -x FZF_DEFAULT_OPTS '--ansi --height 40% --reverse --border'

## rust
set -x CARGO_HOME $HOME/.cargo
if [ -d "$CARGO_HOME/bin" ]
  set -x PATH $PATH $CARGO_HOME/bin
end

## direnv
eval (direnv hook fish)

## python
if [ -d /usr/local/opt/python/libexec/bin/ ]
  set -x PATH /usr/local/opt/python/libexec/bin/ $PATH
end
set USER_BASE_PATH (python -m site --user-base)
if [ -d "$USER_BASE_PATH/bin" ]
  set -x PATH $PATH $USER_BASE_PATH/bin
end

## nodenv
if [ -d "$HOME/.nodenv" ]
  set -x PATH $HOME/.nodenv/shims $PATH
end

## krew
if [ -d "$HOME/.krew/bin" ]
  set -x PATH $PATH $HOME/.krew/bin
end

## Linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]
  set -x PATH /home/linuxbrew/.linuxbrew/bin $PATH
end

## asdf
if [ -f "/usr/local/opt/asdf/asdf.fish" ]
  source /usr/local/opt/asdf/asdf.fish
end
