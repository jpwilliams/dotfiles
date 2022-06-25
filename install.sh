#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # GitHub CLI
  # Install GitHub CLI
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

  sudo apt -y update
  sudo apt -y install build-essential gh
  sudo apt -y upgrade

  sudo apt update

fi

# Install Volta
curl https://get.volta.sh | bash

# I can't seem to get Volta to work without this
VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || PATH="$VOLTA_HOME/bin:$PATH"