goget 'github.com/Ladicle/git-prompt'
goget 'github.com/ariarijp/crontoc'
goget 'github.com/atotto/clipboard/cmd/gocopy' do
  binary_name 'gocopy'
end
goget 'github.com/atotto/clipboard/cmd/gopaste' do
  binary_name 'gopaste'
end
# Workarond: github.com/mdempsky/gocode is not support Go 1.11 modules
goget 'github.com/ikgo/gocode'
goget 'github.com/sourcegraph/go-langserver'
goget 'golang.org/x/lint/golint'
goget 'golang.org/x/tools/cmd/goimports' do
  binary_name 'goimports'
end
goget 'golang.org/x/tools/cmd/golsp' do
  binary_name 'golsp'
end
