# http://blog.shibayu36.org/entry/2014/07/26/151106

function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco)
    if [ -n "$selected_branch" ]; then
        git checkout ${selected_branch}
    fi
}
