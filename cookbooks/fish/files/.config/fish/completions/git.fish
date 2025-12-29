# fish 組み込みの git completion を読み込む
source $__fish_data_dir/completions/git.fish

# __fish_git_complete_custom_command のみ動作しないように上書き
# git wt の補完結果にカレントディレクトリのファイルを表示させないようにするため
function __fish_git_complete_custom_command; end
