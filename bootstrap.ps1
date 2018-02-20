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

log "ensuring bundle dir exists"
$pathogen_bundle_dir = "bundle"
if(!(Test-Path -Path $pathogen_bundle_dir)) {
    log "bundle dir $pathogen_bundle_dir does not exist. creating..."
    New-Item -ItemType directory -Path $pathogen_bundle_dir
} else {
    log "bundle dir $pathogen_bundle_dir exists. skipping creation."
}

# fetch core editing deps
Set-Location $PSScriptRoot\$pathogen_bundle_dir
[git_helper]::ningrab("bronson/vim-visual-star-search")
[git_helper]::ningrab("chaoren/vim-wordmotion")
[git_helper]::ningrab("ervandew/supertab")
[git_helper]::ningrab("jiangmiao/auto-pairs")
[git_helper]::ningrab("terryma/vim-multiple-cursors")
[git_helper]::ningrab("tommcdo/vim-exchange")
[git_helper]::ningrab("tpope/vim-commentary")
[git_helper]::ningrab("tpope/vim-pathogen")
[git_helper]::ningrab("tpope/vim-repeat")
[git_helper]::ningrab("tpope/vim-surround")
[git_helper]::ningrab("vim-scripts/ReplaceWithRegister")
[git_helper]::ningrab("wellle/targets.vim")
[git_helper]::ningrab("kana/vim-textobj-user")
[git_helper]::ningrab("kana/vim-textobj-entire")

# fetch cosmetic deps
[git_helper]::ningrab("morhetz/gruvbox")
[git_helper]::ningrab("itchyny/lightline.vim")