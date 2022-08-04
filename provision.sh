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
sed -i -e 's/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
systemctl restart mysql
mysql -u root -pT7zGwUrURNNk35%N -e "SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;"
mysql -u root -pT7zGwUrURNNk35%N -e "SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;"
mysql -u root -pT7zGwUrURNNk35%N -e "SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE SCHEMA IF NOT EXISTS testowa DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;"
mysql -u root -pT7zGwUrURNNk35%N -e "USE testowa ;"
mysql -u root -pT7zGwUrURNNk35%N -e "DROP TABLE IF EXISTS testowa.status_zamowienia ;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE TABLE IF NOT EXISTS testowa.status_zamowienia (id INT NOT NULL,nazwa VARCHAR(45) NOT NULL,PRIMARY KEY (id),UNIQUE INDEX nazwa_UNIQUE (nazwa ASC))ENGINE = InnoDB;"
mysql -u root -pT7zGwUrURNNk35%N -e "DROP TABLE IF EXISTS testowa.zamowienie ;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE TABLE IF NOT EXISTS testowa.zamowienie (id INT(11) NOT NULL AUTO_INCREMENT,status_zamowienia_id INT NOT NULL,created_at DATETIME NOT NULL DEFAULT current_timestamp(),modified_at DATETIME NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Data i godzina utwożenia zamówienia',PRIMARY KEY (id),INDEX fk_zamowienia_status_zamowienia_idx (status_zamowienia_id ASC),CONSTRAINT fk_zamowienia_status_zamowienia FOREIGN KEY (status_zamowienia_id)REFERENCES testowa.status_zamowienia (id) ON DELETE NO ACTION ON UPDATE NO ACTION) ENGINE = InnoDB;"
mysql -u root -pT7zGwUrURNNk35%N -e "DROP TABLE IF EXISTS testowa.danie_podstawowe ;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE TABLE IF NOT EXISTS testowa.danie_podstawowe (id INT NOT NULL,nazwa VARCHAR(45) NOT NULL,cena_netto INT NOT NULL,stawka_vat INT NOT NULL COMMENT 'Stawka podatku VAT wyrażona w procentach',PRIMARY KEY (id))ENGINE = InnoDB;"
mysql -u root -pT7zGwUrURNNk35%N -e "DROP TABLE IF EXISTS testowa.dodatek ;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE TABLE IF NOT EXISTS testowa.dodatek (id INT NOT NULL,nazwa VARCHAR(45) NOT NULL,cena_netto INT NOT NULL,stawka_vat INT NOT NULL COMMENT 'Stawka podatku VAT wyrażona w procentach',PRIMARY KEY (id))ENGINE = InnoDB;"
mysql -u root -pT7zGwUrURNNk35%N -e "DROP TABLE IF EXISTS testowa.pozycja_zamowienia ;"
mysql -u root -pT7zGwUrURNNk35%N -e "CREATE TABLE IF NOT EXISTS testowa.pozycja_zamowienia (zamowienie_id INT(11) NOT NULL,danie_podstawowe_id INT NOT NULL,INDEX fk_pozycja_zamowienia_danie_podstawowe1_idx (danie_podstawowe_id ASC),INDEX fk_pozycja_zamowienia_zamowienie1_idx (zamowienie_id ASC), CONSTRAINT fk_pozycja_zamowienia_danie_podstawowe1 FOREIGN KEY (danie_podstawowe_id) REFERENCES testowa.danie_podstawowe (id) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT fk_pozycja_zamowienia_zamowienie1 FOREIGN KEY (zamowienie_id) REFERENCES testowa.zamowienie (id) ON DELETE NO ACTION ON UPDATE NO ACTION) ENGINE = InnoDB;"
mysql -u root -pT7zGwUrURNNk35%N -e "START TRANSACTION;"
mysql -u root -pT7zGwUrURNNk35%N -e "USE testowa;"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.status_zamowienia (id, nazwa) VALUES (1, 'w trakcie składania');"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.status_zamowienia (id, nazwa) VALUES (2, 'oczekujące na płatność');"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.status_zamowienia (id, nazwa) VALUES (3, 'opłacone');"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.status_zamowienia (id, nazwa) VALUES (4, 'anulowane');"
mysql -u root -pT7zGwUrURNNk35%N -e "COMMIT;"
mysql -u root -pT7zGwUrURNNk35%N -e "START TRANSACTION;"
mysql -u root -pT7zGwUrURNNk35%N -e "USE testowa;"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.zamowienie (id, status_zamowienia_id, created_at, modified_at) VALUES (1, 1, DEFAULT, DEFAULT);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.zamowienie (id, status_zamowienia_id, created_at, modified_at) VALUES (2, 2, DEFAULT, DEFAULT);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.zamowienie (id, status_zamowienia_id, created_at, modified_at) VALUES (3, 4, DEFAULT, DEFAULT);"
mysql -u root -pT7zGwUrURNNk35%N -e "COMMIT;"
mysql -u root -pT7zGwUrURNNk35%N -e "START TRANSACTION;"
mysql -u root -pT7zGwUrURNNk35%N -e "USE testowa;"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (1, 'jasne z szynką', 10, 23);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (2, 'ciemne z szynką', 10, 8);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (3, 'jasne z serem', 8, 23);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (4, 'ciemne z serem', 8, 8);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (5, 'jasne z bekonem', 9, 23);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (6, 'ciemne z bekonem', 9, 23);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (7, 'jasne z kurczakiem', 14, 8);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (8, 'ciemne z kurczakiem', 14, 8);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (9, 'jasne z indykiem', 12, 15);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.danie_podstawowe (id, nazwa, cena_netto, stawka_vat) VALUES (10, 'ciemne z indykiem', 12, 15);"
mysql -u root -pT7zGwUrURNNk35%N -e "COMMIT;"
mysql -u root -pT7zGwUrURNNk35%N -e "START TRANSACTION;"
mysql -u root -pT7zGwUrURNNk35%N -e "USE testowa;"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.pozycja_zamowienia (zamowienie_id, danie_podstawowe_id) VALUES (1, 1);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.pozycja_zamowienia (zamowienie_id, danie_podstawowe_id) VALUES (1, 2);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.pozycja_zamowienia (zamowienie_id, danie_podstawowe_id) VALUES (2, 3);"
mysql -u root -pT7zGwUrURNNk35%N -e "INSERT INTO testowa.pozycja_zamowienia (zamowienie_id, danie_podstawowe_id) VALUES (3, 4);"
mysql -u root -pT7zGwUrURNNk35%N -e "COMMIT;"