# Server update
sudo apt update && sudo apt full-upgrade


# Install packages
sudo apt install curl tar wget

sudo apt install snapd
sudo snap install docker
curl https://www.espressosys.com/cape/docker-compose.yaml --output docker-compose.yaml
docker-compose pull
docker-compose up --detach
