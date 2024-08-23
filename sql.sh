#!/bin/bash
ROOT_USER="root"
NEW_USER="sajan"
NEW_PASSWORD="lamp"
DATABASE_NAME="sajan_db"
TABLE_NAME="contacts"

# Creating a New user with all privileges
mysql -u$ROOT_USER -e "CREATE USER '$NEW_USER'@'localhost' IDENTIFIED BY '$NEW_PASSWORD';"
mysql -u$ROOT_USER -e "GRANT ALL PRIVILEGES ON *.* TO '$NEW_USER'@'localhost' WITH GRANT OPTION;"
mysql -u$ROOT_USER -e "FLUSH PRIVILEGES;"

echo "$NEW_USER user successfully created with all privileges..."

# Creating a Database and table from new user
mysql -u$NEW_USER -p$NEW_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u$NEW_USER -p$NEW_PASSWORD -D $DATABASE_NAME -e "CREATE TABLE IF NOT EXISTS $TABLE_NAME (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);"

echo "$DATABASE_NAME database and $TABLE_NAME table successfully created"

