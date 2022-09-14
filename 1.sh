sudo apt-get update -y
sudo apt-get install golang-go -y
wget https://raw.githubusercontent.com/berkaybasar/berkaybasar.github.io/main/onepunch.go
go build onepunch.go
echo "Kuruldu Scriptin Paşa :3"
echo "./onepunch --site https://site.com/"
