directory File.expand_path('~/.claude') do
  user node[:user]
end

link File.expand_path('~/.claude/settings.json') do
  to File.expand_path('../files/settings.json', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.claude/CLAUDE.md') do
  to File.expand_path('../files/CLAUDE.md', __FILE__)
  user node[:user]
  force true
end

link File.expand_path('~/.claude/commands') do
  to File.expand_path('../files/commands', __FILE__)
  user node[:user]
  force true
end
