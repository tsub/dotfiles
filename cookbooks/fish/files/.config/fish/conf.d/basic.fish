export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export PAGER="less"
export LESS="-g -i -M -R -S -W -z-4 -x4"
if [ -d "$HOME/.bin" ]
  export PATH="$HOME/.bin:$PATH"
end

## Set Locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
