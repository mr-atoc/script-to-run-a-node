sudo apt update && sudo apt upgrade -y
sudo apt install -y vim nano git curl wget htop zip unzip ufw locales net-tools mc jq make gcc gpg build-essential ncdu sysstat tmux

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/installers/golang.sh)

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "tmux could not be found, please install it."
    exit 1
fi

# Start a new tmux session and detach from it
SESSION_NAME="my_session"
tmux new-session -d -s $SESSION_NAMEмин

# Create a new window in the tmux session
WINDOW_NAME="my_window"
tmux new-window -t $SESSION_NAME -n $WINDOW_NAME

# Execute your script or command in the new window
tmux send-keys -t "$SESSION_NAME:$WINDOW_NAME" ". <(wget -qO- https://raw.githubusercontent.com/mr-atoc/script-to-run-a-node/main/masa-3.sh)" C-m

# Attach to the tmux session
tmux attach-session -t $SESSION_NAME
