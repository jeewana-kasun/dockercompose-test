sudo systemctl stop docker.service
sudo systemctl disable docker
sudo apt remove --purge docker-ce docker-ce-cli containerd.io
sudo apt autoremove
sudo rm -rf /var/lib/docker













sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

Run Docker as a Non-root User (Optional)
sudo usermod -aG docker $USER
