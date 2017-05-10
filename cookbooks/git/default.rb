package 'git'
package 'tig'
package 'gibo'
package 'gnupg2'

## Git

link File.expand_path('~/.gitconfig') do
  to File.expand_path('../files/.gitconfig', __FILE__)
end

template File.expand_path('~/.gitconfig.local') do
  source File.expand_path('../templates/.gitconfig.local.erb', __FILE__)
  not_if "test -f ~/.gitconfig.local"
end

link File.expand_path('~/.git_commit_messages') do
  to File.expand_path('../files/.git_commit_messages', __FILE__)
end

link File.expand_path('~/.config/git') do
  to File.expand_path('../files/.config/git', __FILE__)
end

## tig

link File.expand_path('~/.tigrc') do
  to File.expand_path('../files/.tigrc', __FILE__)
end

## gnupg2

directory File.expand_path('~/.gnupg')

link File.expand_path('~/.gnupg/gpg-agent.conf') do
  to File.expand_path('../files/.gnupg/gpg-agent.conf', __FILE__)
end
