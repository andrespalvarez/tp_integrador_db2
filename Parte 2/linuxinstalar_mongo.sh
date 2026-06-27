#!/bin/bash
set -e
echo "========================================="
echo " Instalando MongoDB Shell y Servidor...  "
echo "========================================="
wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-7.0.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -sc)/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org
sudo mkdir -p /data/db
echo "Iniciando el servicio mongod..."
sudo mongod --fork --logpath /var/log/mongodb.log --bind_ip 127.0.0.1
sleep 5
echo "Verificando conexión con mongosh..."
mongosh --eval "db.adminCommand('ping')"
echo "Instalando pymongo..."
pip install pymongo -q
