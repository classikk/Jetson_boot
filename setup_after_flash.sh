#!bin/bash

echo "This script expect you to have a newly flashed Jetson Nano orin."
echo "If not please abort"
read -p "Continnue dev enviroment set up?" 

cd ~/
sudo apt-get update 

snap download snapd --revision=24724
sudo snap ack snapd_24724.assert
sudo snap install snapd_24724.snap
sudo sudo snap refresh --hold snapd

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

#git clone git@github.com:classikk/jetson_benchmark.git
#cd ./jetson_benchmark

sudo apt install python3
pip install uv
uv sync

git submodule update --init --recursive

sudo apt-get install tmux

sudo apt-get install git-lfs
git lfs install --skip-repo
git lfs fetch --all

git lfs checkout
cd ./ros2_ws
./start_isaac_dev.sh 


#curl -sSL https://get.docker.com/ | sh

#sudo usermod -aG docker $USER && newgrp docker

#git lfs fetch --all

#git lfs checkout

#sudo apt-get update
#sudo apt-get install -y nvidia-container-toolkit
#sudo nvidia-ctk runtime configure --runtime=docker
#sudo systemctl restart docker

#sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml

#ros2_ws/start_isaac_dev.sh