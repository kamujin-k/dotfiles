mv ~/.ssh/id_rsa ~/.ssh/id_rsa_bak 
mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub_bak

ssh-keygen -t rsa
ssh-add ~/.ssh/id_rsa
pub=`cat ~/.ssh/id_rsa.pub`
read -p "Enter github username: " githubuser
echo "Using username $githubuser"
read -p "Enter github password for user $githubuser: " githubpass
curl -u "$githubuser:$githubpass" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys
