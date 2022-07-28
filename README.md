# praca-inzynierska

## Przygotowanie maszyny wirtualnej

3306

```

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
```





SET PASSWORD FOR 'aplikacja_front'@'%' = PASSWORD('nTwqXK2AS34nGg8X');
ALTER USER aplikacja_front@% IDENTIFIED BY PASSWORD 'nTwqXK2AS34nGg8X';
ALTER USER aplikacja_front@% IDENTIFIED BY 'nTwqXK2AS34nGg8X';

## Notaki
- Doczytaj jak provissioning przenieśc do pliku
- https://www.vagrantup.com/docs/provisioning/shell
- jak zakładać urzytkowników w mysql
- założyć aplikajca_back i aplikacja_front
- z dowolnego hosta %

vagrant debian provission
mikr.us -vps

*netstat -tupan*


----------------------------------------------------
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
-------------------------------------------------------------

sed -i -e 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mysql
