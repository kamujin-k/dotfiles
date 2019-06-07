# Create my usual projects directory structure
mkdir -p projects/meu
mkdir -p projects/b2w

# Update apt...
sudo apt update

# Basics
sudo apt install curl\
                 wget\
                 httpie\
                 neovim\
                 git\
                 tmux\
                 zsh\
                 docker.io\
		 terminator\
		 copyq\
		 -y

# VSCode
sudo apt install software-properties-common apt-transport-https -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y
