sudo apt install -y curl
curl https://raw.githubusercontent.com/hoprnet/hopr-sh/master/setup-hoprd.sh --output setup-hoprd.sh
chmod +x setup-hoprd.sh
./setup-hoprd.sh
DEBUG=hopr* hoprd --init --rest --provider wss://xdai.poanetwork.dev/wss --admin 2>&1 | tee ~/hoprd-logs.txt
