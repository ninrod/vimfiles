#fixpath
Set-Location $PSScriptRoot

. ./ps1/color.ps1
. ./ps1/git_helper.ps1

# setting up pathogen
$pathogen_dir = ".\autoload"
$pathogen_uri = "https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim"
$pathogen_dst = ".\autoload\pathogen.vim"
log "verifying if $pathogen_dir exist."
if(!(Test-Path -Path $pathogen_dir)) {
    log "$pathogen_dir does not exist, creating it."
    New-Item -ItemType directory -Path $pathogen_dir
    [git_helper]::curl($pathogen_uri, $pathogen_dst)
} else {
    log "$pathogen_dir found, exiting"
}

# # fetch core editing deps
# ningrab bronson/vim-visual-star-search
# ningrab chaoren/vim-wordmotion
# ningrab ervandew/supertab
# ningrab jiangmiao/auto-pairs
# ningrab ninrod/vim-multiple-cursors
# ningrab tommcdo/vim-exchange
# ningrab tpope/vim-commentary
# ningrab tpope/vim-pathogen
# ningrab tpope/vim-repeat
# ningrab tpope/vim-surround
# ningrab vim-scripts/ReplaceWithRegister
# ningrab wellle/targets.vim
# ningrab kana/vim-textobj-user
# ningrab kana/vim-textobj-entire

# # fetch cosmetic deps
# ningrab morhetz/gruvbox
# ningrab itchyny/lightline.vim