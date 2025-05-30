## ruby installed in homebrew
if [ -d "/opt/homebrew/opt/ruby/bin" ]
  fish_add_path /opt/homebrew/opt/ruby/bin
end
if [ -d "/usr/local/opt/ruby/bin" ]
  fish_add_path /usr/local/opt/ruby/bin
end

## ghq
set -x GHQ_ROOT $HOME/ghq/src

## ghg
if [ -d "$HOME/.ghg/bin" ]
  fish_add_path $HOME/.ghg/bin
end

## diff-highlight
if [ -d "/usr/local/opt/git/share/git-core/contrib/diff-highlight" ]
  fish_add_path /usr/local/opt/git/share/git-core/contrib/diff-highlight
end
if [ -d "/opt/homebrew/opt/git/share/git-core/contrib/diff-highlight" ]
  fish_add_path /opt/homebrew/opt/git/share/git-core/contrib/diff-highlight
end
if [ -d "/usr/share/git/diff-highlight" ]
  fish_add_path /usr/share/git/diff-highlight
end
if [ -d "/home/linuxbrew/.linuxbrew/opt/git/share/git-core/contrib/diff-highlight" ]
  fish_add_path /home/linuxbrew/.linuxbrew/opt/git/share/git-core/contrib/diff-highlight
end
if [ -x "/usr/share/doc/git/contrib/diff-highlight/diff-highlight" ]
  fish_add_path /usr/share/doc/git/contrib/diff-highlight/
end

## go
set -x GOPATH $HOME/go
if [ -d "$GOPATH/bin" ]
  fish_add_path $GOPATH/bin
end

## gcloud
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'
end
if [ -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc ]
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'
end
if [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc ]
  source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc'
end
if [ -f /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc ]
  source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.fish.inc'
end

## fzf
set -x FZF_DEFAULT_OPTS '--ansi --height 40% --reverse --border'

## rust
set -x CARGO_HOME $HOME/.cargo
if [ -d "$CARGO_HOME/bin" ]
  fish_add_path $CARGO_HOME/bin
end

## direnv
if which direnv > /dev/null
  eval (direnv hook fish)
end

## python
if [ -d /usr/local/opt/python/libexec/bin ]
  fish_add_path /usr/local/opt/python/libexec/bin
end
if [ -d /opt/homebrew/opt/python/libexec/bin ]
  fish_add_path /opt/homebrew/opt/python/libexec/bin
end
set USER_BASE_PATH (python3 -m site --user-base)
if [ -d "$USER_BASE_PATH/bin" ]
  fish_add_path $USER_BASE_PATH/bin
end

## nodenv
if [ -d "$HOME/.nodenv" ]
  fish_add_path $HOME/.nodenv/shims
end

## krew
if [ -d "$HOME/.krew/bin" ]
  fish_add_path $HOME/.krew/bin
end

## Linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew/bin" ]
  fish_add_path /home/linuxbrew/.linuxbrew/bin
end

## aqua
if [ -d "$HOME/.local/share/aquaproj-aqua/bin" ]
  fish_add_path $HOME/.local/share/aquaproj-aqua/bin
end

## asdf
if [ -f "$HOME/.asdf/asdf.fish" ]
  source $HOME/.asdf/asdf.fish
end

## 1password-cli shell plugins
if [ -f "$HOME"/.config/op/plugins.sh ]
  source $HOME/.config/op/plugins.sh
end

## mysql-client
if [ -d "/opt/homebrew/opt/mysql-client@5.7/bin" ]
  fish_add_path /opt/homebrew/opt/mysql-client@5.7/bin
end

## openjdk
if [ -d "/opt/homebrew/opt/openjdk/bin" ]
  fish_add_path /opt/homebrew/opt/openjdk/bin
end

# for devcontainer/cli port forwarding
if [ -d "$HOME/ghq/src/github.com/tsub/autoForward" ] && ! pgrep -fq "target/release/host" && [ -z "$REMOTE_CONTAINERS" ]
  cargo run --manifest-path "$HOME/ghq/src/github.com/tsub/autoForward/Cargo.toml" --release --bin host &> /tmp/autoforward.log &
end

# for devcontainer/cli clipboard sharing
if [ -x "$HOME/.bin/rpbcopyd" ] && ! pgrep -fq "rpbcopyd" && [ -z "$REMOTE_CONTAINERS" ]
  "$HOME/.bin/rpbcopyd -d -H 127.0.0.1"
end
