#!/bin/bash

function pumad() {
  if [ ! -f Gemfile ]; then
    echo "Are you sure you're in a Ruby on Rails app?"
  else
    if [ ! -d ~/.puma-dev/"$(basename `pwd`)" ]; then
      ln -s "$(pwd)" ~/.puma-dev/"$(basename `pwd`)"
      puma-dev -install
      echo "Your app should be available at http://$(basename `pwd`).dev and https://$(basename `pwd`).dev now!"
    else
      echo "Already linked $(basename `pwd`)."
    fi
  fi
}

function unpumad() {
  unlink ~/.puma-dev/"$(basename `pwd`)"
  echo "Unlink $(basename `pwd`)."
}

function restartpumad() {
  pkill -USR1 puma-dev
}
