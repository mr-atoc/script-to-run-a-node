# Download the nodesource PPA for Node.js
curl https://deb.nodesource.com/setup_12.x | sudo bash

# Download the Yarn repository configuration
# See instructions on https://legacy.yarnpkg.com/en/docs/install/
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Update Ubuntu
sudo apt update
sudo apt upgrade -y

# Install Node.js, Yarn, and build tools
# Install jq for formatting of JSON data
sudo apt install nodejs=12.* yarn build-essential jq -y
# First remove any existing old Go installation
sudo rm -rf /usr/local/go

# Install correct Go version
curl https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz | sudo tar -C/usr/local -zxvf -

# Update environment variables to include go
cat <<'EOF' >>$HOME/.profile
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
EOF
source $HOME/.profile
go version
git clone https://github.com/vegaprotocol/go-wallet.git go-wallet
echo Stop to check folder structure
read test
(cd go-wallet && make)
echo Hi. What is your wallet-name?
read walletName
echo Continue with key name $walletName
cd go-wallet
go-wallet genkey -n "$walletName"
echo Wallet generated copy output and press enter
read test1
go-wallet service init
go-wallet service run
