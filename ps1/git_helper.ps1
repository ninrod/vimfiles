class git_helper {
    static [string]build_git_url($repo_name) {
        return "https://github.com/" + $repo_name + ".git"
    }

    static [void]ningrab($name) {
        $tail = [git_helper]::tail($name)
        log "attempting to clone $name. verifying if it was cloned."
        if (!(Test-Path -Path $tail)) {
            log "$name does was not cloned. cloning..."
            $clone_url = [git_helper]::build_git_url($name)
            git clone --depth 1 $clone_url
        } else {
            log "$name already cloned. nothing to do"
        }
    }

    static [void]curl($uri, $dst) {
        $client = new-object System.Net.WebClient
        $client.DownloadFile($uri, $dst)
    }

    static [string]tail($repo_name) {
        return $repo_name.Split("/")[1]
    }
}