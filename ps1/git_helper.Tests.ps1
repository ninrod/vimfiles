
# standard pester header
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".Tests.", ".")
. "$here\$sut"
 
Describe "git_helper" {
    It "should return the correct git url" {
        $expected = "https://github.com/bronson/vim-visual-star-search.git"
        [git_helper]::build_git_url("bronson/vim-visual-star-search") | Should Be $expected
    }
}