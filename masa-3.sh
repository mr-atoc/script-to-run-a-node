cd ~
git clone https://github.com/masa-finance/masa-oracle-go-testnet.git
cd masa-oracle-go-testnet
go build -v -o masa-node ./cmd/masa-node
./masa-node --start
