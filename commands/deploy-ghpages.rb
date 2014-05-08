name        'deploy-ghpages'
usage       'deploy-ghpages'
aliases     :ghpages
summary     'deploys to GitHub Pages'
description <<-DESC 
Deploys to GitHub Pages.
DESC

flag :h, :help, 'show help for this command' do |value, cmd|
  puts cmd.help
  exit 0
end

run do |opts, args, cmd|
  system 'git subtree push --prefix output origin gh-pages'
end