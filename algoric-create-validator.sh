echo Hi. What is your key-name?
read keyName
echo Continue with key name $keyName
ag-cosmos-helper keys add $keyName
echo Checking balance
ag-cosmos-helper query bank balances `ag-cosmos-helper keys show -a $keyName`
ag-chain-cosmos tendermint show-validator
