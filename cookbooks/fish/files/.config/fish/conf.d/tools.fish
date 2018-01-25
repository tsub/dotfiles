## ghq
export GHQ_ROOT="$HOME/ghq/src"

## ghg
export PATH="$PATH:$HOME/.ghg/bin"

## gpg agent
export GPG_TTY=(tty)

if not pgrep -q gpg-agent
  eval (gpg-agent --daemon)
end

if [ -f $HOME/.gpg-agent-info ]
  source $HOME/.gpg-agent-info
end

## diff-highlight
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

## go
export GOPATH="$HOME/ghq"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export GO15VENDOREXPERIMENT="1"

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
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
export PATH="$PATH:$HOME/.cargo/bin"

## direnv
eval (direnv hook fish)
