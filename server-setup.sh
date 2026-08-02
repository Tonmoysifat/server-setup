#!/bin/bash

# ==========================================
#   Fresh Server Setup Script
#   Node.js + PM2 + Nginx + Git + UFW
# ==========================================

echo "=========================================="
echo "  Server setup shuru hocche..."
echo "=========================================="

# --- 1. Package tolika halnagad ---
echo ""
echo ">> [1/6] Package tolika halnagad hocche..."
sudo apt update && sudo apt upgrade -y

# --- 2. Joruri tool (curl, git) ---
echo ""
echo ">> [2/6] curl o git install hocche..."
sudo apt install -y curl git

# --- 3. Node.js (NodeSource diye) ---
echo ""
echo ">> [3/6] Node.js install hocche..."
if command -v node &> /dev/null; then
    echo "Node.js age thekei ache: $(node --version)"
else
    curl -fsSL https://deb.nodesource.com/setup_24.x | sudo bash -
    sudo apt install -y nodejs
    echo "Node.js install holo: $(node --version)"
fi

# --- 4. PM2 (global) ---
echo ""
echo ">> [4/6] PM2 install hocche..."
if command -v pm2 &> /dev/null; then
    echo "PM2 age thekei ache"
else
    sudo npm install -g pm2
    echo "PM2 install holo"
fi

# --- 5. Nginx ---
echo ""
echo ">> [5/6] Nginx install hocche..."
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# --- 6. UFW firewall ---
echo ""
echo ">> [6/6] Firewall setup hocche..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable

echo ""
echo "=========================================="
echo "  ✅ Server setup sompurno!"
echo "=========================================="
echo ""
echo "Version check:"
echo "  Node: $(node --version)"
echo "  npm:  $(npm --version)"
echo "  Nginx: $(nginx -v 2>&1)"
