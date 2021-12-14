sudo apt-get update && sudo apt-get upgrade -y
# скачиваем докер одной командой

sudo apt-get install curl gnupg apt-transport-https ca-certificates \
lsb-release -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# если не работает команда, гуглите 'how to install docker on ubuntu'
# включаем 'docker'

sudo systemctl start docker && sudo systemctl enable docker
# запуск 'avalanche'

echo Enter MM PK address
read mmpk

echo Enter stake amount for each pools address
read amount

docker pull kyve/evm:latest && \
docker stop kyve-avalanche-node 2>/dev/null; \
docker container rm kyve-avalanche-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-avalanche-node kyve/evm:latest \
--pool 0x464200b29738367366FDb4c45f3b8fb582AE0Bf8 \
--private-key $mmpk \
--stake $amount
# запуск 'moonriver'

docker pull kyve/evm:latest && \
docker stop kyve-moonriver-node 2>/dev/null; \
docker container rm kyve-moonriver-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-moonriver-node kyve/evm:latest \
--pool 0x610D55fA573Bce4D2d36e8ADAAee517B785a69dF \
--private-key $mmpk \
--stake $amount
# запуск 'cosmos'

docker pull kyve/cosmos:latest && \
docker stop kyve-cosmos-node 2>/dev/null; \
docker container rm kyve-cosmos-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-cosmos-node kyve/cosmos:latest \
--pool 0x7Bb18C81BBA6B8dE8C17B97d78B65327024F681f \
--private-key $mmpk \
--stake $amount
# запуск 'celo'

docker pull kyve/celo:latest && \
docker stop kyve-celo-node 2>/dev/null; \
docker container rm kyve-celo-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-celo-node kyve/celo:latest \
--pool 0x1588fd93715Aa08d67c32C6dF96fC730B15E1E1A \
--private-key $mmpk \
--stake $amount
# запуск 'solana'

docker pull kyve/solana-snapshots:latest && \
docker stop kyve-solana-node 2>/dev/null; \
docker container rm kyve-solana-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-solana-node kyve/solana-snapshots:latest \
--pool 0x3124375cA4de5FE5afD672EF2775c6bdcA1Cfdcc \
--private-key $mmpk \
--stake $amount
# запуск 'evmos_evm'

docker pull kyve/evm:latest && \
docker stop kyve-evmos_evm-node 2>/dev/null; \
docker container rm kyve-evmos_evm-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-evmos_evm-node kyve/evm:latest \
--pool 0x24E7b48c3a6E40ea0e50764E617906c9B7cf9F21 \
--private-key $mmpk \
--stake $amount
# запуск 'evmos_tendermint'

docker pull kyve/cosmos:latest && \
docker stop kyve-evmos_tendermint-node 2>/dev/null; \
docker container rm kyve-evmos_tendermint-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-evmos_tendermint-node kyve/cosmos:latest \
--pool 0xAa3337d1f8F72D544f3843B2089d2DA02BBcbD28 \
--private-key $mmpk \
--stake $amount
