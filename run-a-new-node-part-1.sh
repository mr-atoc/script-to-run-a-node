sudo apt-get update
sudo apt-get install git
apt-get install -y npm
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs/ | sh
echo 'export PATH=$HOME/.cargo/bin:$PATH' >> ~/.bashrc 
source ~/.bashrc
bash --login
