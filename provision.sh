sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install net-tools -y
sudo apt-get install mc -y
sudo apt-get install mysql-server -y
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'T7zGwUrURNNk35%N';"
sudo mysql_secure_installation -p'T7zGwUrURNNk35%N' <<EOF

n
y
y
y
y
EOF
sudo mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikajca_back'@'%' IDENTIFIED BY 'J234re5GT4s2agAv';"
sudo mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikajca_front'@'%' IDENTIFIED BY 'nTwqXK2AS34nGg8X';"