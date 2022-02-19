# stop node
sudo systemctl stop celestia-full

# query current block
TRUSTED_HASH=$(curl -s $TRUSTED_SERVER/status | jq -r .result.sync_info.latest_block_hash)

# check
echo $TRUSTED_HASH

# init
celestia full init --core.remote $TRUSTED_SERVER --headers.trusted-hash $TRUSTED_HASH

# start
sudo systemctl restart celestia-full && journalctl -u celestia-full -o cat -f
