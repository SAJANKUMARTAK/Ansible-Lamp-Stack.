#!/bin/bash
# Automate mysql_secure_installation

mysql_secure_installation <<EOF
# Enter current root password for the MySQL server (empty for no current password).

# Switch to unix_socket authentication? (no).
n
# Change the root password? (no).
n
# Remove anonymous users? (yes).
y
# Disallow root login remotely? (yes).
y
# Remove the test database and access to it? (yes).
y
# Reload privilege tables now? (yes).
y
EOF

echo "mysql_secure_installation sucessfully done.."
