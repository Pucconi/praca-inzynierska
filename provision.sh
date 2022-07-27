apt-get update -y
apt-get upgrade -y
apt-get install net-tools -y
apt-get install mc -y
DEBIAN_FRONTEND=noninteractive apt-get install mariadb-server -y
mysql_secure_installation  <<EOF

n
y
T7zGwUrURNNk35%N
T7zGwUrURNNk35%N
y
y
y
y
EOF
mysql -u root -pT7zGwUrURNNk35%N -e "show databases;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikacja_back'@'%' IDENTIFIED BY 'J234re5GT4s2agAv';"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikacja_front'@'%' IDENTIFIED BY 'nTwqXK2AS34nGg8X';"