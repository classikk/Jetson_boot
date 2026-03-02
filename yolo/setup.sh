sudo apt install python3.10-venv

python -m newTestVenv ./newTestVenv

source ./newTestVenv/bin/activate

pip install torch-2.9.1-cp310-cp310-linux_aarch64.whl

pip install torchvision-0.24.1-cp310-cp310-linux_aarch64.whl

pip install ultralytics

# https://forums.developer.nvidia.com/t/pytorch-for-jetson/72048


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/arm64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cudss


