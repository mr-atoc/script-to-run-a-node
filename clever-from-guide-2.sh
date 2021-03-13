
echo Hi. What is your node name?
read nodeName
echo Continue with $nodeName

~/clover/target/release/clover --chain specs/clover-cc1-raw.json --ws-external --rpc-cors all --name "$nodeName"
