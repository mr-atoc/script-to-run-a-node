
echo Hi. What is your node name?
read nodeName
echo Continue with $nodeName
~/clover/target/release/clover --chain ~/clover/specs/clover-cc1-raw.json --ws-external --rpc-cors all --port 30333 --ws-port 9944 --rpc-port 9933 --rpc-methods=Unsafe --validator --unsafe-ws-external --unsafe-rpc-external --name "$nodeName"
