#!/bin/sh

echo "Installing generic packages..."

# GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt -y update
sudo apt -y install build-essential gh exa

# `bat` isn't compatible with `ripgrep` in 20.04
# Below workaround allows both to be installed
# See https://github.com/sharkdp/bat/issues/938
sudo apt -y install -o Dpkg::Options::="--force-overwrite" bat ripgrep

sudo apt -y upgrade

echo "Installing Volta..."
curl https://get.volta.sh | bash
VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

echo "Installing latest Node.js"
volta install node

echo "Installing tldr"
volta install tldr

echo "Installing fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

