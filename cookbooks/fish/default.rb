package 'fish'
package 'fisherman/tap/fisherman'

## fish

directory node[:fish][:home]

## fisherman

link File.expand_path('~/.config/fish/fishfile') do
  to File.expand_path('../files/.config/fish/fishfile', __FILE__)
end

execute 'fisher'
