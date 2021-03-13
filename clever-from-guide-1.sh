# обновляем 'базу данных' и скачиваем необходимые зависимости

cd && sudo apt-get update
sudo apt-get upgrade -y
sudo apt install cmake pkg-config libssl-dev git build-essential clang libclang-dev curl libz-dev tmux -y

# устанавливаем 'rustup-nightly'

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh #Enter
source $HOME/.cargo/env
rustup install nightly-2020-09-25
rustup default nightly-2020-09-25
rustup target add wasm32-unknown-unknown --toolchain nightly-2020-09-25
git clone https://github.com/clover-network/clover clover
cd clover
cargo build --release
