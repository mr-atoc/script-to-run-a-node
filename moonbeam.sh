tmux new -s moonbeam
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
echo Hi. What is your node name?
read nodeName
echo Continue with $nodeName
mkdir /var/lib/alphanet-data
chmod -R 777 /var/lib/alphanet-data
docker run --network="host" -v "/var/lib/alphanet-data:/data" \
purestake/moonbeam:v0.6.1 \
--base-path=/data \
--chain alphanet \
--name="$nodeName" \
--execution wasm \
--wasm-execution compiled \
-- \
--name="$nodeName (Embedded Relay)"
