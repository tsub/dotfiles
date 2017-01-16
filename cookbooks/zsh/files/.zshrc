export ZPLUG_HOME=/usr/local/opt/zplug
export ZPLUG_LOADFILE=~/.zsh/zplug.zplug

source $ZPLUG_HOME/init.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
