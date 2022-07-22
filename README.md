# praca-inzynierska

## Przygotowanie maszyny wirtualnej

3306

```
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
sudo mysql -u root -pT7zGwUrURNNk35%N -e "show databases;"
```





## Notaki
- Doczytaj jak provissioning przenieśc do pliku
- https://www.vagrantup.com/docs/provisioning/shell