sudo systemctl stop celestia-light
TRUSTED_HASH=$(curl -s $TRUSTED_SERVER/status | jq -r .result.sync_info.latest_block_hash)
echo $TRUSTED_HASH $TRUSTED_PEER
rm -rf $HOME/.celestia-light
celestia light init --headers.trusted-peer $TRUSTED_PEER --headers.trusted-hash $TRUSTED_HASH
sudo systemctl restart celestia-light && journalctl -u celestia-light -f -o cat
