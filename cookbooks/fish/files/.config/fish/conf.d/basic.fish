set -x EDITOR nvim
set -x XDG_CONFIG_HOME $HOME/.config
set -x PAGER less
set -x LESS "-g -i -M -R -S -W -z-4 -x4 -X"
if [ -d "$HOME/.bin" ]
  fish_add_path $HOME/.bin
end
if [ -d "/usr/local/bin" ]
  fish_add_path /usr/local/bin
end
if [ -d "/usr/local/sbin" ]
  fish_add_path /usr/local/sbin
end
if [ -d "/opt/homebrew/bin" ]
  fish_add_path /opt/homebrew/bin
end

## Set Locale
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LANG en_US.UTF-8
