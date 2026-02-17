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

#git clone git@github.com:classikk/jetson_benchmark.git
#cd ./jetson_benchmark

sudo apt install python3
pip install uv
uv sync

git submodule update --init --recursive

sudo apt-get install tmux


# FROM https://nvidia-isaac-ros.github.io/v/release-3.1/getting_started/dev_env_setup.html
sudo systemctl daemon-reload && sudo systemctl restart docker

sudo apt-get install git-lfs
git lfs install --skip-repo

mkdir -p  ~/workspaces/isaac_ros-dev/src
echo "export ISAAC_ROS_WS=${HOME}/workspaces/isaac_ros-dev/" >> ~/.bashrc
source ~/.bashrc


#https://nvidia-isaac-ros.github.io/v/release-3.1/getting_started/isaac_apt_repository.html
locale

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale

sudo apt update && sudo apt install gnupg wget
sudo apt install software-properties-common
sudo add-apt-repository universe

wget -qO - https://isaac.download.nvidia.com/isaac-ros/repos.key | sudo apt-key add -
grep -qxF "deb https://isaac.download.nvidia.com/isaac-ros/release-3 $(lsb_release -cs) legacy-release-3.1" /etc/apt/sources.list || \
echo "deb https://isaac.download.nvidia.com/isaac-ros/release-3 $(lsb_release -cs) legacy-release-3.1" | sudo tee -a /etc/apt/sources.list
sudo apt-get update

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

#Install core ROS 2 Packages
sudo apt update

sudo apt install ros-humble-desktop-full

sudo apt install ros-dev-tools


curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker $USER && newgrp docker

git lfs fetch --all

git lfs checkout

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml

ros2_ws/start_isaac_dev.sh