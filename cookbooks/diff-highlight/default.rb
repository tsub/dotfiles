package 'git'

execute 'make' do
  cwd '/usr/share/doc/git/contrib/diff-highlight'
  not_if 'which diff-highlight'
end

link '/usr/local/bin/diff-highlight' do
  to '/usr/share/doc/git/contrib/diff-highlight/diff-highlight'
  force true
end
