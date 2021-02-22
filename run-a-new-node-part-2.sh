echo Hi. Enter IP address
read ip
echo Continue with $ip
source ~/.bashrc
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy
npm install --global yarn
sudo apt  install cargo
git clone https://github.com/radicle-dev/radicle-bins.git
cd radicle-bins
git checkout f1462b92a06ef65ec4b65201e9801473a41b4ee3
(cd seed/ui && yarn && yarn build)
mkdir -p ~/.radicle-seed 
cargo run -p radicle-keyutil -- --filename ~/.radicle-seed/secret.key
cargo run -p radicle-seed-node --release -- --root ~/.radicle-seed --peer-listen 0.0.0.0:12345 --http-listen 0.0.0.0:80 --name "seedling" --public-addr "$ip:12345" --assets-path seed/ui/public < ~/.radicle-seed/secret.key
