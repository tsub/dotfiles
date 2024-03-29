config_home = ENV['XDG_CONFIG_HOME'] || "#{ENV['HOME']}/.config"

node.reverse_merge!(
  alacritty: {
    home: config_home + '/alacritty'
  },
  kitty: {
    home: config_home + '/kitty'
  },
  fish: {
    home: config_home + '/fish'
  },
  neovim: {
    home: config_home
  },
  ghg: {
    version: '0.1.4'
  },
  gopath: ENV['GOPATH'] || "#{ENV['HOME']}/go"
)

include_recipe '../cookbooks/pacman'
include_recipe '../cookbooks/aur'
include_recipe '../cookbooks/fish'
include_recipe '../cookbooks/asdf'
include_recipe '../cookbooks/git'
include_recipe '../cookbooks/neovim'
include_recipe '../cookbooks/tmux'
include_recipe '../cookbooks/ghg'
include_recipe '../cookbooks/alacritty'
include_recipe '../cookbooks/goinstall'
include_recipe '../cookbooks/xkeysnail'
include_recipe '../cookbooks/service'
include_recipe '../cookbooks/libinput-gestures'
include_recipe '../cookbooks/albert'
include_recipe '../cookbooks/rofi'
include_recipe '../cookbooks/greenclip'
include_recipe '../cookbooks/kitty'
include_recipe '../cookbooks/hyper'
