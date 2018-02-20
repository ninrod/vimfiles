class git_helper {
    static [string]build_git_url($repo_name) {
        return "https://github.com/" + $repo_name + ".git"
    }

    static [void]ningrab($name) {
        $clone_url = [git_helper]::build_git_url($name)
        git clone --depth 1 $clone_url
    }

    static [void]curl($uri, $dst) {
        $client = new-object System.Net.WebClient
        $client.DownloadFile($uri, $dst)
    }
}