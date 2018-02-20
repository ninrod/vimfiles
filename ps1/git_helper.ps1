class git_helper {
    static [string]build_git_url($repo_name) {
        return "https://github.com/" + $repo_name + ".git"
    }
}