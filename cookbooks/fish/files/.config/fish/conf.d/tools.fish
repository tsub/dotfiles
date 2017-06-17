## ghq
export GHQ_ROOT="$HOME/ghq/src"

## gpg agent
# pgrep -q gpg-agent or eval (gpg-agent --daemon --write-env-file $HOME/.gpg-agent-info)
# [ -f $HOME/.gpg-agent-info ] and source $HOME/.gpg-agent-info
# export GPG_AGENT_INFO
# export GPG_TTY=`tty`

## diff-highlight
export PATH="/usr/local/opt/git/share/git-core/contrib/diff-highlight:$PATH"

## go
export GOPATH="$HOME/ghq"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export GO15VENDOREXPERIMENT="1"

## gcloud

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
end

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
end

## fzf
export FZF_DEFAULT_OPTS='--ansi --height 40% --reverse --border'

## rust
export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src"
