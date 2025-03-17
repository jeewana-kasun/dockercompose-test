#/bin/sh/

echo "Automation Starting..."
echo "                "
echo "============================="
echo "[START] Updating packages..."
echo "============================="
# Update the Package Index
sudo apt update
echo "============================="
echo "[FINISH] Updating packages..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Remove existing git packages..."
echo "============================="
# Remove existing git packages
sudo apt remove git
echo "============================="
echo "[FINISH] Remove existing git packages..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Installing Git..."
echo "============================="
# Installing Git
sudo apt install git
echo "============================="
echo "[FINISH] Installing Git..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Remove existing docker..."
echo "============================="

# Stop docker service
sudo systemctl stop docker.service

# Disable docker service
sudo systemctl disable docker

# Remove docker installation packages
sudo apt remove --purge docker-ce docker-ce-cli containerd.io

# Auto Remove docker dependancies
sudo apt autoremove

# Delete docker configuration files
sudo rm -rf /var/lib/docker

echo "============================="
echo "[FINISH] Remove existing docker..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Install docker..."
echo "============================="

# Update the Package Index
sudo apt update

# Install Required Dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the Package Index
sudo apt update

# Install Docker CE (Community Edition)
sudo apt install docker-ce

# wait for 60 seconds
sleep 60

# Start and Enable Docker Service
sudo systemctl start docker
sudo systemctl enable docker

# Check Docker service status
sudo systemctl status docker

# Run Docker as a Non-root User (Optional)
sudo usermod -aG docker $USER

echo "============================="
echo "[FINISH] Install docker..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Cloning SourceCode Repository..."
echo "============================="

# Create new folders
sudo mkdir SourceCode

# Go into new folder
cd SourceCode

# Clone the source code repository 
echo "Please enter your repo URL:"
read repoUrl
sudo git clone $repoUrl

echo "============================="
echo "[FINISH] Cloning SourceCode Repository..."
echo "============================="
echo "                "

echo "============================="
echo "[START] Run Docker Compose..."
echo "============================="

# Go into new repository folder
echo "Please enter your repo Name:"
read repoName
sudo cd $repoName

# Run docker compose
sudo docker compose up -d

# List docker images
sudo docker image ls

# List docker containers
sudo docker ps

echo "============================="
echo "[FINISH] Run Docker Compose..."
echo "============================="
echo "                "