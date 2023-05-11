#!/bin/bash
Red='\033[0;31m'
NC='\033[0m'
Green='\033[0;32m'
Blue='\033[0;34m'
Distrib='Unknown'

Help="./install.sh [--help or -h]"

if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    printf "${Blue}${Help}${NC}\n"
    exit 0
fi

printf "${Blue}Installing snap packages${NC}\n"

sudo snap help refresh
sudo snap install code --classic
sudo snap install discord
sudo snap install gitkraken --classic
sudo snap install spotify
sudo snap install gimp
sudo snap install postman

extensions_list=(
    "ms-vscode.cpptools" # C/C++ Extension Pack
    "GitHub.copilot-nightly" # GitHub Copilot Nightly
    "ms-python.python" # Python
    "tomoki1207.pdf" # VSCode PDF
    "shardulm94.trailing-spaces" # Trailing Spaces
    "ms-azuretools.vscode-docker" # Docker
    "mechatroner.rainbow-csv" # Rainbow CSV
    "cschlosser.doxdocgen" # Doxygen Documentation Generator
    "nicolaspolomack.epitech-c-cpp-headers" # Epitech C/C++ Headers
    "MS-CEINTL.vscode-language-pack-fr" # French Language Pack for Visual Studio Code
    "ritwickdey.LiveServer" # Live Server
    "MS-vsliveshare.vsliveshare" # Live Share
    "haskell.haskell" # Haskell
    "justusadam.language-haskell" # Haskell Syntax Highlighting
    "Equinusocio.vsc-material-theme-icons" # Material Icon Theme
)

printf "${Blue}Installing VSCode extensions${NC}\n"
for extension in "${extensions_list[@]}"
do
    printf "${Blue}Installing ${extension}${NC}\n"
    code --install-extension $extension 2> /dev/null
    printf "${Green}Installed ${extension}${NC}\n"
done
printf "${Green}Installation complete${NC}\n"
