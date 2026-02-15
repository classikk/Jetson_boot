#!bin/bash

echo "This script expect you to have a newly flashed Jetson Nano orin."
echo "If not please abort"
read -p "Continnue dev enviroment set up?" 

cd ~/
sudo apt-get update 
sudo apt-get install firefox

sudo apt-get install curl
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64" -o vscode.deb 
sudo apt-get install ./vscode.deb 
rm ./vscode.deb

ssh-keygen -t ed25519
echo "copy this to git for ssh git pushes: "
cat ~/.ssh/id_ed25519.pub

read -p "Using firefox add public key to ssh keys, once done press Enter to continue"
echo "testing clone with ssh"
git clone git@github.com:CatScanners/find-my-kitten.git
cd ./find-my-kitten
echo "repo has been cloned"

read -p "Enter your email: " email 
read -p "Enter your name: " name 
git config --global user.email "$email" 
git config --global user.name "$name" 
echo "Git global config updated."

#cat /etc/nvpmodel.conf
#sudo nvpmodel -m <insert max>

./simulation/setup.sh

sudo apt-get install tmux