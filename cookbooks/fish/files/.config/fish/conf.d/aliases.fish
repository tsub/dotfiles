## Aliases
if [ -x "$(command -v nvim)" ]; alias vi="nvim"; end
if [ -x "$(command -v nvim)" ]; alias vim="nvim"; end
if [ -x "$(command -v hub)" ]; alias git="hub"; end
alias diff="diff -u"
alias ctags="/usr/local/bin/ctags"
alias deckset="open -a Deckset"
alias rm="rm -i"
alias zatsu="memo edit zatsu.md"
if [ -x "$(command -v eza)" ]; alias ls="eza --icons"; end
alias ghqg="$GOPATH/bin/get -shallow -unshallow ghq"
alias tig="env TERM=xterm-256color tig"

## Abbreviations
abbr -a b "bundle"
abbr -a v "vagrant"
abbr -a k "kubectl"
abbr -a kc "kubectl ctx"
abbr -a kn "kubectl ns"
abbr -a ks "kubesec"
abbr -a kp "kube-prompt"
abbr -a d "docker"
abbr -a dc "docker compose"
abbr -a tf "terraform"
abbr -a tg "terragrunt"
abbr -a be "bundle exec"
abbr -a bb "brew bundle"
abbr -a gcoo "git-branch-fzf"
abbr -a docker-stop "docker ps -aq | xargs docker stop"
abbr -a docker-rm "docker ps -aq | xargs docker rm -f"
abbr -a docker-rmi "docker images -f dangling=true -q | xargs docker rmi -f"
abbr -a p "phantom"
abbr -a cc "ccmanager"
