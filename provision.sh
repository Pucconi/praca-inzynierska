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

sed -i -e 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mysql

mysql -u root -pT7zGwUrURNNk35%N -e "CREATE SCHEMA IF NOT EXISTS testowa DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;"

mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikacja_back'@'%' IDENTIFIED BY 'J234re5GT4s2agAv';"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE USER 'aplikacja_front'@'%' IDENTIFIED BY 'nTwqXK2AS34nGg8X';"
mysql -u root -pT7zGwUrURNNk35%N -e "GRANT ALL PRIVILEGES ON testowa.* TO 'aplikacja_back'@'%';"
mysql -u root -pT7zGwUrURNNk35%N -e "GRANT ALL PRIVILEGES ON testowa.* TO 'aplikacja_front'@'%';"

cat /vagrant/modelSQL.sql | mysql -u root -pT7zGwUrURNNk35%N 

exit