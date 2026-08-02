#!/bin/bash

# ==========================================
#   Fresh Server Setup Script
#   Node.js + PM2 + Nginx + Git + UFW
#   + /var/www + MongoDB Tools + Certbot
# ==========================================

echo "=========================================="
echo "  Server setup shuru hocche..."
echo "=========================================="

# --- 1. Package tolika halnagad ---
echo ""
echo ">> [1/9] Package tolika halnagad hocche..."
sudo apt update && sudo apt upgrade -y

# --- 2. Joruri tool (curl, git) ---
echo ""
echo ">> [2/9] curl o git install hocche..."
sudo apt install -y curl git

# --- 3. Node.js (NodeSource diye) ---
echo ""
echo ">> [3/9] Node.js install hocche..."
if command -v node &> /dev/null; then
    echo "Node.js age thekei ache: $(node --version)"
else
    curl -fsSL https://deb.nodesource.com/setup_24.x | sudo bash -
    sudo apt install -y nodejs
    echo "Node.js install holo: $(node --version)"
fi

# --- 4. PM2 (global) ---
echo ""
echo ">> [4/9] PM2 install hocche..."
if command -v pm2 &> /dev/null; then
    echo "PM2 age thekei ache"
else
    sudo npm install -g pm2
    echo "PM2 install holo"
fi

# --- 5. Nginx ---
echo ""
echo ">> [5/9] Nginx install hocche..."
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# --- 6. /var/www folder banano o ownership neya ---
echo ""
echo ">> [6/9] /var/www folder setup hocche..."
sudo mkdir -p /var/www
sudo chown -R $USER:$USER /var/www
echo "/var/www toiri, owner: $USER"

# --- 7. MongoDB Database Tools (mongodump/mongorestore) ---
echo ""
echo ">> [7/9] MongoDB Database Tools install hocche..."
if command -v mongodump &> /dev/null; then
    echo "MongoDB tools age thekei ache"
else
    curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
    sudo apt update
    sudo apt install -y mongodb-database-tools
    echo "MongoDB tools install holo"
fi

# --- 8. Certbot (HTTPS / SSL er jonno) ---
echo ""
echo ">> [8/9] Certbot install hocche..."
sudo apt install -y certbot python3-certbot-nginx
echo "Certbot install holo (domain thakle: sudo certbot --nginx -d example.com)"

# --- 9. UFW firewall ---
echo ""
echo ">> [9/9] Firewall setup hocche..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

echo ""
echo "=========================================="
echo "  ✅ Server setup sompurno!"
echo "=========================================="
echo ""
echo "Version check:"
echo "  Node:      $(node --version)"
echo "  npm:       $(npm --version)"
echo "  Nginx:     $(nginx -v 2>&1)"
echo "  mongodump: $(mongodump --version | head -n 1)"
echo "  Certbot:   $(certbot --version 2>&1)"
