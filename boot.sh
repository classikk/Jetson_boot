#!bin/bash

sudo apt-get update 
sudo apt-get install firefox

curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -o vscode.deb 
sudo apt-get install ./vscode.deb 
rm ./vscode.deb

ssh-keygen -t ed25519

echo "copy this to git for ssh git pushes: "
cat ~/.ssh/id_ed25519.pub