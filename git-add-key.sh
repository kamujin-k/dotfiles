

if [ ! -e ~/.ssh/id_rsa_github ]; then
    # ssh-keygen -t rsa
    ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_github -q -N ""
    ssh-add ~/.ssh/id_rsa_github

    pub=`cat ~/.ssh/id_rsa_github.pub`

    read -p "Enter github username: " githubuser
    echo "Using username $githubuser"

    read -s -p "Enter github password for user $githubuser: " githubpass

    curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys
fi
